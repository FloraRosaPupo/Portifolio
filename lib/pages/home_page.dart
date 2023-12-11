//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:portifolio/pages/contato_page.dart';
import 'package:portifolio/pages/experiencia_dart.dart';
import 'package:portifolio/pages/sobre_page.dart';
import '../shared/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _translationController;

  // Cria um controlador de animação para o movimento vertical
  @override
  void initState() {
    super.initState();

    // Cria um controlador de animação para o movimento vertical
    _translationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  void dispose() {
    _translationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 71, 7, 82),
              Colors.black,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            //stops: [],
          ),
        ),
        alignment: Alignment.center,
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Center(
                  child: AnimatedBuilder(
                    animation: _translationController,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0.0, _translationController.value * 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          //height: MediaQuery.of(context).size.height * 0.5,
                          child: Column(
                            children: [
                              Image.asset("assets/images/painel.png"),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: raisedButtonStyle,
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SobrePage()));
                  },
                  child: Text('Sobre'),
                ),
                SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  style: raisedButtonStyle,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ExperienciaPage()));
                  },
                  child: Text('Experiência'),
                ),
                SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  style: raisedButtonStyle,
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ContatoPage()));
                  },
                  child: Text('Contato'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
