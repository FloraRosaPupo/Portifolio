import 'package:flutter/material.dart';
import 'package:portifolio/pages/sobre_page.dart';
import 'package:portifolio/shared/constants.dart';
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

    Future.delayed(Duration(seconds: 5)).then(
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
      //backgroundColor: Colors.white,
      body: Stack(
        children: [
          background(context),
          Center(
            child: AnimatedBuilder(
              animation: _translationController,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0.0, _translationController.value * 10),
                  child: Container(
                    width: 500,
                    height: 600,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        children: [
                          // Utilize o BoxFit.cover para garantir que a imagem cubra o contêiner sem perder a proporção
                          Image.asset(
                            "assets/images/fundo.png",
                            fit: BoxFit.cover,
                          ),
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
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
