import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portifolio/features/portfolio/presentation/portfolio_page.dart';
import 'package:portifolio/features/portfolio/presentation/project_preview.dart';

void main() {
  testWidgets('PageView automatically advances, pauses and resumes',
      (tester) async {
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
      body: SingleChildScrollView(child: RecentProjects(onOpen: (_) async {})),
    )));
    await tester.pumpAndSettle();
    expect(find.byType(PageView), findsOneWidget);
    await tester.pump(const Duration(seconds: 12));
    await tester.pumpAndSettle();
    expect(find.text('2 / 4'), findsOneWidget);
    await tester.tap(find.byTooltip('Pausar carrossel'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 24));
    expect(find.text('2 / 4'), findsOneWidget);
    await tester.tap(find.byTooltip('Retomar carrossel'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 12));
    await tester.pumpAndSettle();
    expect(find.text('3 / 4'), findsOneWidget);
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('reduced motion disables automatic rotation and supports swiping',
      (tester) async {
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: MediaQuery(
      data: const MediaQueryData(size: Size(800, 600), disableAnimations: true),
      child: SingleChildScrollView(child: RecentProjects(onOpen: (_) async {})),
    ))));
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 24));
    expect(find.text('1 / 4'), findsOneWidget);
    expect(find.byTooltip('Pausar carrossel'), findsNothing);
    await tester.dragFrom(const Offset(650, 250), const Offset(-600, 0));
    await tester.pumpAndSettle();
    expect(find.text('2 / 4'), findsOneWidget);
    await tester.pumpWidget(const SizedBox());
  });

  for (final width in [320.0, 768.0, 1440.0]) {
    testWidgets('all four projects fit and open their own links at $width',
        (tester) async {
      tester.view.physicalSize = Size(width, 1000);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      String? opened;
      final scroll = ScrollController();
      addTearDown(scroll.dispose);
      await tester.pumpWidget(MaterialApp(
          home: Scaffold(
              body: SingleChildScrollView(
        controller: scroll,
        child: MediaQuery(
          data: MediaQueryData(
              size: Size(width, 1000),
              disableAnimations: true,
              textScaler: const TextScaler.linear(1.5)),
          child: RecentProjects(onOpen: (url) async => opened = url),
        ),
      ))));
      await tester.pumpAndSettle();
      final projects = [
        ('RepoMentor', 'repomentor', 'repomentor'),
        ('Triagem', 'triagem', 'ticket-triage-ml'),
        ('Avalia', 'avalia', 'projeto_Avalia'),
        ('Bebeu?', 'bebeu', 'controle_agua'),
      ];
      for (final entry in projects.asMap().entries) {
        final project = entry.value;
        expect(find.text('${entry.key + 1} / 4'), findsOneWidget);
        expect(tester.takeException(), isNull);
        final card = find.byWidgetPredicate(
            (widget) => widget is ProjectCard && widget.title == project.$1);
        final preview =
            find.descendant(of: card, matching: find.byType(ProjectPreview));
        expect(tester.widget<ProjectPreview>(preview).video,
            'previews/${project.$2}.mp4');
        final link =
            find.descendant(of: card, matching: find.text('Explorar projeto'));
        scroll.jumpTo((scroll.offset + tester.getTopLeft(link).dy - 300)
            .clamp(0, scroll.position.maxScrollExtent));
        await tester.pumpAndSettle();
        await tester.tap(link);
        expect(opened, endsWith('/${project.$3}'));
        scroll.jumpTo(0);
        await tester.pumpAndSettle();
        await tester.tap(find.byTooltip('Próximo projeto'));
        await tester.pumpAndSettle();
      }
      expect(find.text('1 / 4'), findsOneWidget);
      await tester.pumpWidget(const SizedBox());
    });
  }
}
