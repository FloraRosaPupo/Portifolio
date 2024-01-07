import 'package:flutter/material.dart';
import 'package:portifolio/shared/constants.dart';

class habilidadePage extends StatelessWidget {
  const habilidadePage({super.key});

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
                  child: Card(),
                ),
              ),
            )
          ],
        ));
  }
}
