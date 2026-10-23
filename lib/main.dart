import 'package:flutter/material.dart';
import 'features/portfolio/presentation/portfolio_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flora Rosa Pupo • Desenvolvimento Full Stack',
        theme: ThemeData(
            useMaterial3: true,
            fontFamily: 'Montserrat',
            scaffoldBackgroundColor: paper,
            colorScheme:
                ColorScheme.fromSeed(seedColor: accent, surface: paper),
            textTheme: ThemeData.light().textTheme.apply(
                fontFamily: 'Montserrat', bodyColor: ink, displayColor: ink)),
        home: const PortfolioPage(),
      );
}
