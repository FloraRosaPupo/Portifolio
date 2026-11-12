import 'package:flutter/rendering.dart';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../portfolio/presentation/preferences.dart';
import '../../portfolio/presentation/project_preview.dart';
import '../data/business_ideas.dart';
import '../data/business_localizations.dart';
import '../data/property_study.dart';
import '../data/property_localizations.dart';

class AiPage extends StatefulWidget {
  const AiPage({super.key});
  @override
  State<AiPage> createState() => _AiPageState();
}

class _AiPageState extends State<AiPage> with SingleTickerProviderStateMixin {
  late final AnimationController motion =
      AnimationController(vsync: this, duration: const Duration(seconds: 28));
  final workKey = GlobalKey();
  final ideasKey = GlobalKey();
  String get lang => PortfolioPreferences.of(context)?.language ?? 'pt';
  String l(String pt, String en, String es) => lang == 'en'
      ? en
      : lang == 'es'
          ? es
          : pt;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (MediaQuery.disableAnimationsOf(context)) {
      motion.stop();
    } else {
      motion.repeat();
    }
  }

  @override
  void dispose() {
    motion.dispose();
    super.dispose();
  }

  void go(GlobalKey key) => Scrollable.ensureVisible(key.currentContext!,
      duration: MediaQuery.disableAnimationsOf(context)
          ? Duration.zero
          : const Duration(milliseconds: 500));
  Future<void> open(String url) async {
    try {
      if (!await launchUrl(Uri.parse(url), mode: LaunchMode.platformDefault)) {
        throw StateError('Link');
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(l(
                'Não foi possível abrir o link. Tente novamente.',
                'Could not open the link. Please try again.',
                'No se pudo abrir el enlace. Inténtalo de nuevo.'))));
      }
    }
  }

  Widget copy(String text) => SelectableText(text,
      style:
          const TextStyle(fontSize: 15, height: 1.8, color: Color(0xFFC8BBD2)));
  Widget heading(String text, {double size = 30}) => Text(text,
      style: TextStyle(
          fontSize: size,
          height: 1.2,
          letterSpacing: -.8,
          fontWeight: FontWeight.w700));
  Widget eyebrow(String text) => Text(text,
      style: const TextStyle(
          fontSize: 11,
          letterSpacing: 1.8,
          fontWeight: FontWeight.w700,
          color: Color(0xFFD4AEFC)));
  void article(BuildContext ctx, String title, List<(String, String)> sections,
      {String? source, String? url, String? sourceCaption}) {
    showDialog<void>(
        context: ctx,
        builder: (dialogContext) => Dialog(
              backgroundColor: const Color(0xFF211A29),
              insetPadding: const EdgeInsets.all(16),
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxWidth: title == 'Triagem' ? 1020 : 820,
                      maxHeight: 850),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Padding(
                        padding: const EdgeInsets.fromLTRB(24, 12, 12, 0),
                        child: Row(children: [
                          Expanded(
                              child: eyebrow(l('CADERNO / LEITURA',
                                  'NOTEBOOK / READING', 'CUADERNO / LECTURA'))),
                          IconButton(
                              tooltip: l('Fechar leitura', 'Close reading',
                                  'Cerrar lectura'),
                              onPressed: () => Navigator.pop(dialogContext),
                              icon: const Icon(Icons.close))
                        ])),
                    Flexible(
                        child: SingleChildScrollView(
                            padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  heading(title,
                                      size: title == 'Triagem' ? 38 : 30),
                                  if (title == 'Triagem') ...[
                                    const SizedBox(height: 12),
                                    copy(l(
                                        'Do texto do chamado à sugestão de assunto, com revisão humana.',
                                        'From ticket text to a suggested topic, with human review.',
                                        'Del texto de la solicitud a la sugerencia de tema, con revisión humana.')),
                                    const SizedBox(height: 16),
                                    Wrap(spacing: 8, runSpacing: 8, children: [
                                      for (final tag in [
                                        'TF-IDF',
                                        l(
                                            'Regressão logística',
                                            'Logistic regression',
                                            'Regresión logística'),
                                        'Python + React'
                                      ])
                                        Chip(label: Text(tag))
                                    ]),
                                    const SizedBox(height: 20),
                                    const ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16)),
                                        child: ProjectPreview(
                                            image:
                                                'assets/projects/triagem.png',
                                            video: 'previews/triagem.mp4',
                                            title: 'Triagem',
                                            aspectRatio: 1440 / 760)),
                                    const SizedBox(height: 14),
                                    Text(
                                        l(
                                            'Demonstração com chamados fictícios e dados sintéticos.',
                                            'Demo with fictional tickets and synthetic data.',
                                            'Demostración con solicitudes ficticias y datos sintéticos.'),
                                        style: const TextStyle(
                                            fontSize: 11,
                                            color: Color(0xFFC8BBD2))),
                                    const SizedBox(height: 24),
                                    eyebrow(l(
                                        'COMO A SOLUÇÃO FUNCIONA',
                                        'HOW THE SOLUTION WORKS',
                                        'CÓMO FUNCIONA LA SOLUCIÓN')),
                                    const SizedBox(height: 14),
                                    Wrap(
                                        spacing: 10,
                                        runSpacing: 10,
                                        children: [
                                          for (final step in [
                                            l(
                                                '01 · Texto do chamado',
                                                '01 · Ticket text',
                                                '01 · Texto de la solicitud'),
                                            l(
                                                '02 · TF-IDF + classificação',
                                                '02 · TF-IDF + classification',
                                                '02 · TF-IDF + clasificación'),
                                            l(
                                                '03 · Revisão humana',
                                                '03 · Human review',
                                                '03 · Revisión humana')
                                          ])
                                            Container(
                                                padding:
                                                    const EdgeInsets.all(14),
                                                decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xFF38234E),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
                                                child: Text(step,
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        color:
                                                            Color(0xFFD4AEFC))))
                                        ]),
                                    const SizedBox(height: 18),
                                    OutlinedButton.icon(
                                        onPressed: () => open(
                                            'https://github.com/FloraRosaPupo/ticket-triage-ml'),
                                        icon: const Icon(Icons.open_in_new,
                                            size: 16),
                                        label: Text(l(
                                            'Explorar o código no GitHub',
                                            'Explore the code on GitHub',
                                            'Explorar el código en GitHub'))),
                                  ],
                                  const SizedBox(height: 22),
                                  for (final section in sections)
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 24),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              heading(section.$1, size: 19),
                                              const SizedBox(height: 10),
                                              copy(section.$2)
                                            ])),
                                  if (source != null) ...[
                                    const Divider(),
                                    const SizedBox(height: 16),
                                    eyebrow(l(
                                        'FONTE / TÍTULO ORIGINAL',
                                        'SOURCE / ORIGINAL TITLE',
                                        'FUENTE / TÍTULO ORIGINAL')),
                                    const SizedBox(height: 12),
                                    copy(source),
                                    if (sourceCaption != null) ...[
                                      const SizedBox(height: 12),
                                      copy(sourceCaption)
                                    ],
                                    if (url != null)
                                      TextButton.icon(
                                          onPressed: () => open(url),
                                          icon: const Icon(Icons.open_in_new,
                                              size: 16),
                                          label: Text(l(
                                              'Ler na fonte',
                                              'Read the source',
                                              'Leer la fuente')))
                                  ],
                                ]))),
                  ])),
            ));
  }

  void propertyArticle(BuildContext ctx) {
    final sections = <(String, String)>[];
    for (var i = 0; i < studySections.length; i++) {
      sections.add(lang == 'pt'
          ? studySections[i]
          : lang == 'en'
              ? studyTranslations[i].$1
              : studyTranslations[i].$2);
    }
    sections.add((
      l('Origem e revisão', 'Origin and editing', 'Origen y revisión'),
      l(
          'Resposta de Flora Rosa Pupo ao projeto integrado da pós-graduação. Revisão editorial e aprofundamentos metodológicos com apoio de IA. Pipelines, separação temporal e análise por grupos são extensões para uma futura implementação. Sem treinamento ou resultados medidos.',
          'Based on Flora Rosa Pupo’s postgraduate assignment. Editorial review and methodological additions with AI assistance. Pipelines, temporal splits and group analysis extend the proposal for future implementation. No training or measured results.',
          'Basado en la respuesta de Flora Rosa Pupo al proyecto integrado. Revisión y ampliaciones metodológicas con apoyo de IA. Pipelines, separación temporal y análisis por grupos amplían la propuesta para una futura implementación. Sin entrenamiento ni resultados medidos.')
    ));
    article(
        ctx,
        l(studyTitle, 'How can machine learning estimate property prices?',
            '¿Cómo estimar precios de inmuebles con aprendizaje automático?'),
        sections,
        source: 'scikit-learn · Metrics and scoring / Common pitfalls',
        url: 'https://scikit-learn.org/stable/modules/model_evaluation.html',
        sourceCaption: 'https://scikit-learn.org/stable/common_pitfalls.html');
  }

  void businessArticle(BuildContext ctx, int i) {
    final b = businessIdeas[i];
    String t(String field) => businessText(i, field, lang);
    article(
        ctx,
        t('title'),
        [
          (
            l('O que a notícia informa', 'What the news reports',
                'Qué informa la noticia'),
            t('news')
          ),
          (
            l('IA utilizada e enquadramento', 'AI used and task framing',
                'IA utilizada y encuadre'),
            t('technique')
          ),
          (
            l('Pergunta de negócio', 'Business question',
                'Pregunta de negocio'),
            t('question')
          ),
          (
            l('Possível solução com IA', 'Potential AI solution',
                'Posible solución con IA'),
            t('solution')
          ),
          (
            l('Dados necessários', 'Data needed', 'Datos necesarios'),
            t('data')
          ),
          (
            l('Como eu testaria', 'How I would test it', 'Cómo lo probaría'),
            t('validation')
          ),
          (
            l('Limites da proposta', 'Proposal limits',
                'Límites de la propuesta'),
            t('limits')
          ),
        ],
        source: '${b.source} · ${businessDate(i, lang)}\n${b.newsTitle}',
        url: b.url,
        sourceCaption: l(
            'Fonte consultada em 12/11/2026. Pesquisa e proposta elaboradas com apoio de IA, para revisão da autora. O caso publicado e a proposta de adaptação estão separados; não participei da implantação descrita pela fonte.',
            'Source accessed on 12 November 2026. Research and proposal prepared with AI assistance for author review. The reported case and proposed adaptation are separate; I did not participate in the deployment described by the source.',
            'Fuente consultada el 12/11/2026. Investigación y propuesta elaboradas con apoyo de IA para revisión de la autora. El caso publicado y la adaptación propuesta están separados; no participé en la implementación descrita por la fuente.'));
  }

  void autismArticle(BuildContext ctx) => article(
      ctx,
      l('Classificação de imagens com VGG19', 'Image classification with VGG19',
          'Clasificación de imágenes con VGG19'),
      [
        (
          l('Contexto e autoria', 'Context and authorship',
              'Contexto y autoría'),
          l(
              'Projeto acadêmico implementado por Flora Rosa, Sabrina Guimarães e Grazielle Stefane. O repositório original aborda aprendizado de máquina no contexto do autismo; esta apresentação registra o estudo técnico e suas limitações. Não demonstra diagnóstico por imagem.',
              'Academic project implemented by Flora Rosa, Sabrina Guimarães and Grazielle Stefane. The original repository concerns machine learning in the context of autism; this presentation documents the technical study and its limitations. It does not establish image-based diagnosis.',
              'Proyecto académico implementado por Flora Rosa, Sabrina Guimarães y Grazielle Stefane. El repositorio aborda aprendizaje automático en el contexto del autismo; esta presentación documenta el estudio técnico y sus límites. No demuestra diagnóstico por imagen.')
        ),
        (
          l('O que existe no código', 'What the code contains',
              'Qué contiene el código'),
          l(
              'O script prepara arquivos rotulados e define uma VGG19 com pesos ImageNet, camadas densas, dropout e saída de duas classes. Há divisão estratificada de validação, aumento de dados e cálculo de matriz de confusão e relatório de classificação. O conjunto de teste é lido, mas a avaliação final independente ainda não é executada.',
              'The script prepares labeled files and defines VGG19 with ImageNet weights, dense layers, dropout and a two-class output. It includes stratified validation, augmentation, a confusion matrix and a classification report. A test set is read, but independent final test evaluation is not implemented.',
              'El script prepara archivos etiquetados y define VGG19 con pesos ImageNet, capas densas, dropout y salida de dos clases. Incluye validación estratificada, aumento de datos, matriz de confusión e informe. Se lee un conjunto de prueba, pero no se implementa su evaluación final independiente.')
        ),
        (
          l('Verificação local realizada', 'Local verification performed',
              'Verificación local realizada'),
          l(
              'Em 12/11/2026, executei três testes automatizados: rejeição de rótulo desconhecido, ordenação estável com exclusão de arquivos não-imagem e rejeição de pasta vazia. Todos passaram. A verificação de sintaxe de main.py e dataset.py também passou. Esses testes usam nomes de arquivos temporários, sem avaliar pessoas ou treinar a rede.',
              'On 12 November 2026, I ran three automated tests: unknown-label rejection, stable ordering with non-image exclusion, and empty-folder rejection. All passed, as did syntax checks for main.py and dataset.py. These checks use temporary filenames, without assessing people or training the network.',
              'El 12/11/2026 ejecuté tres pruebas: rechazo de etiquetas desconocidas, orden estable ignorando archivos no-imagen y rechazo de carpetas vacías. Todas pasaron, al igual que la verificación de sintaxis de main.py y dataset.py. Usan nombres temporales, sin evaluar personas ni entrenar la red.')
        ),
        (
          l('O que não foi validado', 'What has not been validated',
              'Qué no se ha validado'),
          l(
              'Não executei o treinamento nem inferências sobre rostos e não publico fotos ou previsões de condições de saúde. Os testes de código não validam rótulos clínicos, origem e autorização das imagens, representatividade, generalização ou utilidade clínica. Não há resultado de acurácia desta execução. Uma leitura crítica deve discutir vieses, duplicatas e possível vazamento entre partições.',
              'I did not run training or facial inference and do not publish photos or health-condition predictions. Code tests do not validate clinical labels, image provenance and authorization, representativeness, generalization or clinical utility. This run produced no accuracy result. A critical review should examine bias, duplicates and possible leakage between partitions.',
              'No ejecuté entrenamiento ni inferencias sobre rostros y no publico fotos ni predicciones de salud. Las pruebas de código no validan etiquetas clínicas, origen y autorización de imágenes, representatividad, generalización ni utilidad clínica. Esta ejecución no produjo exactitud. La revisión debe abordar sesgos, duplicados y posibles fugas entre particiones.')
        ),
      ],
      source:
          'GitHub · FloraRosaPupo/Aprendizado-de-maquina-para-deteccao-do-autismo',
      url:
          'https://github.com/FloraRosaPupo/Aprendizado-de-maquina-para-deteccao-do-autismo');
  @override
  Widget build(BuildContext context) => Theme(
        data: ThemeData(
            brightness: Brightness.dark,
            useMaterial3: true,
            fontFamily: 'Montserrat',
            scaffoldBackgroundColor: const Color(0xFF19131F),
            colorScheme: ColorScheme.fromSeed(
                seedColor: const Color(0xFFD4AEFC),
                brightness: Brightness.dark,
                surface: const Color(0xFF211A29)),
            textTheme: ThemeData.dark().textTheme.apply(
                fontFamily: 'Montserrat',
                bodyColor: const Color(0xFFF3EDF8),
                displayColor: const Color(0xFFF3EDF8))),
        child: Builder(
            builder: (ctx) => Scaffold(body:
                    SafeArea(child: LayoutBuilder(builder: (context, box) {
                  final wide = box.maxWidth >= 900 &&
                      MediaQuery.textScalerOf(context).scale(1) < 1.3;
                  final pad = box.maxWidth < 600 ? 24.0 : 48.0;
                  Widget section(Widget content,
                          {Color? color, Key? key}) =>
                      Container(
                          key: key,
                          color: color,
                          padding: EdgeInsets.symmetric(
                              horizontal: pad, vertical: wide ? 42 : 30),
                          child: Center(
                              child: ConstrainedBox(
                                  constraints:
                                      const BoxConstraints(maxWidth: 1160),
                                  child: content)));
                  final intro = Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        eyebrow(l(
                            'FLORA ROSA / INTELIGÊNCIA ARTIFICIAL',
                            'FLORA ROSA / ARTIFICIAL INTELLIGENCE',
                            'FLORA ROSA / INTELIGENCIA ARTIFICIAL')),
                        const SizedBox(height: 22),
                        heading(
                            l(
                                'Entre perguntas,\nideias e IA.',
                                'Between questions,\nideas and AI.',
                                'Entre preguntas,\nideas e IA.'),
                            size: wide ? 60 : 40),
                        const SizedBox(height: 22),
                        copy(l(
                            'O que estudo, experimento e imagino com inteligência artificial. Uma frente da minha atuação que conecta pesquisa, tecnologia e possibilidades para negócios.',
                            'What I study, test and imagine with artificial intelligence. One side of my work connecting research, technology and business possibilities.',
                            'Lo que estudio, experimento e imagino con inteligencia artificial. Una faceta de mi trabajo que conecta investigación, tecnología y posibilidades de negocio.')),
                        const SizedBox(height: 24),
                        Wrap(spacing: 12, runSpacing: 12, children: [
                          FilledButton.icon(
                              onPressed: () => go(workKey),
                              icon: const Icon(Icons.south, size: 17),
                              label: Text(l('Explorar meu trabalho',
                                  'Explore my work', 'Explorar mi trabajo'))),
                          TextButton(
                              onPressed: () => go(ideasKey),
                              child: Text(l('IA nos negócios →',
                                  'AI in business →', 'IA en los negocios →')))
                        ]),
                        const SizedBox(height: 18),
                        Text(
                            l(
                                'Pós-graduanda em IA aplicada a negócios · UniBH',
                                'Postgraduate student in AI applied to business · UniBH',
                                'Estudiante de posgrado en IA aplicada a los negocios · UniBH'),
                            style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xFFC8BBD2),
                                height: 1.5)),
                      ]);
                  final triagemDescription = l(
                      'Classificação de chamados com TF-IDF e regressão logística, integrada a um painel de revisão humana. Um experimento meu de IA aplicada ao atendimento.',
                      'Ticket classification with TF-IDF and logistic regression, integrated with a human-review dashboard. My experiment in AI for customer support.',
                      'Clasificación de solicitudes con TF-IDF y regresión logística, integrada con un panel de revisión humana. Un experimento mío de IA aplicada a la atención.');
                  Widget actions(VoidCallback read, {bool github = false}) =>
                      Wrap(spacing: 10, runSpacing: 10, children: [
                        FilledButton(
                            onPressed: read,
                            child: Text(l('Ler análise', 'Read analysis',
                                'Leer análisis'))),
                        if (github)
                          TextButton.icon(
                              onPressed: () => open(
                                  'https://github.com/FloraRosaPupo/ticket-triage-ml'),
                              icon: const Icon(Icons.open_in_new, size: 15),
                              label: const Text('GitHub'))
                      ]);
                  return Column(children: [
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: pad, vertical: 14),
                        child: Row(children: [
                          const Expanded(
                              child: Text('flora × IA',
                                  style: TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.w800,
                                      letterSpacing: -1))),
                          if (wide)
                            TextButton(
                                onPressed: () => Navigator.of(context)
                                    .pushNamedAndRemoveUntil('/', (_) => false),
                                child: Text(l('Desenvolvimento ↗',
                                    'Development ↗', 'Desarrollo ↗')))
                          else
                            IconButton(
                                tooltip: l('Desenvolvimento', 'Development',
                                    'Desarrollo'),
                                onPressed: () => Navigator.of(context)
                                    .pushNamedAndRemoveUntil('/', (_) => false),
                                icon: const Icon(Icons.code)),
                          PopupMenuButton<String>(
                              tooltip: l('Idioma', 'Language', 'Idioma'),
                              initialValue: lang,
                              onSelected: PortfolioPreferences.of(context)
                                  ?.onLanguageChanged,
                              itemBuilder: (_) => const [
                                    PopupMenuItem(
                                        value: 'pt',
                                        child: LanguageLabel(
                                            'pt', 'PT · Português')),
                                    PopupMenuItem(
                                        value: 'en',
                                        child: LanguageLabel(
                                            'en', 'EN · English')),
                                    PopupMenuItem(
                                        value: 'es',
                                        child:
                                            LanguageLabel('es', 'ES · Español'))
                                  ],
                              child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child:
                                      LanguageLabel(lang, lang.toUpperCase())))
                        ])),
                    Expanded(
                        child: SingleChildScrollView(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                          section(wide
                              ? Row(children: [
                                  Expanded(flex: 6, child: intro),
                                  const SizedBox(width: 44),
                                  Expanded(
                                      flex: 4, child: _IdeaArt(motion: motion))
                                ])
                              : intro),
                          section(
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    eyebrow(l(
                                        '01 / NA PRÁTICA E NA PESQUISA',
                                        '01 / PRACTICE AND RESEARCH',
                                        '01 / PRÁCTICA E INVESTIGACIÓN')),
                                    const SizedBox(height: 14),
                                    heading(l(
                                        'Meu trabalho com IA',
                                        'My work with AI',
                                        'Mi trabajo con IA')),
                                    const SizedBox(height: 10),
                                    copy(l(
                                        'Projetos implementados e estudos da pós, cada um com seu contexto e estágio.',
                                        'Implemented projects and postgraduate studies, each with its own context and stage.',
                                        'Proyectos implementados y estudios de posgrado, cada uno con su contexto y etapa.')),
                                    const SizedBox(height: 24),
                                    _NotebookCarousel(
                                        id: 'work',
                                        count: 3,
                                        language: lang,
                                        builder: (i) {
                                          if (i == 0) {
                                            return _NotebookCard(
                                                wide: wide,
                                                visual: const ProjectPreview(
                                                    image:
                                                        'assets/projects/triagem.png',
                                                    video:
                                                        'previews/triagem.mp4',
                                                    title: 'Triagem',
                                                    aspectRatio: 1440 / 1000),
                                                category: l(
                                                    'SUPORTE / EXPERIMENTO IMPLEMENTADO',
                                                    'SUPPORT / IMPLEMENTED EXPERIMENT',
                                                    'SOPORTE / EXPERIMENTO IMPLEMENTADO'),
                                                title: 'Triagem',
                                                description: triagemDescription,
                                                tags: const [
                                                  'TF-IDF',
                                                  'Machine learning',
                                                  'Python'
                                                ],
                                                note: l(
                                                    'Base pequena e sintética · sem validação em produção',
                                                    'Small synthetic dataset · no production validation',
                                                    'Base pequeña y sintética · sin validación en producción'),
                                                actions: actions(
                                                    () => article(
                                                            ctx, 'Triagem', [
                                                          (
                                                            l(
                                                                'O problema e minha contribuição',
                                                                'Problem and my contribution',
                                                                'Problema y mi contribución'),
                                                            l(
                                                                'Como sugerir assuntos para chamados a partir do texto? Desenvolvi um painel React com busca, filtros, Kanban e revisão humana, integrado a uma API Python.',
                                                                'How can ticket topics be suggested from their text? I built a React dashboard with search, filters, Kanban and human review, integrated with a Python API.',
                                                                '¿Cómo sugerir temas de solicitudes a partir del texto? Desarrollé un panel React con búsqueda, filtros, Kanban y revisión humana, integrado con una API Python.')
                                                          ),
                                                          (
                                                            l(
                                                                'A abordagem',
                                                                'Approach',
                                                                'Enfoque'),
                                                            l(
                                                                'TF-IDF representa os textos numericamente; regressão logística realiza a classificação supervisionada. As sugestões apoiam uma decisão delimitada no fluxo de atendimento, com revisão humana.',
                                                                'TF-IDF represents text numerically; logistic regression performs supervised classification. Suggestions support a bounded service decision with human review.',
                                                                'TF-IDF representa textos numéricamente; la regresión logística realiza clasificación supervisada. Las sugerencias apoyan una decisión delimitada con revisión humana.')
                                                          ),
                                                          (
                                                            l(
                                                                'Como avaliar e o que falta',
                                                                'Evaluation and remaining work',
                                                                'Evaluación y próximos pasos'),
                                                            l(
                                                                'A demonstração usa chamados fictícios e dados sintéticos. Não comprova precisão ou produtividade em produção. Um piloto exigiria chamados representativos, separação de treino e teste, avaliação por categoria, frequência de correções humanas e tempo de triagem.',
                                                                'The demo uses fictional tickets and synthetic data. It does not establish production accuracy or productivity. A pilot needs representative tickets, training/test separation, category-level evaluation, human correction rates and triage time.',
                                                                'La demostración usa solicitudes ficticias y datos sintéticos. No demuestra precisión ni productividad en producción. Un piloto requiere solicitudes representativas, separación de entrenamiento y prueba, evaluación por categoría, correcciones humanas y tiempo de clasificación.')
                                                          ),
                                                        ]),
                                                    github: true));
                                          }
                                          if (i == 1) {
                                            return _NotebookCard(
                                                wide: wide,
                                                visual: null,
                                                category: l(
                                                    'VISÃO COMPUTACIONAL / ESTUDO ACADÊMICO',
                                                    'COMPUTER VISION / ACADEMIC STUDY',
                                                    'VISIÓN COMPUTACIONAL / ESTUDIO ACADÉMICO'),
                                                title: l(
                                                    'Classificação de imagens com VGG19',
                                                    'Image classification with VGG19',
                                                    'Clasificación de imágenes con VGG19'),
                                                description: l(
                                                    'Projeto acadêmico sobre aprendizado de máquina no contexto do autismo. Um estudo da arquitetura e da preparação dos dados, apresentado com análise crítica das limitações.',
                                                    'An academic machine-learning project in the context of autism. A study of architecture and data preparation, presented with a critical review of its limitations.',
                                                    'Proyecto académico de aprendizaje automático en el contexto del autismo. Estudio de arquitectura y preparación de datos, con análisis crítico de las limitaciones.'),
                                                tags: const [
                                                  'VGG19',
                                                  'TensorFlow / Keras',
                                                  'Python'
                                                ],
                                                note: l(
                                                    'Coautoria: Flora Rosa, Sabrina Guimarães e Grazielle Stefane · sem finalidade diagnóstica',
                                                    'Coauthors: Flora Rosa, Sabrina Guimarães and Grazielle Stefane · not for diagnosis',
                                                    'Coautoras: Flora Rosa, Sabrina Guimarães y Grazielle Stefane · sin finalidad diagnóstica'),
                                                actions: Wrap(
                                                    spacing: 10,
                                                    runSpacing: 10,
                                                    children: [
                                                      FilledButton(
                                                          onPressed: () =>
                                                              autismArticle(
                                                                  ctx),
                                                          child: Text(l(
                                                              'Ler análise',
                                                              'Read analysis',
                                                              'Leer análisis'))),
                                                      TextButton.icon(
                                                          onPressed: () => open(
                                                              'https://github.com/FloraRosaPupo/Aprendizado-de-maquina-para-deteccao-do-autismo'),
                                                          icon: const Icon(
                                                              Icons.open_in_new,
                                                              size: 15),
                                                          label: const Text(
                                                              'GitHub'))
                                                    ]));
                                          }
                                          return _NotebookCard(
                                              wide: wide,
                                              visual: null,
                                              category: l(
                                                  'PÓS-GRADUAÇÃO / PROPOSTA METODOLÓGICA',
                                                  'POSTGRADUATE STUDY / METHODOLOGY',
                                                  'POSGRADO / PROPUESTA METODOLÓGICA'),
                                              title: l(
                                                  'Preços de imóveis',
                                                  'Property prices',
                                                  'Precios de inmuebles'),
                                              description: l(
                                                  'Minha análise sobre regressão para apoiar a precificação imobiliária: modelos candidatos, preparação de dados e critérios de avaliação.',
                                                  'My analysis of regression for property pricing: candidate models, data preparation and evaluation criteria.',
                                                  'Mi análisis de regresión para valoración inmobiliaria: modelos candidatos, preparación de datos y criterios de evaluación.'),
                                              tags: [
                                                l('Regressão', 'Regression',
                                                    'Regresión'),
                                                'Random Forest',
                                                'MAE / RMSE'
                                              ],
                                              note: l(
                                                  'Estudo conceitual · sem treinamento ou resultados medidos',
                                                  'Conceptual study · no training or measured results',
                                                  'Estudio conceptual · sin entrenamiento ni resultados medidos'),
                                              actions: actions(
                                                  () => propertyArticle(ctx)));
                                        }),
                                  ]),
                              key: workKey,
                              color: const Color(0xFF211A29)),
                          section(
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    eyebrow(l(
                                        '02 / OBSERVAR, CONECTAR, PROPOR',
                                        '02 / OBSERVE, CONNECT, PROPOSE',
                                        '02 / OBSERVAR, CONECTAR, PROPONER')),
                                    const SizedBox(height: 14),
                                    heading(l(
                                        'Onde a IA pode fazer sentido?',
                                        'Where could AI make sense?',
                                        '¿Dónde puede tener sentido la IA?')),
                                    const SizedBox(height: 12),
                                    copy(l(
                                        'Cinco aplicações reais de IA: o negócio, a técnica documentada e como eu pensaria uma adaptação.',
                                        'Five real AI applications: the business, the documented technique and how I would approach an adaptation.',
                                        'Cinco aplicaciones reales de IA: el negocio, la técnica documentada y cómo plantearía una adaptación.')),
                                    const SizedBox(height: 12),
                                    Text(
                                        l(
                                            'Pesquisa com apoio de IA · propostas para revisão da autora · fontes consultadas em 12/11/2026',
                                            'AI-assisted research · proposals for author review · sources accessed 12 November 2026',
                                            'Investigación con apoyo de IA · propuestas para revisión de la autora · fuentes consultadas el 12/11/2026'),
                                        style: const TextStyle(
                                            fontSize: 11,
                                            height: 1.6,
                                            color: Color(0xFFC8BBD2))),
                                    const SizedBox(height: 24),
                                    _NotebookCarousel(
                                        id: 'business',
                                        compact: true,
                                        count: businessIdeas.length,
                                        language: lang,
                                        builder: (i) {
                                          final b = businessIdeas[i];
                                          String t(String field) =>
                                              businessText(i, field, lang);
                                          return _NotebookCard(
                                              wide: wide,
                                              visual: null,
                                              category:
                                                  t('sector').toUpperCase(),
                                              title: t('title'),
                                              description:
                                                  '${t('question')}\n\n${l('Solução com IA', 'AI solution', 'Solución con IA')}: ${businessSummary(i, lang)}',
                                              tags: [businessTask(i, lang)],
                                              note:
                                                  '${b.source} · ${businessDate(i, lang)}',
                                              actions: Wrap(
                                                  spacing: 10,
                                                  runSpacing: 10,
                                                  children: [
                                                    FilledButton(
                                                        onPressed: () =>
                                                            businessArticle(
                                                                ctx, i),
                                                        child: Text(l(
                                                            'Ler análise',
                                                            'Read analysis',
                                                            'Leer análisis'))),
                                                    TextButton.icon(
                                                        onPressed: () =>
                                                            open(b.url),
                                                        icon: const Icon(
                                                            Icons.open_in_new,
                                                            size: 15),
                                                        label: Text(l(
                                                            'Notícia original',
                                                            'Original news',
                                                            'Noticia original')))
                                                  ]));
                                        }),
                                  ]),
                              key: ideasKey),
                          section(
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                          heading(
                                              l(
                                                  'Pesquisa e desenvolvimento.\nDuas frentes, a mesma Flora.',
                                                  'Research and development.\nTwo sides, the same Flora.',
                                                  'Investigación y desarrollo.\nDos facetas, la misma Flora.'),
                                              size: 26),
                                          const SizedBox(height: 16),
                                          copy(l(
                                              'Minha experiência em desenvolvimento e UX/UI também informa as perguntas que faço sobre IA e negócios.',
                                              'My experience in development and UX/UI also informs the questions I ask about AI and business.',
                                              'Mi experiencia en desarrollo y UX/UI también orienta mis preguntas sobre IA y negocios.')),
                                          const SizedBox(height: 16),
                                          Wrap(spacing: 12, children: [
                                            TextButton(
                                                onPressed: () => open(
                                                    'https://www.linkedin.com/in/florarosa'),
                                                child:
                                                    const Text('LinkedIn ↗')),
                                            TextButton(
                                                onPressed: () => Navigator.of(
                                                        context)
                                                    .pushNamedAndRemoveUntil(
                                                        '/', (_) => false),
                                                child: Text(l(
                                                    'Desenvolvimento ↗',
                                                    'Development ↗',
                                                    'Desarrollo ↗')))
                                          ])
                                        ]))
                                  ]),
                              color: const Color(0xFF211A29)),
                        ]))),
                  ]);
                })))),
      );
}

