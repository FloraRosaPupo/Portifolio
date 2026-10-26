import 'project_preview.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/content.dart';

const ink = Color(0xFF2E2239);
const accent = Color(0xFF623398);
const muted = Color(0xFF6C5B77);
const paper = Color(0xFFFAF7FC);
const highlight = Color(0xFFEAD3FF);

class PortfolioPage extends StatefulWidget {
  final Future<bool> Function(Uri)? openLink;
  const PortfolioPage({super.key, this.openLink});
  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final sections = List.generate(5, (_) => GlobalKey());
  final scroll = ScrollController();
  @override
  void dispose() {
    scroll.dispose();
    super.dispose();
  }

  void go(int index) {
    final context = sections[index].currentContext;
    if (context != null) {
      Scrollable.ensureVisible(context,
          duration: MediaQuery.disableAnimationsOf(context)
              ? Duration.zero
              : const Duration(milliseconds: 500),
          curve: Curves.easeOutCubic);
    }
  }

  Future<void> open(String url) async {
    try {
      final uri = Uri.parse(url);
      final opened = await (widget.openLink?.call(uri) ??
          launchUrl(uri, mode: LaunchMode.platformDefault));
      if (!opened) throw StateError('Link indisponível');
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Não foi possível abrir o link. Tente novamente.')));
      }
    }
  }

  Widget button(String label, VoidCallback action, {bool filled = false}) =>
      filled
          ? FilledButton(
              onPressed: action,
              style: FilledButton.styleFrom(
                  backgroundColor: accent,
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 22)),
              child: Text(label))
          : OutlinedButton(
              onPressed: action,
              style: OutlinedButton.styleFrom(
                  foregroundColor: ink,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 22)),
              child: Text(label));

  @override
  Widget build(BuildContext context) =>
      LayoutBuilder(builder: (context, constraints) {
        final wide = constraints.maxWidth >= 900;
        final pad = constraints.maxWidth < 600 ? 24.0 : 48.0;
        Widget section(Widget child, {Color color = paper, Key? key}) =>
            Container(
              key: key,
              width: double.infinity,
              color: color,
              padding: EdgeInsets.symmetric(
                  horizontal: pad, vertical: wide ? 88 : 56),
              child: Center(
                  child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1160),
                      child: child)),
            );
        return Scaffold(
            body: SafeArea(
                child: Column(children: [
          Container(
              decoration: const BoxDecoration(
                  color: paper,
                  border: Border(bottom: BorderSide(color: Color(0xFFE4DCEB)))),
              padding: EdgeInsets.symmetric(horizontal: pad, vertical: 16),
              child: Center(
                  child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1160),
                      child: Row(children: [
                        const Expanded(
                            child: Text('flora rosa.',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: -1))),
                        if (wide) ...[
                          for (final pair in [
                            (0, 'Projetos'),
                            (1, 'Trajetória'),
                            (2, 'IA'),
                            (3, 'Sobre'),
                            (4, 'Contato')
                          ])
                            TextButton(
                                onPressed: () => go(pair.$1),
                                child: Text(pair.$2,
                                    style: const TextStyle(color: ink)))
                        ],
                        if (!wide)
                          PopupMenuButton<int>(
                              tooltip: 'Abrir navegação',
                              onSelected: go,
                              itemBuilder: (_) => [
                                    for (final pair in [
                                      (0, 'Projetos'),
                                      (1, 'Trajetória'),
                                      (2, 'IA'),
                                      (3, 'Sobre'),
                                      (4, 'Contato')
                                    ])
                                      PopupMenuItem(
                                          value: pair.$1, child: Text(pair.$2))
                                  ]),
                      ])))),
          Expanded(
              child: Scrollbar(
                  controller: scroll,
                  child: SingleChildScrollView(
                      controller: scroll,
                      child: Column(children: [
                        section(columns(
                            wide,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Eyebrow('FLORA ROSA PUPO'),
                                const SizedBox(height: 20),
                                Text('Mobile e backend, conectados.',
                                    style: TextStyle(
                                        fontSize: wide ? 52 : 36,
                                        height: 1.12,
                                        letterSpacing: -1.8,
                                        fontWeight: FontWeight.w600)),
                                const SizedBox(height: 24),
                                const Text('Desenvolvedora Full Stack',
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: accent,
                                        height: 1.4,
                                        fontWeight: FontWeight.w500)),
                                const SizedBox(height: 20),
                                const Body(
                                    'Desenvolvedora com experiência em aplicações multiplataforma, APIs REST e bancos de dados. Atuação em produtos publicados, conectando interface, regras de negócio e integrações.'),
                                const SizedBox(height: 20),
                                const Text(
                                    'Flutter & Dart · Node.js · SQL & PostgreSQL · UX/UI',
                                    style: TextStyle(
                                        fontSize: 15,
                                        height: 1.8,
                                        color: ink,
                                        fontWeight: FontWeight.w500)),
                                const SizedBox(height: 32),
                                Wrap(spacing: 16, runSpacing: 12, children: [
                                  button('Ver projetos', () => go(0),
                                      filled: true),
                                  button('Falar comigo', () => go(4)),
                                  TextButton(
                                      onPressed: () => open(curriculo),
                                      child: const Text('Baixar currículo ↓')),
                                ]),
                              ],
                            ),
                            Container(
                                padding: EdgeInsets.all(wide ? 32 : 24),
                                decoration: BoxDecoration(
                                    color: accent,
                                    borderRadius: BorderRadius.circular(12)),
                                child: const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(children: [
                                        Icon(Icons.code,
                                            color: highlight, size: 30),
                                        Spacer(),
                                        Flexible(
                                            child: Text('ATUAÇÃO PROFISSIONAL',
                                                style: TextStyle(
                                                    color: highlight,
                                                    fontSize: 11,
                                                    letterSpacing: 2)))
                                      ]),
                                      SizedBox(height: 44),
                                      Text(
                                          'Flutter & Dart\nNode.js & APIs\nPostgreSQL',
                                          style: TextStyle(
                                              fontSize: 32,
                                              height: 1.3,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: -1)),
                                      SizedBox(height: 40),
                                      Divider(color: Color(0xFF9470B5)),
                                      SizedBox(height: 20),
                                      Text('ATUALMENTE NA DOUBLEX',
                                          style: TextStyle(
                                              color: highlight,
                                              fontSize: 11,
                                              letterSpacing: 1.4)),
                                      SizedBox(height: 14),
                                      Text(
                                          'Desenvolvimento de aplicações e integrações. Experiência também na FlowCode, Roteo e em projetos freelance.',
                                          style: TextStyle(
                                              color: Colors.white,
                                              height: 1.8,
                                              fontSize: 15)),
                                    ])))),
                        section(
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Heading('Projetos'),
                                  const Body(
                                      'Experiência em produtos publicados e projetos independentes com código disponível para consulta.'),
                                  const SizedBox(height: 36),
                                  const Eyebrow('APLICATIVOS PUBLICADOS'),
                                  const SizedBox(height: 20),
                                  ProfessionalProduct(
                                      number: '01',
                                      name: 'Easy Comlink',
                                      relationship: 'DOUBLEX',
                                      description:
                                          'Atuação profissional no produto pela DoubleX.',
                                      onTap: () => open(
                                          'https://play.google.com/store/apps/details?id=com.mycompany.easycomlink&hl=pt_BR')),
                                  ProfessionalProduct(
                                      number: '02',
                                      name: 'IndicaZ Profissionais',
                                      relationship: 'FREELANCE',
                                      description:
                                          'Atuação como desenvolvedora freelancer no aplicativo.',
                                      onTap: () => open(
                                          'https://play.google.com/store/apps/details?id=com.mycompany.indicazprofissionais&hl=pt_BR')),
                                  ProfessionalProduct(
                                      number: '03',
                                      name: 'Roteo',
                                      relationship: 'DESENVOLVIMENTO MOBILE',
                                      description:
                                          'Produto em que atuei durante minha experiência na Roteo.',
                                      onTap: () => open(
                                          'https://play.google.com/store/apps/details?id=com.roteoapp.aa&hl=pt_BR')),
                                  const SizedBox(height: 64),
                                  const Eyebrow('PROJETOS INDEPENDENTES'),
                                  const SizedBox(height: 24),
                                  Column(
                                    children: [
                                      ProjectCard(
                                          title: 'Avalia',
                                          category: 'EDUCAÇÃO / INTELIGÊNCIA ARTIFICIAL',
                                          image:
                                              'assets/projects/avalia-dashboard.png',
                                          description:
                                              'Correção de provas com inteligência artificial, com turmas, alunos e resultados em um só lugar. O Avalia ajuda professores a organizar a rotina, acompanhar submissões e consultar o desempenho individual dos alunos. Desenvolvido em Flutter, com Cubit, Supabase, testes unitários e Golden Tests.',
                                          tags: const [
                                            'Flutter',
                                            'Cubit',
                                            'Supabase',
                                            'Correção com IA'
                                          ],
                                          onTap: () =>
                                              open('$github/projeto_Avalia'),
                                          background: const Color(0xFFEAE0F5)),
                                      const SizedBox(height: 56),
                                      ProjectCard(
                                          title: 'Bebeu?',
                                          category: 'BEM-ESTAR / FULL STACK',
                                          image: 'assets/projects/bebeu.png',
                                          description:
                                              'Hidratação no dia a dia: registro de consumo, meta diária e histórico dos últimos 7 dias. Widget na tela inicial para acompanhar a meta e adicionar água, notificações locais para os lembretes e armazenamento seguro do token de autenticação com Flutter Secure Storage. Backend em Node.js e PostgreSQL, com regras de negócio separadas da interface.',
                                          tags: const [
                                            'Flutter',
                                            'Node.js',
                                            'PostgreSQL',
                                            'Home Widget',
                                            'Notificações locais',
                                            'Secure Storage'
                                          ],
                                          onTap: () =>
                                              open('$github/controle_agua'),
                                          background: const Color(0xFFF0E6F8)),
                                    ],
                                  ),
                                  const SizedBox(height: 40),
                                  button('Mais projetos no GitHub ↗',
                                      () => open(github)),
                                  const SizedBox(height: 64),
                                ]),
                            key: sections[0],
                            color: Colors.white),
                        section(
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Heading('Experiência'),
                                  const Body(
                                      'Experiência em desenvolvimento, integração de sistemas e liderança de equipes.'),
                                  const SizedBox(height: 40),
                                  for (final entry in career)
                                    CareerEntry(
                                        company: entry.$1,
                                        role: entry.$2,
                                        dates: entry.$3,
                                        description: entry.$4),
                                ]),
                            key: sections[1]),
                        section(
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Eyebrow('AI-FIRST'),
                                  const Heading('Como eu desenvolvo com IA'),
                                  const Body(
                                      'IA não substitui critério técnico. Ela acelera o que está bem definido; o que protege a qualidade é a especificação, o teste e a revisão.'),
                                  const SizedBox(height: 36),
                                  columns(
                                      wide,
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            for (final item in aiPractices.take(
                                                (aiPractices.length + 1) ~/ 2))
                                              AiPractice(item.$1, item.$2)
                                          ]),
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            for (final item in aiPractices.skip(
                                                (aiPractices.length + 1) ~/ 2))
                                              AiPractice(item.$1, item.$2)
                                          ])),
                                  const SizedBox(height: 16),
                                  Wrap(spacing: 8, runSpacing: 8, children: [
                                    for (final t in aiTools) Tag(t)
                                  ]),
                                ]),
                            key: sections[2],
                            color: Colors.white),
                        section(
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Heading('Formação & competências'),
                                  columns(
                                      wide,
                                      const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Body(
                                                'Graduada em Sistemas de Informação pela UFV, com atuação em desenvolvimento mobile, backend e integração de sistemas. Minha experiência reúne Flutter/Dart, Node.js, APIs REST e bancos de dados relacionais.'),
                                            SizedBox(height: 20),
                                            Body(
                                                'A experiência em liderança na InfoAlto complementa minha atuação técnica com gestão de projetos e comunicação entre equipes. Atualmente curso a pós-graduação em Inteligência Artificial Aplicada aos Negócios na UniBH.'),
                                          ]),
                                      const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Education(
                                                'UniBH',
                                                'Inteligência Artificial Aplicada aos Negócios',
                                                'PÓS-GRADUAÇÃO • EM ANDAMENTO\n2026 · conclusão prevista em dezembro'),
                                            SizedBox(height: 24),
                                            Education(
                                                'Universidade Federal de Viçosa',
                                                'Bacharelado em Sistemas de Informação',
                                                'CONCLUÍDO • 2020 — JUL 2025\nCampus Rio Paranaíba'),
                                          ])),
                                  const SizedBox(height: 56),
                                  for (final group in skills.entries)
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 24),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(group.key,
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                              const SizedBox(height: 12),
                                              Wrap(
                                                  spacing: 8,
                                                  runSpacing: 8,
                                                  children: [
                                                    for (final skill
                                                        in group.value)
                                                      Tag(skill)
                                                  ])
                                            ])),
                                ]),
                            key: sections[3],
                            color: const Color(0xFFF1EBF7)),
                        section(
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Heading('Qualidade de software'),
                                const Body(
                                    'Testes fazem parte da minha prática de desenvolvimento: validar regras, acompanhar mudanças visuais e evitar regressões antes de publicar.'),
                                const SizedBox(height: 32),
                                columns(
                                    wide,
                                    const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Nos meus projetos',
                                              style: TextStyle(
                                                  fontSize: 23,
                                                  fontWeight: FontWeight.w600)),
                                          SizedBox(height: 16),
                                          Body(
                                              'Testes unitários de regras e estados, mocking de dependências e Golden Tests para acompanhar a interface. GitHub Actions automatiza as verificações a cada mudança.'),
                                          SizedBox(height: 20),
                                          Wrap(
                                              spacing: 8,
                                              runSpacing: 8,
                                              children: [
                                                Tag('Testes unitários'),
                                                Tag('Widget tests'),
                                                Tag('Golden Tests'),
                                                Tag('CI')
                                              ]),
                                        ]),
                                    Container(
                                        padding: const EdgeInsets.all(28),
                                        decoration: BoxDecoration(
                                            color: const Color(0xFFF1EBF7),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: const Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Icon(Icons.fact_check_outlined,
                                                  color: accent, size: 32),
                                              SizedBox(height: 16),
                                              Text('Neste portfólio',
                                                  style: TextStyle(
                                                      fontSize: 23,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                              SizedBox(height: 16),
                                              Body(
                                                  'Layout verificado em 320, 430, 768 e 1440 pixels, com texto ampliado em 50%. Testes de navegação, links e mensagens de erro, além de capturas visuais e compilação web.'),
                                            ]))),
                                const SizedBox(height: 28),
                                Wrap(spacing: 12, runSpacing: 12, children: [
                                  button(
                                      'Ver os testes ↗',
                                      () => open(
                                          '$github/Portifolio/tree/main/test')),
                                  button('Acompanhar verificações ↗',
                                      () => open('$github/Portifolio/actions')),
                                ]),
                              ],
                            ),
                            color: Colors.white),
                        section(
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Contato',
                                      style: TextStyle(
                                          color: highlight,
                                          letterSpacing: 2,
                                          fontSize: 12)),
                                  const SizedBox(height: 24),
                                  Text('Vamos conversar\nsobre o seu projeto.',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: wide ? 52 : 34,
                                          height: 1.2,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: -1.5)),
                                  const SizedBox(height: 28),
                                  const Text(
                                      'Para conversar sobre projetos, tecnologia e oportunidades.',
                                      style: TextStyle(
                                          color: Colors.white,
                                          height: 1.7,
                                          fontSize: 16)),
                                  const SizedBox(height: 28),
                                  Wrap(spacing: 16, runSpacing: 16, children: [
                                    for (final link in [
                                      ('WhatsApp ↗', whatsapp),
                                      ('E-mail ↗', email),
                                      ('LinkedIn ↗', linkedin),
                                      ('GitHub ↗', github),
                                      ('Currículo ↓', curriculo)
                                    ])
                                      OutlinedButton(
                                          onPressed: () => open(link.$2),
                                          style: OutlinedButton.styleFrom(
                                              foregroundColor: Colors.white,
                                              side: const BorderSide(
                                                  color: Color(0xFFB998D6)),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 24,
                                                      vertical: 20)),
                                          child: Text(link.$1))
                                  ]),
                                  const SizedBox(height: 64),
                                  const Divider(color: Color(0xFF9470B5)),
                                  const SizedBox(height: 24),
                                  const Text(
                                      'Flora Rosa Pupo · Desenvolvido com Flutter',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12)),
                                ]),
                            key: sections[4],
                            color: accent),
                      ])))),
        ])));
      });
}

