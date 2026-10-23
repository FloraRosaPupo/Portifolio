# Portfólio de Flora Rosa

## Descrição

Portfólio desenvolvido em Flutter para apresentar trajetória, experiências, projetos e canais de contato de Flora Rosa. A versão web utiliza Firebase Hosting.

## Stack e bibliotecas

Flutter/Dart, Firebase Core, Firebase Hosting, carousel_slider e url_launcher.

Dependências e versões declaradas: [pubspec.yaml](pubspec.yaml).

## Funcionalidades

- Apresentação pessoal.
- Projetos e experiência.
- Links de contato.

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

Mantidas páginas de apresentação e constantes compartilhadas: existe uma única funcionalidade, o portfólio, sem domínio de negócio que justifique Clean Architecture. Firebase Auth sem uso foi retirado. O build web e o download do APK têm destinos separados.

Veja [a revisão de desenvolvimento](docs/REVISAO.md) para decisões, testes e limites, e [o guia de contribuição](CONTRIBUTING.md) para o fluxo de manutenção.

## Publicação web e APK

Os workflows Firebase compilam Flutter web. O APK existente continua em `apks/app-release.apk` no GitHub; `/app-release.apk` redireciona para esse arquivo, pois o plano Spark do Firebase Hosting não aceita executáveis. O workflow não recompila o APK. Firebase Auth foi removido das dependências por não ser utilizado; Firebase Core foi atualizado para a compilação web atual. O preview depende da conta de serviço já configurada no repositório.