class _NotebookCard extends StatelessWidget {
  final bool wide;
  final Widget? visual;
  final Widget actions;
  final String category, title, description, note;
  final List<String> tags;
  const _NotebookCard(
      {required this.wide,
      required this.visual,
      required this.actions,
      required this.category,
      required this.title,
      required this.description,
      required this.tags,
      required this.note});
  @override
  Widget build(BuildContext context) {
    final text = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(category,
              style: const TextStyle(
                  fontSize: 10,
                  letterSpacing: 1.4,
                  height: 1.5,
                  color: Color(0xFFD4AEFC),
                  fontWeight: FontWeight.w700)),
          const SizedBox(height: 16),
          Text(title,
              style: TextStyle(
                  fontSize: wide ? 30 : 24,
                  height: 1.2,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -.6)),
          const SizedBox(height: 16),
          Text(description,
              style: const TextStyle(
                  fontSize: 14, height: 1.8, color: Color(0xFFC8BBD2))),
          const SizedBox(height: 18),
          Wrap(spacing: 8, runSpacing: 8, children: [
            for (final tag in tags)
              Text(tag,
                  style:
                      const TextStyle(fontSize: 11, color: Color(0xFFD4AEFC)))
          ]),
          const SizedBox(height: 18),
          actions,
          const SizedBox(height: 16),
          Text(note,
              style: const TextStyle(
                  fontSize: 11, height: 1.6, color: Color(0xFFC8BBD2)))
        ]);
    return Container(
        decoration: BoxDecoration(
            color: const Color(0xFF2B2135),
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: const Color(0xFF493953))),
        child: SingleChildScrollView(
            padding: EdgeInsets.all(wide ? 28 : 20),
            child: visual == null
                ? text
                : wide
                    ? Row(children: [
                        Expanded(
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(14),
                                child: visual!)),
                        const SizedBox(width: 32),
                        Expanded(child: text)
                      ])
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            SizedBox(
                                height: 180, child: Center(child: visual!)),
                            const SizedBox(height: 22),
                            text
                          ])));
  }
}

