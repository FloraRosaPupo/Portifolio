import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portifolio/features/portfolio/presentation/portfolio_page.dart';
import 'package:portifolio/features/portfolio/data/content.dart';

void main() {
  for (final width in [320.0, 430.0, 768.0, 1440.0]) {
    testWidgets('layout fits width $width and enlarged text', (tester) async {
      tester.view.physicalSize = Size(width, 960);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      await tester.pumpWidget(MaterialApp(
        builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: const TextScaler.linear(1.5)),
            child: child!),
        home: const PortfolioPage(),
      ));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      expect(find.text('Desenvolvimento Full Stack'), findsOneWidget);
      await tester.ensureVisible(find.text('E-mail ↗'));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
    });
  }
  testWidgets('navigation and contact open the requested destination',
      (tester) async {
    Uri? opened;
    await tester
        .pumpWidget(MaterialApp(home: PortfolioPage(openLink: (uri) async {
      opened = uri;
      return true;
    })));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Abrir navegação'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Contato'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('LinkedIn ↗'));
    await tester.pumpAndSettle();
    expect(opened, Uri.parse(linkedin));
  });
  testWidgets('failed external link provides feedback', (tester) async {
    await tester.pumpWidget(
        MaterialApp(home: PortfolioPage(openLink: (_) async => false)));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('GitHub ↗'));
    await tester.tap(find.text('GitHub ↗'));
    await tester.pumpAndSettle();
    expect(find.text('Não foi possível abrir o link. Tente novamente.'),
        findsOneWidget);
  });
}