Widget columns(bool wide, Widget first, Widget second) => wide
    ? Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(child: first),
        const SizedBox(width: 56),
        Expanded(child: second)
      ])
    : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [first, const SizedBox(height: 32), second]);

class Eyebrow extends StatelessWidget {
  final String text;
  const Eyebrow(this.text, {super.key});
  @override
  Widget build(BuildContext context) => Text(text,
      style: const TextStyle(
          fontSize: 11,
          letterSpacing: 1,
          color: accent,
          fontWeight: FontWeight.w600));
}

class Heading extends StatelessWidget {
  final String text;
  const Heading(this.text, {super.key});
  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Semantics(
          header: true,
          child: Text(text,
              style: const TextStyle(
                  fontSize: 30,
                  height: 1.2,
                  letterSpacing: -1.4,
                  fontWeight: FontWeight.w600))));
}

class Body extends StatelessWidget {
  final String text;
  const Body(this.text, {super.key});
  @override
  Widget build(BuildContext context) => Text(text,
      style: const TextStyle(fontSize: 16, height: 1.8, color: muted));
}

class Tag extends StatelessWidget {
  final String text;
  const Tag(this.text, {super.key});
  @override
  Widget build(BuildContext context) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFDCCFE6)),
          borderRadius: BorderRadius.circular(30)),
      child: Text(text, style: const TextStyle(fontSize: 12, color: ink)));
}