class _NotebookCarousel extends StatefulWidget {
  final String id, language;
  final bool compact;
  final int count;
  final Widget Function(int) builder;
  const _NotebookCarousel(
      {required this.id,
      required this.count,
      required this.language,
      required this.builder,
      this.compact = false});
  @override
  State<_NotebookCarousel> createState() => _NotebookCarouselState();
}

class _NotebookCarouselState extends State<_NotebookCarousel> {
  final controller = PageController();
  int selected = 0;
  final heights = <int, double>{};
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void move(int i) {
    if (MediaQuery.disableAnimationsOf(context)) {
      controller.jumpToPage(i);
    } else {
      controller.animateToPage(i,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeOutCubic);
    }
  }

  String l(String pt, String en, String es) => widget.language == 'en'
      ? en
      : widget.language == 'es'
          ? es
          : pt;
  @override
  Widget build(BuildContext context) => LayoutBuilder(builder: (context, box) {
        final wide = box.maxWidth >= 804 &&
            MediaQuery.textScalerOf(context).scale(1) < 1.3;
        return Column(children: [
          SizedBox(
              key: ValueKey('${widget.id}-viewport'),
              height: heights[selected] ?? (wide ? 360 : 480),
              child: PageView.builder(
                  controller: controller,
                  itemCount: widget.count,
                  onPageChanged: (i) => setState(() => selected = i),
                  itemBuilder: (_, i) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: OverflowBox(
                          minHeight: 0,
                          maxHeight: double.infinity,
                          alignment: Alignment.topCenter,
                          child: _MeasureHeight(
                              onHeight: (height) {
                                if (mounted &&
                                    (heights[i] == null ||
                                        (heights[i]! - height).abs() > 1)) {
                                  setState(() => heights[i] = height);
                                }
                              },
                              child: widget.builder(i)))))),
          const SizedBox(height: 12),
          Row(children: [
            Text('${selected + 1} / ${widget.count}',
                style: const TextStyle(fontSize: 12, color: Color(0xFFC8BBD2))),
            const Spacer(),
            SizedBox(
                width: 64,
                child: LinearProgressIndicator(
                    value: (selected + 1) / widget.count,
                    color: const Color(0xFFD4AEFC),
                    backgroundColor: const Color(0xFF493953))),
            const Spacer(),
            IconButton(
                key: ValueKey('${widget.id}-previous'),
                tooltip: l('Anterior', 'Previous', 'Anterior'),
                onPressed: selected > 0 ? () => move(selected - 1) : null,
                icon: const Icon(Icons.arrow_back)),
            IconButton(
                key: ValueKey('${widget.id}-next'),
                tooltip: l('Próximo', 'Next', 'Siguiente'),
                onPressed: selected < widget.count - 1
                    ? () => move(selected + 1)
                    : null,
                icon: const Icon(Icons.arrow_forward))
          ])
        ]);
      });
}

