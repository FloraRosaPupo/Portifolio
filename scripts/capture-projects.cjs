// Uses the real local applications and APIs. No HTTP response mocking.
// Usage: node scripts/capture-projects.cjs <path-to-playwright>
const { chromium } = require(process.argv[2] || 'playwright');
const fs = require('node:fs');
const path = require('node:path');

async function main() {
  fs.mkdirSync('captures', { recursive: true });
  const browser = await chromium.launch({ headless: true, channel: 'msedge' });
  for (const project of ['triagem', 'repomentor']) {
    const context = await browser.newContext({
      viewport: { width: 1440, height: 1000 },
      recordVideo: { dir: 'captures', size: { width: 1440, height: 1000 } },
      reducedMotion: 'reduce',
    });
    const page = await context.newPage();
    const hold = () => page.waitForTimeout(1800);
    if (project === 'triagem') {
      await page.goto('http://127.0.0.1:1234/?source=local');
      await page.locator('.ticket-card').first().waitFor();
      await hold();
      await page.getByRole('button', { name: 'Identificar assuntos', exact: true }).click();
      await page.locator('.theme-badge.acesso').first().waitFor();
      await hold();
      await page.screenshot({ path: 'assets/projects/triagem.png' });
      await page.locator('.ticket-title').first().click();
      await page.getByRole('dialog').waitFor();
      await hold();
      await page.keyboard.press('Escape');
      await page.getByRole('button', { name: 'Ver classificação', exact: true }).click();
      await hold();
      await page.getByRole('button', { name: 'Fechar classificação' }).click();
      await hold();
    } else {
      // Forward to the separate RepoMentor API; Triagem owns port 8000.
      await page.route('**/api/**', async route => {
        const url = new URL(route.request().url());
        const response = await route.fetch({ url: `http://127.0.0.1:8003${url.pathname}${url.search}` });
        await route.fulfill({ response });
      });
      await page.goto('http://127.0.0.1:5174');
      await page.getByLabel('Repositório GitHub').fill('FloraRosaPupo/repomentor');
      await page.getByLabel('Repositório GitHub').scrollIntoViewIfNeeded();
      await hold();
      await page.getByRole('button', { name: 'Cadastrar e explorar ↗' }).click();
      await page.locator('.issue-card').first().waitFor({ timeout: 90000 });
      await page.locator('.work-grid').scrollIntoViewIfNeeded();
      await hold();
      await page.locator('.issue-card').first().click();
      await page.locator('.description summary').click();
      await hold();
      await page.screenshot({ path: 'assets/projects/repomentor.png' });
      if (await page.locator('.issue-card').count() > 1) {
        await page.locator('.issue-card').nth(1).click();
        await hold();
      }
      await page.locator('.search input').fill('local');
      await hold();
      await page.locator('.search input').fill('');
      await hold();
    }
    const video = page.video();
    await context.close();
    await video.saveAs(path.resolve(`captures/${project}.webm`));
    console.log(`Captured ${project}`);
  }
  await browser.close();
}
main().catch(error => { console.error(error); process.exit(1); });
