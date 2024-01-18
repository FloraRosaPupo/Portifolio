import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portifolio/shared/constants.dart';

class HabilidadePage extends StatefulWidget {
  const HabilidadePage({super.key});

  @override
  State<HabilidadePage> createState() => _HabilidadePageState();
}

class _HabilidadePageState extends State<HabilidadePage> with TickerProviderStateMixin {
  late AnimationController _translationController;
  late Timer _timer;
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _translationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);

    // Inicializa o timer para atualizar o texto a cada 15 segundos
    _timer = Timer.periodic(Duration(seconds: 10), (timer) {
      setState(() {
        _counter++;
      });
    });
  }

  @override
  void dispose() {
    _translationController.dispose();
    _timer.cancel(); // Cancela o timer ao sair da tela
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDinamica(),
      drawer: menuLateralDinamico(),
      body: Stack(
        children: [
          background(context),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    cardHardSoft(
                      'Hard Skills',
                      'Dart e Flutter, Material Design, Firebase, WordPress, UX/UI, Android Studio, GitHub, POO (C++), Lógica de Programação, Python e C, Miro e Pipefy',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    cardHardSoft(
                      'Soft Skills',
                      'Comunicação eficaz e cooperativa, Resolução de problemas, Aprendizado rápido, Organização, Lideraça',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: botaoContato(context, _counter),
    );
  }
}

Widget cardHardSoft(String labelText, String textCaracteristicas) {
  return Card(
    color: Colors.transparent,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 111, 2, 109),
              borderRadius: BorderRadius.only(
                //topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                //bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              )),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              labelText,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: textCaracteristicas
                .split(', ')
                .map((topic) => ListTile(
                      leading: Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                      title: Text(
                        topic.trim(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ))
                .toList(),
          ),
        ),
      ],
    ),
  );
}