class AiPractice extends StatelessWidget {
  final String title, text;
  const AiPractice(this.title, this.text, {super.key});
  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.only(bottom: 28),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title,
            style: const TextStyle(
                fontSize: 19, height: 1.4, fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        Body(text),
      ]));
}

class Education extends StatelessWidget {
  final String school, course, dates;
  const Education(this.school, this.course, this.dates, {super.key});
  @override
  Widget build(BuildContext context) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(school,
            style: const TextStyle(
                color: accent, fontWeight: FontWeight.w700, fontSize: 16)),
        const SizedBox(height: 8),
        Text(course,
            style: const TextStyle(
                fontSize: 21, height: 1.4, fontWeight: FontWeight.w500)),
        const SizedBox(height: 12),
        Text(dates,
            style: const TextStyle(color: muted, fontSize: 12, height: 1.8))
      ]);
}

class ProjectCard extends StatelessWidget {
  final String title, category, image, description;
  final List<String> tags;
  final VoidCallback onTap;
  final Color background;
  const ProjectCard(
      {super.key,
      required this.title,
      required this.category,
      required this.image,
      required this.description,
      required this.tags,
      required this.onTap,
      required this.background});
  @override
  Widget build(BuildContext context) =>
      LayoutBuilder(builder: (context, constraints) {
        final sideBySide = constraints.maxWidth >= 760;
        final preview = Container(
          width: double.infinity,
          padding: EdgeInsets.all(sideBySide ? 28 : 12),
          decoration: BoxDecoration(
            color: Color.lerp(background, Colors.white, .65),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
              child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 340),
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xFFC8B8DA)),
                borderRadius: BorderRadius.circular(18),
                boxShadow: const [
                  BoxShadow(
                      color: Color(0x14623398),
                      blurRadius: 24,
                      offset: Offset(0, 8))
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: ProjectPreview(
                    image: image,
                    title: title,
                    video: title == 'Avalia'
                        ? 'previews/avalia.mp4'
                        : 'previews/bebeu.mp4'),
              ),
            ),
          )),
        );
        final details =
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Eyebrow(category),
          const SizedBox(height: 16),
          Text(title,
              style: TextStyle(
                  fontSize: sideBySide ? 44 : 34,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -1.2)),
          const SizedBox(height: 20),
          Body(description),
          const SizedBox(height: 24),
          Text(tags.join('  ·  '),
              style: const TextStyle(
                  fontSize: 14,
                  color: accent,
                  height: 1.8,
                  fontWeight: FontWeight.w500)),
          const SizedBox(height: 28),
          TextButton.icon(
              onPressed: onTap,
              icon: const Icon(Icons.north_east, size: 18),
              label: const Text('Explorar projeto')),
          const SizedBox(height: 20),
          const Text('Prévia em loop · dados demonstrativos',
              style: TextStyle(fontSize: 11, color: muted, height: 1.6)),
        ]);
        return Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: sideBySide
              ? Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                  Expanded(child: preview),
                  const SizedBox(width: 64),
                  Expanded(child: details)
                ])
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [preview, const SizedBox(height: 28), details]),
        );
      });
}

