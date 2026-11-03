import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portifolio/features/portfolio/presentation/portfolio_page.dart';
import 'package:portifolio/features/portfolio/presentation/project_preview.dart';

void main() {
  testWidgets('PageView advances without a pause button and updates its tabs',
      (tester) async {
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
      body: SingleChildScrollView(child: RecentProjects(onOpen: (_) async {})),
    )));
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 12));
    await tester.pumpAndSettle();
    expect(tester.widget<TabBar>(find.byType(TabBar)).controller!.index, 1);
    expect(find.byTooltip('Pausar carrossel'), findsNothing);
    await tester.pump(const Duration(seconds: 12));
    await tester.pumpAndSettle();
    expect(tester.widget<TabBar>(find.byType(TabBar)).controller!.index, 2);
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('mobile uses project dots and supports swiping', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    final scroll = ScrollController();
    addTearDown(scroll.dispose);
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: MediaQuery(
      data: const MediaQueryData(size: Size(390, 844)),
      child: SingleChildScrollView(
          controller: scroll, child: RecentProjects(onOpen: (_) async {})),
    ))));
    await tester.pumpAndSettle();
    expect(find.byType(TabBar), findsNothing);
    scroll.jumpTo(scroll.position.maxScrollExtent);
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Triagem'));
    await tester.pumpAndSettle();
    expect(
        tester
            .widget<ProjectPreview>(find.descendant(
                of: find.byWidgetPredicate(
                    (w) => w is ProjectCard && w.title == 'Triagem'),
                matching: find.byType(ProjectPreview)))
            .video,
        'previews/triagem.mp4');
    scroll.jumpTo(0);
    await tester.pumpAndSettle();
    await tester.dragFrom(const Offset(340, 350), const Offset(-250, 0));
    await tester.pumpAndSettle();
    expect(
        tester
            .widget<ProjectPreview>(find.descendant(
                of: find.byWidgetPredicate(
                    (w) => w is ProjectCard && w.title == 'Avalia'),
                matching: find.byType(ProjectPreview)))
            .video,
        'previews/avalia.mp4');
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('reduced motion disables rotation and retains project navigation',
      (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    final scroll = ScrollController();
    addTearDown(scroll.dispose);
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: MediaQuery(
      data: const MediaQueryData(size: Size(390, 844), disableAnimations: true),
      child: SingleChildScrollView(
          controller: scroll, child: RecentProjects(onOpen: (_) async {})),
    ))));
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 24));
    expect(
        tester
            .widget<ProjectPreview>(find.descendant(
                of: find.byWidgetPredicate(
                    (w) => w is ProjectCard && w.title == 'RepoMentor'),
                matching: find.byType(ProjectPreview)))
            .video,
        'previews/repomentor.mp4');
    expect(find.byTooltip('Pausar carrossel'), findsNothing);
    scroll.jumpTo(scroll.position.maxScrollExtent);
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Triagem'));
    await tester.pumpAndSettle();
    expect(
        tester
            .widget<ProjectPreview>(find.descendant(
                of: find.byWidgetPredicate(
                    (w) => w is ProjectCard && w.title == 'Triagem'),
                matching: find.byType(ProjectPreview)))
            .video,
        'previews/triagem.mp4');
    await tester.pumpWidget(const SizedBox());
  });

  for (final width in [320.0, 768.0, 1440.0]) {
    testWidgets('all four projects fit and open their links at $width',
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
      final card = find.byWidgetPredicate(
          (widget) => widget is ProjectCard && widget.title == 'RepoMentor');
      final preview =
          find.descendant(of: card, matching: find.byType(ProjectPreview));
      expect(tester.widget<ProjectPreview>(preview).video,
          'previews/repomentor.mp4');
      final link =
          find.descendant(of: card, matching: find.text('Explorar projeto'));
      scroll.jumpTo((scroll.offset + tester.getTopLeft(link).dy - 300)
          .clamp(0, scroll.position.maxScrollExtent));
      await tester.pumpAndSettle();
      await tester.tap(link);
      expect(opened, endsWith('/repomentor'));
      await tester.pumpWidget(const SizedBox());
    });
  }
}
