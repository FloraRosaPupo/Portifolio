import 'package:flutter/material.dart';
import 'package:portifolio/shared/constants.dart';

class ExperienciaPage extends StatelessWidget {
  const ExperienciaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDinamica(),
      drawer: menuLateralDinamico(),
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
      ),
    );
  }
}
