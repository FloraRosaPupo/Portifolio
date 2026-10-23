import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/content.dart';

const ink = Color(0xFF202D29);
const green = Color(0xFF214D43);
const muted = Color(0xFF5E6D65);
const paper = Color(0xFFF7F6F2);
const lime = Color(0xFFD9EDAA);

class PortfolioPage extends StatefulWidget {
  final Future<bool> Function(Uri)? openLink;
  const PortfolioPage({super.key, this.openLink});
  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final sections = List.generate(4, (_) => GlobalKey());
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
          duration: const Duration(milliseconds: 500),
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
                  backgroundColor: green,
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
                  border: Border(bottom: BorderSide(color: Color(0xFFDBDFD8)))),
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
                            (2, 'Sobre'),
                            (3, 'Contato')
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
                                      (2, 'Sobre'),
                                      (3, 'Contato')
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
                                const Eyebrow(
                                    'FLORA ROSA PUPO / DESENVOLVEDORA'),
                                const SizedBox(height: 28),
                                Text('Da ideia à\nexperiência.',
                                    style: TextStyle(
                                        fontSize: wide ? 72 : 46,
                                        height: 1.08,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: -2.8)),
                                const SizedBox(height: 28),
                                const Text('Desenvolvimento Full Stack',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600,
                                        color: green)),
                                const SizedBox(height: 12),
                                const Text(
                                    'Flutter & Dart · Node.js · SQL & PostgreSQL · UX/UI',
                                    style: TextStyle(
                                        fontSize: 15,
                                        height: 1.7,
                                        color: muted)),
                                const SizedBox(height: 24),
                                const Text(
                                    'Construo aplicações que conectam boas interfaces, regras de negócio e dados. Do mobile ao backend, com atenção à experiência de quem usa.',
                                    style:
                                        TextStyle(fontSize: 18, height: 1.7)),
                                const SizedBox(height: 32),
                                Wrap(spacing: 12, runSpacing: 12, children: [
                                  button('Conheça os projetos ↗', () => go(0),
                                      filled: true),
                                  button('Vamos conversar', () => go(3))
                                ]),
                              ]),
                          Container(
                              padding: const EdgeInsets.all(32),
                              decoration: BoxDecoration(
                                  color: green,
                                  borderRadius: BorderRadius.circular(28)),
                              child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(children: [
                                      Icon(Icons.code, color: lime, size: 30),
                                      Spacer(),
                                      Flexible(
                                          child: Text('DESIGN + CÓDIGO',
                                              style: TextStyle(
                                                  color: lime,
                                                  fontSize: 11,
                                                  letterSpacing: 2)))
                                    ]),
                                    SizedBox(height: 44),
                                    Text(
                                        'Interfaces claras.\nConexões sólidas.\nProdutos úteis.',
                                        style: TextStyle(
                                            fontSize: 32,
                                            height: 1.3,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: -1)),
                                    SizedBox(height: 40),
                                    Divider(color: Color(0xFF5E8276)),
                                    SizedBox(height: 20),
                                    Text('MOBILE / BACKEND / DADOS',
                                        style: TextStyle(
                                            color: lime,
                                            fontSize: 11,
                                            letterSpacing: 1.4)),
                                    SizedBox(height: 14),
                                    Text(
                                        'Formada em Sistemas de Informação pela UFV. Pós-graduanda em Inteligência Artificial Aplicada aos Negócios.',
                                        style: TextStyle(
                                            color: Colors.white,
                                            height: 1.8,
                                            fontSize: 15)),
                                  ])),
                        )),
                        section(
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Eyebrow('01 / PROJETOS'),
                                  const Heading('Código que ganha forma.'),
                                  const Body(
                                      'Projetos pessoais para explorar ideias, aperfeiçoar a arquitetura e transformar aprendizado em aplicações.'),
                                  const SizedBox(height: 36),
                                  columns(
                                    wide,
                                    ProjectCard(
                                        title: 'Avalia',
                                        category: 'EDUCAÇÃO / FLUTTER',
                                        image: 'assets/projects/avalia.png',
                                        description:
                                            'Turmas, alunos e provas em um só lugar. Uma aplicação para organizar a rotina de professores e acompanhar submissões.',
                                        tags: const [
                                          'Flutter',
                                          'Cubit',
                                          'Supabase'
                                        ],
                                        onTap: () =>
                                            open('$github/projeto_Avalia'),
                                        background: const Color(0xFFDCECF0)),
                                    ProjectCard(
                                        title: 'Bebeu?',
                                        category: 'BEM-ESTAR / FULL STACK',
                                        image: 'assets/projects/bebeu.png',
                                        description:
                                            'Um incentivo ao cuidado diário. Registro de consumo de água, metas de hidratação, histórico e lembretes.',
                                        tags: const [
                                          'Flutter',
                                          'Node.js',
                                          'PostgreSQL'
                                        ],
                                        onTap: () =>
                                            open('$github/controle_agua'),
                                        background: const Color(0xFFE4EBD8)),
                                  ),
                                  const SizedBox(height: 40),
                                  button('Mais projetos no GitHub ↗',
                                      () => open(github)),
                                  const SizedBox(height: 64),
                                  const Eyebrow('APLICATIVOS PUBLICADOS'),
                                  const SizedBox(height: 16),
                                  const Body(
                                      'Conheça também os aplicativos na Google Play.'),
                                  const SizedBox(height: 24),
                                  Wrap(spacing: 16, runSpacing: 16, children: [
                                    StoreLink(
                                        'Easy Comlink',
                                        Icons.shopping_bag_outlined,
                                        () => open(
                                            'https://play.google.com/store/apps/details?id=com.mycompany.easycomlink&hl=pt_BR')),
                                    StoreLink(
                                        'IndicaZ Profissionais',
                                        Icons.handshake_outlined,
                                        () => open(
                                            'https://play.google.com/store/apps/details?id=com.mycompany.indicazprofissionais&hl=pt_BR')),
                                    StoreLink(
                                        'Roteo',
                                        Icons.route_outlined,
                                        () => open(
                                            'https://play.google.com/store/apps/details?id=com.roteoapp.aa&hl=pt_BR')),
                                  ]),
                                ]),
                            key: sections[0],
                            color: Colors.white),
                        section(
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Eyebrow('02 / TRAJETÓRIA'),
                                  const Heading('Construção contínua.'),
                                  const Body(
                                      'Experiência em desenvolvimento, integração de sistemas e liderança de equipes.'),
                                  const SizedBox(height: 40),
                                  for (final entry in career)
                                    Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 28),
                                        decoration: const BoxDecoration(
                                            border: Border(
                                                top: BorderSide(
                                                    color: Color(0xFFD9DDD5)))),
                                        child: columns(
                                            wide,
                                            Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(entry.$3,
                                                      style: const TextStyle(
                                                          fontSize: 11,
                                                          color: muted,
                                                          letterSpacing: 1)),
                                                  const SizedBox(height: 12),
                                                  Text(entry.$1,
                                                      style: const TextStyle(
                                                          fontSize: 25,
                                                          fontWeight:
                                                              FontWeight.w600))
                                                ]),
                                            Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(entry.$2,
                                                      style: const TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                  const SizedBox(height: 12),
                                                  Body(entry.$4)
                                                ]))),
                                ]),
                            key: sections[1]),
                        section(
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Eyebrow('03 / SOBRE & FORMAÇÃO'),
                                  const Heading(
                                      'Curiosidade como ponto de partida.'),
                                  columns(
                                      wide,
                                      const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Body(
                                                'Sou Flora, desenvolvedora com experiência em Flutter/Dart e Node.js. Gosto de entender o problema antes de escrever código e de acompanhar a solução da interface às integrações e aos dados.'),
                                            SizedBox(height: 20),
                                            Body(
                                                'Minha trajetória também passa pela liderança na InfoAlto. Levo dessa experiência o cuidado com as pessoas, a colaboração e a clareza na comunicação. Hoje aprofundo meus estudos em inteligência artificial e amplio meus conhecimentos em React.js e React Native.'),
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
                            key: sections[2],
                            color: const Color(0xFFEDF0E7)),
                        section(
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('04 / CONTATO',
                                      style: TextStyle(
                                          color: lime,
                                          letterSpacing: 2,
                                          fontSize: 12)),
                                  const SizedBox(height: 24),
                                  Text(
                                      'Vamos construir\nalgo que faça sentido?',
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
                                      ('E-mail ↗', email),
                                      ('LinkedIn ↗', linkedin),
                                      ('GitHub ↗', github)
                                    ])
                                      OutlinedButton(
                                          onPressed: () => open(link.$2),
                                          style: OutlinedButton.styleFrom(
                                              foregroundColor: Colors.white,
                                              side: const BorderSide(
                                                  color: Color(0xFF8EA99B)),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 24,
                                                      vertical: 20)),
                                          child: Text(link.$1))
                                  ]),
                                  const SizedBox(height: 64),
                                  const Divider(color: Color(0xFF5E8276)),
                                  const SizedBox(height: 24),
                                  const Text(
                                      'Flora Rosa Pupo · Desenvolvido com Flutter',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12)),
                                ]),
                            key: sections[3],
                            color: green),
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
          letterSpacing: 2,
          color: green,
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
                  fontSize: 36,
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
          border: Border.all(color: const Color(0xFFD0D7CD)),
          borderRadius: BorderRadius.circular(30)),
      child: Text(text, style: const TextStyle(fontSize: 12, color: ink)));
}

