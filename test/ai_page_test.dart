import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portifolio/main.dart';
import 'package:portifolio/features/ai/presentation/ai_page.dart';
import 'package:portifolio/features/portfolio/presentation/preferences.dart';
import 'package:portifolio/features/ai/data/business_ideas.dart';
import 'package:portifolio/features/ai/data/business_localizations.dart';

void main() {
  test('five sourced business proposals have complete translations', () {
    expect(businessIdeas, hasLength(5));
    for (var i = 0; i < 5; i++) {
      expect(Uri.parse(businessIdeas[i].url).scheme, 'https');
      for (final field in [
        'sector',
        'title',
        'news',
        'question',
        'solution',
        'data',
        'validation',
        'technique',
        'summary',
        'limits'
      ]) {
        for (final lang in ['pt', 'en', 'es']) {
          expect(businessText(i, field, lang), isNotEmpty);
        }
      }
    }
  });
  for (final lang in ['pt', 'en', 'es']) {
    for (final width in [320.0, 430.0, 768.0, 1440.0]) {
      testWidgets('AI dark layout $lang at $width with enlarged text',
          (tester) async {
        tester.view.physicalSize = Size(width, 900);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);
        await tester.pumpWidget(PortfolioPreferences(
            language: lang,
            themeMode: ThemeMode.light,
            onLanguageChanged: (_) {},
            onThemeChanged: (_) {},
            child: const MaterialApp(
                home: MediaQuery(
                    data: MediaQueryData(
                        disableAnimations: true,
                        textScaler: TextScaler.linear(1.5)),
                    child: AiPage()))));
        await tester.pumpAndSettle();
        expect(Theme.of(tester.element(find.byType(Scaffold))).brightness,
            Brightness.dark);
        expect(find.byIcon(Icons.light_mode_outlined), findsNothing);
        expect(tester.takeException(), isNull);
        await tester.ensureVisible(find.byKey(const ValueKey('work-next')));
        await tester.tap(find.byKey(const ValueKey('work-next')));
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
        await tester.ensureVisible(find.byKey(const ValueKey('business-next')));
        for (var i = 0; i < 4; i++) {
          await tester
              .ensureVisible(find.byKey(const ValueKey('business-next')));
          await tester.pumpAndSettle();
          await tester.tap(find.byKey(const ValueKey('business-next')));
          await tester.pumpAndSettle();
          expect(tester.takeException(), isNull);
        }
        expect(find.text('5 / 5'), findsOneWidget);
      });
    }
  }
  testWidgets(
      'text-only project shrinks carousel and Triagem modal fits mobile',
      (tester) async {
    tester.view.physicalSize = const Size(1440, 1000);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const MaterialApp(
        home: MediaQuery(
            data: MediaQueryData(disableAnimations: true), child: AiPage())));
    await tester.pumpAndSettle();
    final original =
        tester.getSize(find.byKey(const ValueKey('work-viewport'))).height;
    await tester.ensureVisible(find.byKey(const ValueKey('work-next')));
    await tester.tap(find.byKey(const ValueKey('work-next')));
    await tester.pumpAndSettle();
    final compact =
        tester.getSize(find.byKey(const ValueKey('work-viewport'))).height;
    expect(compact, lessThan(original));
    expect(compact, lessThan(420));
    await tester.ensureVisible(find.byKey(const ValueKey('work-previous')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('work-previous')));
    await tester.pumpAndSettle();
    tester.view.physicalSize = const Size(320, 900);
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('Ler análise').first);
    await tester.tap(find.text('Ler análise').first);
    await tester.pumpAndSettle();
    expect(find.byType(Dialog), findsOneWidget);
    expect(find.text('COMO A SOLUÇÃO FUNCIONA'), findsOneWidget);
    expect(tester.takeException(), isNull);
    await tester.tap(find.byTooltip('Fechar leitura'));
    await tester.pumpAndSettle();
    expect(find.byType(Dialog), findsNothing);
  });
  testWidgets('mobile navigation opens AI, switches language and returns',
      (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();
    await tester.tap(find.byType(PopupMenuButton<int>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Flora × IA'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));
    expect(find.byType(AiPage), findsOneWidget);
    await tester.tap(find.byType(PopupMenuButton<String>).hitTestable());
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));
    await tester.tap(find.text('EN · English'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));
    expect(find.text('Explore my work'), findsOneWidget);
    await tester.tap(find.byTooltip('Development').hitTestable().first);
    await tester.pumpAndSettle();
    expect(find.byType(AiPage), findsNothing);
  });
}
