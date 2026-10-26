# Portfólio de Flora Rosa

## Descrição

Portfólio desenvolvido em Flutter para apresentar trajetória, experiências, projetos e canais de contato de Flora Rosa. A versão web utiliza Firebase Hosting.

## Stack e bibliotecas

Flutter/Dart, url_launcher e Firebase Hosting. A interface não depende de inicialização de serviços externos.

Para trocar o currículo, substitua `web/Curriculo_Flora_Rosa_Pupo.pdf` mantendo o nome do arquivo.

Dependências e versões declaradas: [pubspec.yaml](pubspec.yaml).

## Funcionalidades

- Página responsiva com navegação por seções: Projetos, Trajetória, IA, Sobre e Contato.
- Abertura com apresentação, quadro roxo de atuação profissional e botões para ver projetos, falar por contato e baixar o currículo (PDF em `web/`).
- Projetos Avalia (correção de provas com inteligência artificial, turmas, alunos e resultados) e Bebeu? (hidratação com widget na tela inicial, notificações locais, armazenamento seguro do token com Flutter Secure Storage e backend em Node.js e PostgreSQL), com prévias de 10 segundos em loop, silenciosas, leves e com dados demonstrativos. Movimento reduzido usa imagens estáticas.
- Links de aplicativos publicados na Google Play.
- Trajetória profissional, formação e competências.
- Seção "Como eu desenvolvo com IA": fluxo AI-first com Claude e Claude Code, agentes orquestradores, agentes de code review, hooks e testes como proteção. O conteúdo fica em `lib/features/portfolio/data/content.dart` (`aiPractices` e `aiTools`).
- Contato por WhatsApp, e-mail, LinkedIn, GitHub e download do currículo.
- Identidade visual roxa, estilo minimalista, interações suaves e respeito a movimento reduzido.
- Seção de testes e qualidade com links para o código e a CI.

## Licença

Não há uma licença de distribuição definida para este repositório. Nenhuma licença MIT, Apache ou equivalente é concedida por este README. As atribuições e os direitos dos materiais de terceiros permanecem preservados.

## Validação e limites

Renderização da apresentação, compilação web e preview Firebase. O APK histórico não é recompilado por esta pipeline.

## Executar
Use a versão de Flutter registrada em `.github/workflows/ci.yml`.
```sh
git clone https://github.com/FloraRosaPupo/Portifolio.git
cd Portifolio
flutter pub get
flutter run
```

## Verificações
```sh
flutter analyze --no-fatal-infos --no-fatal-warnings
flutter test
```
A CI verifica erros de análise e os testes. Avisos e sugestões continuam visíveis no relatório do analisador. Testes locais não substituem a validação no dispositivo e dos serviços externos.

## Contribuir
Abra uma branch por alteração, descreva o comportamento esperado e inclua testes para regras ou regressões. Mantenha credenciais e arquivos gerados fora do Git.

## Organização e manutenção

`lib/features/portfolio` reúne conteúdo e apresentação. As páginas antigas foram substituídas por uma página com seções responsivas. A inicialização Firebase e as dependências sem uso foram removidas; Firebase Hosting continua hospedando a versão web.

Veja [a revisão de desenvolvimento](docs/REVISAO.md) para decisões, testes e limites, e [o guia de contribuição](CONTRIBUTING.md) para o fluxo de manutenção.

## Publicação web e APK

O deploy da `main` atualiza o site original e o endereço profissional `flora-rosa.web.app` no mesmo projeto Firebase. O script `scripts/ensure_hosting_site.py` cria o site profissional apenas se ele ainda não existir. Uma indisponibilidade do nome ou falta de permissão interrompe essa etapa com erro, sem substituir outro site. A credencial permanece no secret do GitHub Actions.

Enquanto o Flutter inicializa, a página mostra uma tela de carregamento com a marca, o nome e uma barra de progresso, com saída suave quando o site fica pronto. O texto de carregamento fica oculto visualmente e permanece disponível para leitores de tela; após 20 segundos aparece um aviso de carregamento lento. Se a inicialização falhar, uma versão leve do texto e os contatos ficam disponíveis, com opção de tentar novamente. O movimento reduzido é respeitado.

Os workflows Firebase compilam Flutter web. O APK existente continua em `apks/app-release.apk` no GitHub; `/app-release.apk` redireciona para esse arquivo, pois o plano Spark do Firebase Hosting não aceita executáveis. O workflow não recompila o APK. O cliente não utiliza Firebase Auth nem Firebase Core. O preview depende da conta de serviço já configurada no repositório.

## Visual e conteúdo

![Portfólio profissional](docs/portfolio-desktop.png)

Experiência e formação atualizadas a partir do currículo da autora. [Origem do conteúdo e das capturas](docs/portfolio-conteudo.md).

As capturas dos aplicativos são geradas localmente; o painel do Avalia e o Bebeu? utilizam dados demonstrativos. Não representam uma sessão conectada a uma conta real.

Para gerar capturas do próprio portfólio:

```sh
flutter test test/portfolio_capture_test.dart --dart-define=CAPTURE_PORTFOLIO=true
```

As imagens ficam em `captures/`. Os testes regulares verificam larguras de 320, 430, 768 e 1440 pixels, texto ampliado, navegação e abertura de links.
