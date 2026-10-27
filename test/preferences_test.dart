import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portifolio/main.dart';
import 'package:portifolio/features/portfolio/presentation/portfolio_page.dart';
import 'package:portifolio/features/portfolio/presentation/preferences.dart';

void main() {
  testWidgets('language selector offers flags and changes the app locale', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();
    for (final entry in [
      ('en', 'EN · English'),
      ('es', 'ES · Español'),
      ('pt', 'PT · Português'),
    ]) {
      await tester.tap(find.byType(PopupMenuButton<String>));
      await tester.pumpAndSettle();
      await tester.tap(find.text(entry.$2));
      await tester.pumpAndSettle();
      expect(
        tester.widget<MaterialApp>(find.byType(MaterialApp)).locale,
        Locale(entry.$1),
      );
      expect(tester.getTopLeft(find.text('flora rosa.')).dy,
          greaterThanOrEqualTo(16));
      expect(tester.takeException(), isNull);
    }
  });
  testWidgets('theme switch toggles dark and light', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.dark_mode_outlined));
    await tester.pumpAndSettle();
    expect(
      tester.widget<MaterialApp>(find.byType(MaterialApp)).themeMode,
      ThemeMode.dark,
    );
    expect(
      Theme.of(tester.element(find.byType(Scaffold))).brightness,
      Brightness.dark,
    );
    await tester.tap(find.byIcon(Icons.light_mode_outlined));
    await tester.pumpAndSettle();
    expect(
      tester.widget<MaterialApp>(find.byType(MaterialApp)).themeMode,
      ThemeMode.light,
    );
  });
  for (final language in ['pt', 'en', 'es']) {
    for (final width in [320.0, 430.0, 768.0, 1440.0]) {
      testWidgets('$language fits $width with enlarged text in dark mode', (
        tester,
      ) async {
        tester.view.physicalSize = Size(width, 960);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);
        await tester.pumpWidget(
          PortfolioPreferences(
            language: language,
            themeMode: ThemeMode.dark,
            onLanguageChanged: (_) {},
            onThemeChanged: (_) {},
            child: MaterialApp(
              theme: ThemeData.dark(),
              builder: (context, child) => MediaQuery(
                data: MediaQuery.of(
                  context,
                ).copyWith(textScaler: const TextScaler.linear(1.5)),
                child: child!,
              ),
              home: const PortfolioPage(),
            ),
          ),
        );
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
        await tester.ensureVisible(find.text('ASSID'));
        await tester.ensureVisible(find.text('GitHub ↗'));
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
      });
    }
  }
  testWidgets(
    'professional work precedes learning projects and ASSID opens only its site',
    (tester) async {
      Uri? opened;
      await tester.pumpWidget(
        MaterialApp(
          home: PortfolioPage(
            openLink: (uri) async {
              opened = uri;
              return true;
            },
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(
        tester.getTopLeft(find.text('Easy Comlink')).dy,
        lessThan(tester.getTopLeft(find.text('Avalia')).dy),
      );
      await tester.ensureVisible(find.text('ASSID'));
      final card = find.ancestor(
        of: find.text('ASSID'),
        matching: find.byType(ProfessionalProduct),
      );
      expect(card, findsOneWidget);
      final button = find.descendant(
        of: card,
        matching: find.byType(TextButton),
      );
      expect(button, findsOneWidget);
      await tester.ensureVisible(button);
      await tester.tap(button);
      await tester.pumpAndSettle();
      expect(opened, Uri.parse('https://www.assid.org.br/'));
      expect(tester.takeException(), isNull);
    },
  );
}
