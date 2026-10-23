{{flutter_js}}
{{flutter_build_config}}

for (const build of _flutter.buildConfig?.builds ?? []) {
  if (build.mainJsPath) build.mainJsPath += '?v=dashboard-2';
}

_flutter.loader.load({
  onEntrypointLoaded: async function(engineInitializer) {
    try {
      const appRunner = await engineInitializer.initializeEngine();
      await appRunner.runApp();
    } catch (error) {
      window.showStartupError();
      console.error('Portfolio initialization failed', error);
    }
  }
}).catch(function(error) {
  window.showStartupError();
  console.error('Portfolio loading failed', error);
});
