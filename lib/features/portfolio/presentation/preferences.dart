import 'package:flutter/material.dart';
import '../data/translations.dart';

class PortfolioPreferences extends InheritedWidget {
  final String language;
  final ThemeMode themeMode;
  final ValueChanged<String> onLanguageChanged;
  final ValueChanged<ThemeMode> onThemeChanged;
  const PortfolioPreferences({
    super.key,
    required this.language,
    required this.themeMode,
    required this.onLanguageChanged,
    required this.onThemeChanged,
    required super.child,
  });
  static PortfolioPreferences? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<PortfolioPreferences>();
  @override
  bool updateShouldNotify(PortfolioPreferences oldWidget) =>
      language != oldWidget.language || themeMode != oldWidget.themeMode;
}

String tr(BuildContext context, String value) =>
    translate(value, PortfolioPreferences.of(context)?.language ?? 'pt');

/// Keeps editorial source copy in Portuguese and localizes at render time.
class PortfolioText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  const PortfolioText(this.data, {super.key, this.style});
  @override
  Widget build(BuildContext context) => Text(tr(context, data), style: style);
}

class PortfolioPalette {
  final bool dark;
  const PortfolioPalette(this.dark);
  Color get ink => dark ? const Color(0xFFF3EDF8) : const Color(0xFF2E2239);
  Color get muted => dark ? const Color(0xFFC8BBD2) : const Color(0xFF6C5B77);
  Color get paper => dark ? const Color(0xFF19131F) : const Color(0xFFFAF7FC);
  Color get surface => dark ? const Color(0xFF211A29) : Colors.white;
  Color get soft => dark ? const Color(0xFF2B2135) : const Color(0xFFF1EBF7);
  Color get accent => dark ? const Color(0xFFD4AEFC) : const Color(0xFF623398);
}

PortfolioPalette palette(BuildContext context) =>
    PortfolioPalette(Theme.of(context).brightness == Brightness.dark);

class PreferenceControls extends StatelessWidget {
  const PreferenceControls({super.key});
  @override
  Widget build(BuildContext context) {
    final preferences = PortfolioPreferences.of(context);
    final language = preferences?.language ?? 'pt';
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        PopupMenuButton<String>(
          tooltip: tr(context, 'Idioma'),
          initialValue: language,
          onSelected: preferences?.onLanguageChanged,
          itemBuilder: (_) => const [
            PopupMenuItem(
                value: 'pt', child: LanguageLabel('pt', 'PT · Português')),
            PopupMenuItem(
                value: 'en', child: LanguageLabel('en', 'EN · English')),
            PopupMenuItem(
                value: 'es', child: LanguageLabel('es', 'ES · Español')),
          ],
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Semantics(
              label: tr(context, 'Idioma'),
              button: true,
              child: LanguageLabel(language, language.toUpperCase()),
            ),
          ),
        ),
        IconButton(
          tooltip: tr(context, dark ? 'Tema claro' : 'Tema escuro'),
          onPressed: preferences == null
              ? null
              : () => preferences.onThemeChanged(
                    dark ? ThemeMode.light : ThemeMode.dark,
                  ),
          icon: Icon(
            dark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
            size: 20,
          ),
        ),
      ],
    );
  }
}

/// Small vector flags avoid missing emoji glyphs on desktop platforms.
class LanguageLabel extends StatelessWidget {
  final String language, label;
  const LanguageLabel(this.language, this.label, {super.key});
  @override
  Widget build(BuildContext context) =>
      Row(mainAxisSize: MainAxisSize.min, children: [
        ExcludeSemantics(
            child: CustomPaint(
                size: const Size(20, 14), painter: _FlagPainter(language))),
        const SizedBox(width: 6),
        Text(label),
      ]);
}

class _FlagPainter extends CustomPainter {
  final String language;
  const _FlagPainter(this.language);
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width, h = size.height;
    void rect(double x, double y, double width, double height, Color color) =>
        canvas.drawRect(
            Rect.fromLTWH(x, y, width, height), Paint()..color = color);
    if (language == 'pt') {
      rect(0, 0, w, h, const Color(0xFF009B3A));
      final diamond = Path()
        ..moveTo(w / 2, h * .08)
        ..lineTo(w * .92, h / 2)
        ..lineTo(w / 2, h * .92)
        ..lineTo(w * .08, h / 2)
        ..close();
      canvas.drawPath(diamond, Paint()..color = const Color(0xFFFFDF00));
      canvas.drawCircle(Offset(w / 2, h / 2), h * .26,
          Paint()..color = const Color(0xFF002776));
      canvas.save();
      canvas.clipPath(Path()
        ..addOval(
            Rect.fromCircle(center: Offset(w / 2, h / 2), radius: h * .26)));
      final band = Path()
        ..moveTo(w * .3, h * .43)
        ..quadraticBezierTo(w * .55, h * .32, w * .7, h * .57);
      canvas.drawPath(
          band,
          Paint()
            ..color = Colors.white
            ..style = PaintingStyle.stroke
            ..strokeWidth = .8);
      canvas.restore();
    } else if (language == 'en') {
      rect(0, 0, w, h, Colors.white);
      for (var row = 0; row < 13; row += 2) {
        rect(0, h * row / 13, w, h / 13, const Color(0xFFB22234));
      }
      rect(0, 0, w * .42, h * 7 / 13, const Color(0xFF3C3B6E));
      for (var row = 0; row < 9; row++) {
        final count = row.isEven ? 6 : 5;
        for (var col = 0; col < count; col++) {
          canvas.drawCircle(
              Offset(w * .42 * (col + (row.isEven ? .5 : 1)) / 6,
                  h * 7 / 13 * (row + .5) / 9),
              .28,
              Paint()..color = Colors.white);
        }
      }
    } else {
      // Spain's civil flag: red / yellow / red, in 1:2:1 proportions.
      rect(0, 0, w, h, const Color(0xFFAA151B));
      rect(0, h / 4, w, h / 2, const Color(0xFFF1BF00));
    }
  }

  @override
  bool shouldRepaint(covariant _FlagPainter oldDelegate) =>
      oldDelegate.language != language;
}
