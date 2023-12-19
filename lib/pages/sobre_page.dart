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
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //SizedBox(height: 10),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.75,
                      //width: MediaQuery.of(context).size.width * 0.9,
                      child: Card(
                        color: Colors.transparent,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 10),
                            const CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 100,
                              backgroundImage:
                                  AssetImage('assets/images/perfil.png'),
                            ),
                            SizedBox(height: 10),
                            const Text(
                              'Sobre Mim',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30.0),
                              child: Text(
                                'Olá, meu nome é Flora Rosa Pupo tenho 22 anos,\nSou graduanda em Sistemas de Informação pela Universidade Federal de Viçosa (UFV), com interesse na área do Desenvolvimento Mobile, sobretudo o front-end. Ao longo da minha trajetória, adquiri experiência em gestão de projetos, engenharia de requisitos, liderança de equipes, desenvolvimento de projetos, experiência do usuário e parcerias estratégicas, graças à minha ativa participação no Movimento Empresa Júnior (MEJ).\nDestaco-me por ser uma pessoa comunicativa, organizada e dedicada. Estou constantemente em busca de aprimoramento, tanto nas minhas habilidades técnicas quanto interpessoais, com o objetivo de contribuir de maneira significativa para projetos inovadores e impactantes. Estou aberta a oportunidades e conexões profissionais que possam enriquecer minha trajetória no campo da tecnologia.',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    FontAwesomeIcons.instagram,
                                    size: 40,
                                  ),
                                  color: Colors.white,
                                  onPressed: () => abrirInstagram(),
                                ),
                                const SizedBox(width: 5),
                                IconButton(
                                  icon: const Icon(
                                    FontAwesomeIcons.linkedin,
                                    size: 40,
                                  ),
                                  color: Colors.white,
                                  onPressed: () => abrirLinkedin(),
                                ),
                                const SizedBox(width: 5),
                                IconButton(
                                  icon: const Icon(
                                    FontAwesomeIcons.whatsapp,
                                    size: 40,
                                  ),
                                  color: Colors.white,
                                  onPressed: () => abrirWhatsApp(),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -20,
            right: -70,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.5,
              child: Image.asset(
                'assets/images/sobre.png',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void abrirInstagram() async {
  const url = 'https://www.instagram.com/florarosapupo/';
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}

void abrirWhatsApp() async {
  var whatsappUrl = "whatsapp://send?phone=5586994324465&text=Olá,tudo bem ?";

  if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
    await launchUrl(Uri.parse(whatsappUrl));
  } else {
    throw 'Could not launch $whatsappUrl';
  }
}

void abrirLinkedin() async {
  const url = 'https://www.linkedin.com/in/flora-rosa-b386841b6/';
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}
