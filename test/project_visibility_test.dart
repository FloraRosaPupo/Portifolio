import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portifolio/features/ai/presentation/ai_page.dart';
import 'package:portifolio/features/portfolio/presentation/portfolio_page.dart';
import 'package:portifolio/features/portfolio/presentation/project_preview.dart';

void main() {
  for (final page in <String, Widget>{
    'desenvolvimento': const PortfolioPage(),
    'IA': const AiPage(),
  }.entries) {
    testWidgets('projetos RAG e MCP têm vídeos na página de ${page.key}',
        (tester) async {
      await tester.pumpWidget(MaterialApp(
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(disableAnimations: true),
          child: child!,
        ),
        home: page.value,
      ));
      await tester.pumpAndSettle();
      if (page.key == 'IA') {
        for (var i = 0; i < 3; i++) {
          final next = find.byKey(const ValueKey('work-next'));
          await tester.ensureVisible(next);
          await tester.pumpAndSettle();
          await tester.tap(next);
          await tester.pumpAndSettle();
        }
      }
      var projectIndex = 0;
      for (final project in {
        'Chat com contratos': 'chat-com-contratos',
        'Assistente de pesquisa': 'assistente-pesquisa',
      }.entries) {
        if (page.key == 'desenvolvimento') {
          expect(tester.widget<TabBar>(find.byType(TabBar)).tabs.length, 6);
          final tab = find.widgetWithText(Tab, project.key);
          await tester.ensureVisible(tab);
          await tester.pumpAndSettle();
          await tester.tap(tab);
          await tester.pumpAndSettle();
        } else if (projectIndex > 0) {
          final next = find.byKey(const ValueKey('work-next'));
          await tester.ensureVisible(next);
          await tester.pumpAndSettle();
          await tester.tap(next);
          await tester.pumpAndSettle();
        }
        projectIndex++;
        final title = find.text(project.key).last;
        expect(title, findsOneWidget);
        await tester.ensureVisible(title);
        await tester.pumpAndSettle();
        final preview = find.byWidgetPredicate((widget) =>
            widget is ProjectPreview && widget.title == project.key);
        expect(preview, findsOneWidget);
        expect(tester.widget<ProjectPreview>(preview).video,
            'previews/${project.value}.mp4');
        expect(tester.takeException(), isNull);
      }
    });
  }
}
