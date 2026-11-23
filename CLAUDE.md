# Portfólio (flora-rosa.web.app)

Portfólio profissional em **Flutter web** no Firebase Hosting. A página `/` destaca Engenharia de IA e o carrossel de projetos pessoais. A rota `/ia` traz os estudos de IA aplicada a negócios.

## Arquitetura
- `lib/main.dart`: `MaterialApp` com rotas nomeadas `'/'` → `PortfolioPage` e `'/ia'` → `AiPage`, mais localizações.
- `lib/features/portfolio/`:
  - `data/content.dart` (projetos, experiências, links) e `data/translations.dart` (textos PT/EN).
  - `presentation/portfolio_page.dart` (**cerca de 1.500 linhas**, a maior tela): extraia seções em widgets ao mexer.
  - `presentation/preferences.dart`: idioma e tema.
  - `motion.dart`: respeita reduced motion.
  - **Imports condicionais web/stub:** `preference_storage{,_web,_stub}.dart` (localStorage) e `project_preview{,_web,_stub}.dart` (vídeo HTML). Mantenha sempre o par `_web` e `_stub` para os testes rodarem na VM.
- `lib/features/ai/`:
  - `data/business_cases.dart`, `business_case_translations.dart`, `property_study.dart`.
  - `presentation/ai_page.dart` (cerca de 1.100 linhas).
- **Conteúdo é dado, não widget:** para adicionar ou alterar projeto, edite `data/content.dart` e as traduções, não a tela.
- Assets: `assets/projects/` (imagens), `web/previews/*.mp4` (vídeos curtos), fontes Montserrat.
- `scripts/`: `capture-*.cjs`/`.py` (prints e vídeos com Playwright), `encode-*.py`, `build-general-resume.py`, `ensure_hosting_site.py` (usado no deploy).
- Testes em `test/`:
  - `portfolio_test`, `ai_page_test`, `translations_test` (garante PT e EN completos), `preferences_test`, `project_visibility_test`, `recent_projects_test`, `portfolio_capture_test`.
  - `bootstrap_test.cjs` (Node, valida o `web/index.html`).

## Comandos (PowerShell)
```powershell
flutter pub get
flutter analyze --no-fatal-infos --no-fatal-warnings
flutter test
node --test test/bootstrap_test.cjs
flutter run -d chrome
flutter build web
```

## Deploy (Firebase Hosting via GitHub Actions)
- Projeto Firebase `portifolio-d00ca` (`.firebaserc`), com **dois sites** que recebem o mesmo `build/web`:
  - target `primary` → site `portifolio-d00ca`;
  - target `professional` → site `flora-rosa` (**flora-rosa.web.app**).
- `firebase.json`: SPA rewrite `** → /index.html`, `Cache-Control: no-cache` e redirect `/app-release.apk` → APK no GitHub (`apks/`).
- **Merge ou push na `main` = produção** (`firebase-hosting-merge.yml`, Flutter 3.41.1):
  1. pub get, analyze, test, bootstrap_test e build web;
  2. deploy em `primary`;
  3. `scripts/ensure_hosting_site.py` garante que o site `flora-rosa` existe;
  4. deploy em `professional`.
- PR gera um **canal de preview** (`firebase-hosting-pull-request.yml`). Use para revisar visualmente antes do merge.
- Secret usado: `FIREBASE_SERVICE_ACCOUNT_PORTIFOLIO_D00CA` (só no GitHub, nunca local nem no repositório).
- **Nunca** rode `firebase deploy` nem faça push na main sem pedido explícito.

## Regras
- O conteúdo precisa ser **fiel ao currículo**: sem métricas inventadas, protótipo identificado como protótipo e demo com dados simulados avisando isso.
- Alterou projeto: atualize juntos `data/content.dart`, `translations.dart` (PT **e** EN), a tabela do `README.md` e `docs/portfolio-conteudo.md`.
- Mídia leve: imagens otimizadas e vídeos de no máximo cerca de 20 s.
- Não versione `build/` nem APKs novos sem pedido.
- Agente: `flutter-dev`.
