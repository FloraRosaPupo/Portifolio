import 'package:flutter/material.dart';
import 'package:portifolio/pages/sobre_page.dart';
import 'home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController _translationController;

  @override
  void initState() {
    super.initState();

    // Cria um controlador de animação para o movimento vertical
    _translationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);

    Future.delayed(Duration(seconds: 10)).then(
      (value) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => HomePage(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _translationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 71, 7, 82),
              Colors.black,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: AnimatedBuilder(
            animation: _translationController,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0.0, _translationController.value * 10),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Column(
                    children: [
                      Image.asset("assets/images/fundo.png"),
                      Text(
                        "Bem-vindo(a) ao meu Portfólio",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.00,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
