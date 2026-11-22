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
      for (final project in {
        'Chat com contratos': 'chat-com-contratos',
        'Assistente de pesquisa': 'assistente-pesquisa',
      }.entries) {
        final title = find.text(project.key);
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
