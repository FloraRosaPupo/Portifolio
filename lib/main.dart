import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'features/portfolio/presentation/portfolio_page.dart';
import 'features/portfolio/presentation/preferences.dart';
import 'features/portfolio/presentation/preference_storage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late String language;
  late ThemeMode themeMode;
  @override
  void initState() {
    super.initState();
    final storedLanguage = readPreference('language');
    language =
        ['pt', 'en', 'es'].contains(storedLanguage) ? storedLanguage! : 'pt';
    updateDocumentLanguage(language);
    themeMode = switch (readPreference('theme')) {
      'dark' => ThemeMode.dark,
      'light' => ThemeMode.light,
      _ => ThemeMode.system,
    };
  }

  ThemeData makeTheme(Brightness brightness) {
    final colors = PortfolioPalette(brightness == Brightness.dark);
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Montserrat',
      brightness: brightness,
      scaffoldBackgroundColor: colors.paper,
      colorScheme: ColorScheme.fromSeed(
        seedColor: accent,
        brightness: brightness,
        surface: colors.surface,
      ),
      textTheme:
          (brightness == Brightness.dark ? ThemeData.dark() : ThemeData.light())
              .textTheme
              .apply(
                fontFamily: 'Montserrat',
                bodyColor: colors.ink,
                displayColor: colors.ink,
              ),
    );
  }

  @override
  Widget build(BuildContext context) => PortfolioPreferences(
        language: language,
        themeMode: themeMode,
        onLanguageChanged: (value) {
          setState(() => language = value);
          writePreference('language', value);
          updateDocumentLanguage(value);
        },
        onThemeChanged: (value) {
          setState(() => themeMode = value);
          writePreference('theme', value.name);
          updateDocumentTheme(value.name);
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flora Rosa Pupo • Full Stack',
          locale: Locale(language),
          supportedLocales: const [Locale('pt'), Locale('en'), Locale('es')],
          localizationsDelegates: GlobalMaterialLocalizations.delegates,
          theme: makeTheme(Brightness.light),
          darkTheme: makeTheme(Brightness.dark),
          themeMode: themeMode,
          home: const PortfolioPage(),
        ),
      );
}
