import 'package:flutter/material.dart';
import 'package:portifolio/shared/constants.dart';

class HabilidadePage extends StatelessWidget {
  const HabilidadePage({Key? key}) : super(key: key);

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
    );
  }
}

Widget cardHardSoft(String labelText, String textCaracteristicas) {
  return Card(
    //color: Colors.white,
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
                      leading: Icon(Icons.check),
                      title: Text(topic.trim()),
                    ))
                .toList(),
          ),
        ),
      ],
    ),
  );
}
