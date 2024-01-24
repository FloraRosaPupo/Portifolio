import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portifolio/shared/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjetoPage extends StatelessWidget {
  ProjetoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDinamica(),
      drawer: menuLateralDinamico(),
      body: Stack(
        alignment: Alignment.center,
        children: [
          background(context),
          CarouselSlider(
            options: CarouselOptions(
              height: 500.0,
              enlargeCenterPage: true,
            ),
            items: projetos.map((projeto) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Card(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              projeto.nome,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              projeto.descricao,
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "Data de Desenvolvimento: ${projeto.data}",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      _launchURL(projeto.githubLink);
                                    },
                                    icon: Icon(FontAwesomeIcons.github),
                                    label: Text('GitHub'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class Projeto {
  final String nome;
  final String data;
  final String descricao;
  final String githubLink;

  Projeto({
    required this.nome,
    required this.data,
    required this.descricao,
    required this.githubLink,
  });
}

final List<Projeto> projetos = [
  Projeto(
    nome: "Aplicativo de Buscador de GIF - Flutter",
    data: "Setembro de 2021",
    descricao:
        "Desenvolvimento em Dart, usando a framework Flutter, um aplicativo que realiza a busca e filtro de GIFs utilizando a API da Giphy Developers de maneira eficiente e interativa.",
    githubLink: "https://github.com/FloraRosaPupo/Buscadordegiphy/tree/main",
  ),
  Projeto(
    nome: "Conversor de Moedas - Flutter",
    data: "Setembro de 2021",
    descricao:
        "Aplicativo conversor de moedas, desenvolvido em Dart usando a framework do Flutter, que utiliza a API HG Finance para realizar conversões nos formatos de real, dólar e euro. O usuário insere o valor em real, e a aplicação converte para dólar ou euro.",
    githubLink: "https://github.com/FloraRosaPupo/conversor_de_moedas",
  ),
  Projeto(
    nome: "Jogos da Velha, Adivinhação e Forca - Python",
    data: "Fevereiro de 2023",
    descricao:
        "Estudo de lógica de programação em Python com foco em operadores aritméticos, operadores relacionais e lógicos, estruturas condicionais, estruturas de repetição, matrizes e vetores. Utilizando esses conhecimentos, foram desenvolvidos jogos como o jogo da velha, adivinhação de número aleatório e forca.",
    githubLink: "https://github.com/FloraRosaPupo/Jogos-python",
  ),
  Projeto(
    nome: "Flappy Bird - Python",
    data: "Fevereiro de 2023",
    descricao:
        "Desenvolvi o jogo do Flappy Bird em Python, utilizando a biblioteca Pygame e incorporando estruturas condicionais para a lógica do jogo.",
    githubLink: "https://github.com/FloraRosaPupo/FlappyBird",
  ),
  Projeto(
    nome: "Pac Man - C++",
    data: "Junho de 2023",
    descricao:
        "Desenvolvi um projeto durante a disciplina de Programação Orientada a Objetos, onde apliquei conceitos como Classes, Objetos, Herança, entre outros. O resultado foi a criação de um jogo inspirado no Pacman, utilizando a biblioteca Allegro para a parte gráfica.",
    githubLink: "https://github.com/FloraRosaPupo/PacMan",
  ),
  Projeto(
    nome: "Aplicativo de Cadastro Imobiliário - Flutter",
    data: "Junho de 2023",
    descricao:
        "Durante o período em que estive como estagiária na prefeitura, desenvolvi um aplicativo utilizando Flutter e Dart para a coleta de informações sobre os imóveis da cidade. O aplicativo inclui funcionalidades de login/cadastro, galeria de fotos e carregamento de dados, os quais foram armazenados no Firebase. Além disso, integrei outros dados ao aplicativo usando o Google App Script.",
    githubLink: "https://github.com/FloraRosaPupo/App-cadastro-imobiliario",
  ),
  Projeto(
    nome: "Aplicativo Portfólio - Flutter",
    data: "Janeiro de 2024",
    descricao:
        "Desenvolvi um aplicativo utilizando Dart e a framework Flutter com o propósito de criar um portfólio. O aplicativo inclui páginas sobre mim, experiência profissional e contato. A página de contato foi concebida com o design de um chat, proporcionando redirecionamento para as redes sociais.",
    githubLink: "https://github.com/FloraRosaPupo/Portifolio",
  ),
];
