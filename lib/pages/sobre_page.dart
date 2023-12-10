import 'package:flutter/material.dart';
import 'package:portifolio/shared/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SobrePage extends StatefulWidget {
  const SobrePage({super.key});

  @override
  State<SobrePage> createState() => _SobrePageState();
}

class _SobrePageState extends State<SobrePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDinamica(),
      drawer: menuLateralDinamico(),
      body: Stack(
        children: [
          background(context),
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.75,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: const Card(
                    color: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 50),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 100,
                          backgroundImage: NetworkImage(
                              'https://media.licdn.com/dms/image/D4D03AQFJvFhazyMh7A/profile-displayphoto-shrink_800_800/0/1689782742132?e=1707955200&v=beta&t=_fIARIacgkwu6-ZXY0q39bsngnzZ3Vf-2BJegRZB1o8'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Flora Rosa Pupo',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Montserrat'),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            '    Sou graduanda em Sistemas de Informação pela Universidade Federal de Viçosa (UFV), com interesse na área do Desenvolvimento Mobile, sobretudo o front-end. Ao longo da minha trajetória, adquiri experiência em gestão de projetos, engenharia de requisitos, liderança de equipes, desenvolvimento de projetos, experiência do usuário e parcerias estratégicas, graças à minha ativa participação no Movimento Empresa Júnior (MEJ).\n    Destaco-me por ser uma pessoa comunicativa, organizada e dedicada. Estou constantemente em busca de aprimoramento, tanto nas minhas habilidades técnicas quanto interpessoais, com o objetivo de contribuir de maneira significativa para projetos inovadores e impactantes. Estou aberta a oportunidades e conexões profissionais que possam enriquecer minha trajetória no campo da tecnologia.',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.instagram,
                              size: 40,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              FontAwesomeIcons.linkedin,
                              size: 40,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              FontAwesomeIcons.whatsapp,
                              size: 40,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
