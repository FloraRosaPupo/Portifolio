import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portifolio/features/portfolio/presentation/portfolio_page.dart';
import 'package:portifolio/features/portfolio/presentation/project_preview.dart';

void main() {
  testWidgets('automatic carousel advances, pauses and resumes',
      (tester) async {
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
      body: SingleChildScrollView(child: RecentProjects(onOpen: (_) async {})),
    )));
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 12));
    expect(find.text('2 / 2'), findsOneWidget);
    await tester.tap(find.byTooltip('Pausar carrossel'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 24));
    expect(find.text('2 / 2'), findsOneWidget);
    await tester.tap(find.byTooltip('Retomar carrossel'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 12));
    expect(find.text('1 / 2'), findsOneWidget);
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('reduced motion disables automatic rotation', (tester) async {
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
      body: MediaQuery(
        data:
            const MediaQueryData(size: Size(800, 600), disableAnimations: true),
        child:
            SingleChildScrollView(child: RecentProjects(onOpen: (_) async {})),
      ),
    )));
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 24));
    expect(find.text('1 / 2'), findsOneWidget);
    expect(find.byTooltip('Pausar carrossel'), findsNothing);
    await tester.pumpWidget(const SizedBox());
  });

  for (final width in [320.0, 768.0, 1440.0]) {
    testWidgets('recent projects navigate and open correct links at $width',
        (tester) async {
      tester.view.physicalSize = Size(width, 1000);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      String? opened;
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: MediaQuery(
              data: const MediaQueryData(
                disableAnimations: true,
                textScaler: TextScaler.linear(1.5),
              ),
              child: RecentProjects(onOpen: (url) async => opened = url),
            ),
          ),
        ),
      ));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      expect(tester.widget<ProjectPreview>(find.byType(ProjectPreview)).video,
          'previews/repomentor.mp4');
      await tester.ensureVisible(find.text('Explorar projeto'));
      await tester.tap(find.text('Explorar projeto'));
      expect(opened, endsWith('/repomentor'));
      await tester.ensureVisible(find.byTooltip('Próximo projeto'));
      await tester.tap(find.byTooltip('Próximo projeto'));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      expect(find.text('2 / 2'), findsOneWidget);
      expect(tester.widget<ProjectPreview>(find.byType(ProjectPreview)).video,
          'previews/triagem.mp4');
      await tester.ensureVisible(find.text('Explorar projeto'));
      await tester.tap(find.text('Explorar projeto'));
      expect(opened, endsWith('/ticket-triage-ml'));
      await tester.ensureVisible(find.byTooltip('Próximo projeto'));
      await tester.tap(find.byTooltip('Próximo projeto'));
      await tester.pumpAndSettle();
      expect(find.text('1 / 2'), findsOneWidget);
    });
  }
}
