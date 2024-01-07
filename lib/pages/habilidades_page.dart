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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Container(
                      //height: MediaQuery.of(context).size.height * 1,
                      //width: MediaQuery.of(context).size.width * 0.5,
                      child: Card(
                        color: Colors.white,
                        child: Column(children: [
                          Text(
                            'HardSkills',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                              'Experiência no desenvolvimento de aplicativos mobile utilizando Dart e a framework Flutter.\n\nConhecimento em Material Design.\n\nFamiliaridade com a plataforma Firebase.\n\nExperiência na plataforma de desenvolvimento WordPress.\n\nCompetência em técnicas de UX/UI.\n\nProficiência na ferramenta Android Studio.\n\nUtilização da ferramenta de versionamento GitHub.\n\nExperiência em Programação Orientada a Objetos (C++).\n\nHabilidade em lógica de programação.\n\nConhecimento nas linguagens de programação Python e C.\n\nUtilização de plataformas como Miro e Pipefy.\n\nCriação de documentação detalhada para projetos.\n\nComunicação efetiva de projetos e resolução de problemas.')
                        ]),
                      ),
                    )
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