class Education extends StatelessWidget {
  final String school, course, dates;
  const Education(this.school, this.course, this.dates, {super.key});
  @override
  Widget build(BuildContext context) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(school,
            style: const TextStyle(
                color: green, fontWeight: FontWeight.w700, fontSize: 16)),
        const SizedBox(height: 8),
        Text(course,
            style: const TextStyle(
                fontSize: 21, height: 1.4, fontWeight: FontWeight.w500)),
        const SizedBox(height: 12),
        Text(dates,
            style: const TextStyle(color: muted, fontSize: 12, height: 1.8))
      ]);
}

class StoreLink extends StatelessWidget {
  final String name;
  final IconData icon;
  final VoidCallback onTap;
  const StoreLink(this.name, this.icon, this.onTap, {super.key});
  @override
  Widget build(BuildContext context) => OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(22), foregroundColor: green),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Icon(icon),
        const SizedBox(width: 12),
        Flexible(child: Text(name)),
        const SizedBox(width: 12),
        const Icon(Icons.north_east, size: 16)
      ]));
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
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
            decoration: BoxDecoration(
                color: background, borderRadius: BorderRadius.circular(20)),
            child: ClipRect(
                child: Align(
                    alignment: Alignment.topCenter,
                    heightFactor: .85,
                    child: Container(
                        constraints: const BoxConstraints(maxWidth: 260),
                        decoration: BoxDecoration(
                            border: Border.all(color: ink, width: 7),
                            borderRadius: BorderRadius.circular(30)),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(23),
                            child: Image.asset(image,
                                fit: BoxFit.contain,
                                semanticLabel:
                                    'Tela do aplicativo $title executada localmente')))))),
        const SizedBox(height: 24),
        Eyebrow(category),
        const SizedBox(height: 12),
        Text(title,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600)),
        const SizedBox(height: 12),
        Body(description),
        const SizedBox(height: 20),
        Wrap(spacing: 8, runSpacing: 8, children: tags.map(Tag.new).toList()),
        const SizedBox(height: 18),
        TextButton(onPressed: onTap, child: const Text('Explorar projeto ↗')),
      ]);
}
