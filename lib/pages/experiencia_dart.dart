import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portifolio/shared/constants.dart';

class ExperienciaPage extends StatelessWidget {
  const ExperienciaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDinamica(),
      drawer: menuLateralDinamico(),
      body: Stack(
        children: [
          background(context),
          SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        child: Text(
                          'Experiências:',
                          //textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 1,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "InfoAlto - Empresa Júnior  ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Gerente de Projetos (Abr 2021 - Dez 2021)',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'Desenvolvi habilidades essenciais em UX, Engenharia de Requisitos e Gestão de Projetos, adotando práticas ágeis. Minha expertise em WordPress impulsionou entregas bem-sucedidas, refletidas em um histórico notável de projetos com Net Promoter Score (NPS) 10, evidenciando excelência na satisfação do cliente.',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Vice-Presidente (Dez 2021 - Dez 2022)',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'Adquiri habilidades cruciais de liderança, como gestão de equipes, planejamento estratégico e motivação, destacando-me na eficaz gestão de pessoas e na promoção do sucesso organizacional. Essas competências solidificam minha trajetória como líder estratégico e motivador.',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Presidente (Dez 2022 - Dez 2023)',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'Aprimorei competências vitais, focando na satisfação do cliente para fortalecer a imagem da empresa. Além disso, estabeleci parcerias estratégicas para impulsionar o crescimento sustentável. A habilidade na gestão de equipes foi fundamental, garantindo um ambiente colaborativo e eficiente para alcançar objetivos organizacionais de forma integrada.',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    for (int i = 8; i > 0; i--)
                                      ImageContainer(index: i),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Prefeitura Muncipal de Rio Paranaíba",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Estagiária (Mar 2023 - Out 2023)',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'Assumi a liderança individual na concepção e desenvolvimento de um aplicativo destinado à coleta de dados imobiliários. Desde a sua criação, fui responsável por todas as fases do projeto, demonstrando autonomia e expertise em T.I para atender às demandas específicas da iniciativa. Minha atuação abrangeu desde a escolha das tecnologias, como Firebase e Flutter, até a implementação de uma experiência do usuário (UX) otimizada.',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                    ])),
          ),
        ],
      ),
    );
  }
}

class ImageContainer extends StatelessWidget {
  final int index;

  ImageContainer({required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              child: Container(
                height: 600,
                width: 600,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/images/InfoAlto/$index.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        );
      },
      child: Container(
        margin: EdgeInsets.all(5),
        height: 200,
        width: 200,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            'assets/images/InfoAlto/$index.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
