# Portfólio de Flora Rosa

Apresentação de projetos, experiência e formas de contato.

## Stack e organização
Flutter/Dart, Firebase Core, Firebase Hosting, carousel_slider e url_launcher.

Mantidas páginas de apresentação e constantes compartilhadas: existe uma única funcionalidade, o portfólio, sem domínio de negócio que justifique Clean Architecture. Firebase Auth sem uso foi retirado. O build web e o download do APK têm destinos separados.

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

## Licença
Não há licença de distribuição definida neste repositório.


### Publicação web e APK

Os workflows Firebase compilam Flutter web. O APK existente continua em `apks/app-release.apk` no GitHub; `/app-release.apk` redireciona para esse arquivo, pois o plano Spark do Firebase Hosting não aceita executáveis. O workflow não recompila o APK. Firebase Auth foi removido das dependências por não ser utilizado; Firebase Core foi atualizado para a compilação web atual. O preview depende da conta de serviço já configurada no repositório.


## Funcionalidades

- Apresentação pessoal.
- projetos e experiência.
- links de contato.


## Organização e manutenção

Mantidas páginas de apresentação e constantes compartilhadas: existe uma única funcionalidade, o portfólio, sem domínio de negócio que justifique Clean Architecture. Firebase Auth sem uso foi retirado. O build web e o download do APK têm destinos separados.

Veja [a revisão de desenvolvimento](docs/REVISAO.md) para decisões, testes e limites, e [o guia de contribuição](CONTRIBUTING.md) para o fluxo de manutenção.
