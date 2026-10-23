const {test} = require('node:test');
const assert = require('node:assert/strict');
const vm = require('node:vm');
const fs = require('node:fs');
const path = require('node:path');
const source = fs.readFileSync(path.join(__dirname, '../web/flutter_bootstrap.js'), 'utf8').replace(/\{\{[^}]+\}\}/g, '');

for (const failure of [null, 'download', 'engine', 'application']) {
  test(`bootstrap handles ${failure || 'successful startup'}`, async () => {
    let fallback = false;
    let ran = false;
    const context = {
      console: {error() {}},
      window: {showStartupError() { fallback = true; }},
      _flutter: {buildConfig: {builds: [{mainJsPath: 'main.dart.js'}, {}]}, loader: {async load(options) {
        if (failure === 'download') throw Error('offline');
        await options.onEntrypointLoaded({async initializeEngine() {
          if (failure === 'engine') throw Error('engine failed');
          return {async runApp() {
            if (failure === 'application') throw Error('app failed');
            ran = true;
          }};
        }});
      }}},
    };
    await vm.runInNewContext(source, context);
    assert.equal(context._flutter.buildConfig.builds[0].mainJsPath, 'main.dart.js?v=dashboard-2');
    assert.equal(fallback, failure !== null);
    assert.equal(ran, failure === null);
  });
}