class _IdeaArt extends StatelessWidget {
  final Animation<double> motion;
  const _IdeaArt({required this.motion});
  @override
  Widget build(BuildContext context) => Semantics(
      label: switch (PortfolioPreferences.of(context)?.language) {
        'en' => 'Abstract illustration of connected ideas',
        'es' => 'Ilustración abstracta de ideas conectadas',
        _ => 'Ilustração abstrata de ideias conectadas'
      },
      image: true,
      child: AspectRatio(
          aspectRatio: 1,
          child: AnimatedBuilder(
              animation: motion,
              builder: (context, _) => CustomPaint(
                  painter: _OrbitPainter(motion.value, palette(context).accent),
                  child: Center(
                      child: Text(
                          PortfolioPreferences.of(context)?.language == 'en'
                              ? 'AI'
                              : 'IA',
                          style: TextStyle(
                              fontSize: 68,
                              fontWeight: FontWeight.w300,
                              color: palette(context).ink)))))));
}

class _OrbitPainter extends CustomPainter {
  final double progress;
  final Color color;
  _OrbitPainter(this.progress, this.color);
  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = size.shortestSide * .36;
    final line = Paint()
      ..color = color.withValues(alpha: .22)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    canvas.drawCircle(center, radius * .64, line);
    canvas.drawCircle(center, radius, line);
    for (var i = 0; i < 7; i++) {
      final a = i * math.pi * 2 / 7 + progress * math.pi * 2;
      final point = center + Offset(math.cos(a), math.sin(a)) * radius;
      final next = center +
          Offset(math.cos(a + 4 * math.pi / 7), math.sin(a + 4 * math.pi / 7)) *
              radius;
      canvas.drawLine(point, next, line);
      canvas.drawCircle(point, i.isEven ? 7 : 4,
          Paint()..color = color.withValues(alpha: .8));
    }
  }

  @override
  bool shouldRepaint(_OrbitPainter old) =>
      old.progress != progress || old.color != color;
}

class _MeasureHeight extends SingleChildRenderObjectWidget {
  final ValueChanged<double> onHeight;
  const _MeasureHeight({required this.onHeight, required super.child});
  @override
  RenderObject createRenderObject(BuildContext context) => _HeightBox(onHeight);
  @override
  void updateRenderObject(
          BuildContext context, covariant _HeightBox renderObject) =>
      renderObject.onHeight = onHeight;
}

class _HeightBox extends RenderProxyBox {
  ValueChanged<double> onHeight;
  double? lastHeight;
  _HeightBox(this.onHeight);
  @override
  void performLayout() {
    super.performLayout();
    if (lastHeight != size.height) {
      lastHeight = size.height;
      final height = size.height;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (attached) onHeight(height);
      });
    }
  }
}
