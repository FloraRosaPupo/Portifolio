# Rascunho local — portfólio minimalista

Base: `1834c9d74fdd6a6acdbaf2d86a60993fcb9315c8`
Branch local: `review/minimal-portfolio-i18n-theme`

## Antes → depois

- Cards profissionais genéricos → contexto e contribuição em poucas linhas. A ordem profissional primeiro foi preservada, não substituída por estudos de caso.
- DoubleX descrita como front-end → atuação full stack e CI/CD; FlowCode inclui gestão, contato com clientes e levantamento de requisitos.
- Avalia/Bebeu? com descrições extensas → projetos autorais de aprendizado, com contexto curto e prévias já existentes mantidas.
- Sem ASSID → um card de voluntariado, com somente o site institucional público. Sem link para repositório privado ou vídeo inventado.
- Apenas português → PT/EN/ES com seletor discreto e bandeiras, incluindo navegação, erros e descrições acessíveis. PDF do currículo continua em PT, indicado no link.
- Tema claro fixo → claro/escuro com paleta roxa própria, preferência inicial do sistema e escolha local persistida no navegador.

Sem painel extra, detalhes expansíveis, chatbot, métricas inventadas, alteração de senioridade, push, PR ou publicação.

## Revisão

O conteúdo e os ativos existentes foram preservados onde não havia alteração autorizada.
As prévias continuam com dados demonstrativos e respeitam movimento reduzido.
A persistência não transmite dados: usa apenas `localStorage`, com fallback se o navegador bloquear acesso.

## Validação local

Ambiente: Flutter 3.41.1 / Dart 3.11.0, versão fixada na CI. SDK oficial com
SHA-256 verificado; execução com analytics desativado e identificação de CI.

- `flutter analyze --no-fatal-infos --no-fatal-warnings`: sem problemas.
- `flutter test`: 28 testes aprovados; 2 testes de captura não executados no comando padrão.
- Capturas separadas: 2 testes aprovados, 20 PNGs em 1440 e 430 px.
- `flutter build web`: compilação aprovada, saída somente local em `build/web`.
- `node --test test/bootstrap_test.cjs`: 4 testes aprovados.
- Layout: PT/EN/ES em 320, 430, 768 e 1440 px, com texto ampliado em 50%.
- Contraste amostrado de texto/fundo: 5,82:1 a 8,58:1; não é uma auditoria completa de acessibilidade.

As capturas são renderizações reais de widgets Flutter, não mockups. Não substituem
testes manuais de navegador/dispositivo. Reprodução de vídeo e persistência no
navegador real não foram verificadas end-to-end neste ambiente. O build JavaScript
foi aprovado; suporte a Wasm não é reivindicado. Não foi gerado APK.

As bandeiras usam desenhos vetoriais pequenos para não depender de suporte a emoji
da plataforma. Os rótulos PT/EN/ES e os nomes completos no menu continuam textuais.

## Aplicar o patch em outra cópia local

Com a base acima e a árvore de trabalho limpa:

```sh
git apply portfolio-review.patch
flutter pub get
flutter analyze --no-fatal-infos --no-fatal-warnings
flutter test
flutter build web
```

O patch não publica o site. A publicação permanece uma etapa separada, dependente
da aprovação da autora.

Avisos do build: a verificação opcional de Wasm terminou com código 247 na última
execução; o build JavaScript terminou com sucesso. O Flutter também informou a
família CupertinoIcons não incluída; os ícones utilizados pelo app são Material.
