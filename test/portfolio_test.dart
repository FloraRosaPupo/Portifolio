import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portifolio/features/portfolio/presentation/portfolio_page.dart';
import 'package:portifolio/features/portfolio/data/content.dart';
import 'package:portifolio/features/portfolio/presentation/motion.dart';

void main() {
  testWidgets('contact button opens WhatsApp', (tester) async {
    Uri? opened;
    await tester
        .pumpWidget(MaterialApp(home: PortfolioPage(openLink: (uri) async {
      opened = uri;
      return true;
    })));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('WhatsApp ↗'));
    await tester.tap(find.text('WhatsApp ↗'));
    await tester.pumpAndSettle();
    expect(opened, Uri.parse('https://wa.me/5534993130077'));
  });
  testWidgets('hover respects reduced motion', (tester) async {
    await tester.pumpWidget(const MaterialApp(
        home: MediaQuery(
            data: MediaQueryData(disableAnimations: true),
            child: HoverLift(child: Text('Conteúdo')))));
    expect(find.text('Conteúdo'), findsOneWidget);
    expect(
        tester
            .widget<AnimatedContainer>(find.byType(AnimatedContainer))
            .duration,
        Duration.zero);
  });
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
      expect(find.text('Desenvolvedora AI-first'), findsOneWidget);
      await tester.ensureVisible(find.text('Como eu desenvolvo com IA'));
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
    await tester.tap(find.widgetWithText(PopupMenuItem<int>, 'Contato'));
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