class ProfessionalProduct extends StatelessWidget {
  final String number, name, relationship, description;
  final VoidCallback onTap;
  const ProfessionalProduct(
      {super.key,
      required this.number,
      required this.name,
      required this.relationship,
      required this.description,
      required this.onTap});
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 28),
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Color(0xFFE2D8EB)))),
        child: LayoutBuilder(
            builder: (context, constraints) => columns(
                constraints.maxWidth > 720,
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Eyebrow(relationship),
                  const SizedBox(height: 12),
                  Text(name,
                      style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -.7)),
                ]),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Body(description),
                  const SizedBox(height: 16),
                  TextButton.icon(
                      onPressed: onTap,
                      icon: const Icon(Icons.north_east, size: 16),
                      label: const Text('Ver produto na Google Play')),
                ]))),
      );
}

class CareerEntry extends StatelessWidget {
  final String company, role, dates, description;
  const CareerEntry(
      {super.key,
      required this.company,
      required this.role,
      required this.dates,
      required this.description});
  @override
  Widget build(BuildContext context) =>
      LayoutBuilder(builder: (context, constraints) {
        final date = Text(dates,
            style: const TextStyle(fontSize: 11, height: 1.8, color: muted));
        final details =
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(role,
              style: const TextStyle(
                  fontSize: 19, height: 1.5, fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          Text(company,
              style: const TextStyle(fontSize: 15, height: 1.6, color: accent)),
          const SizedBox(height: 12),
          ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 680),
              child: Body(description)),
        ]);
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 28),
          decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: Color(0xFFE2D8EB)))),
          child: constraints.maxWidth >= 700
              ? Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  SizedBox(width: 190, child: date),
                  const SizedBox(width: 32),
                  Expanded(child: details)
                ])
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [date, const SizedBox(height: 12), details]),
        );
      });
}
