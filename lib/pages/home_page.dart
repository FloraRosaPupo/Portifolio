import 'dart:async';
import 'package:flutter/material.dart';
import 'package:portifolio/pages/contato_page.dart';
import 'package:portifolio/pages/experiencia_dart.dart';
import 'package:portifolio/pages/habilidades_page.dart';
import 'package:portifolio/pages/projeto_page.dart';
import 'package:portifolio/pages/sobre_page.dart';
import '../shared/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
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
      body: Stack(
        children: [
          background(context),
          Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: botaoPainel(
                          context,
                          SobrePage(),
                          'Sobre',
                        ),
                      ),
                      Expanded(
                        child: botaoPainel(
                          context,
                          HabilidadePage(),
                          'Habilidade',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: botaoPainel(
                          context,
                          ExperienciaPage(),
                          'Experiência',
                        ),
                      ),
                      Expanded(
                        child: botaoPainel(
                          context,
                          ProjetoPage(),
                          'Projetos',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        height: 100,
        width: 100,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              (_counter % 2 == 0) ? 'Entre em contato' : '',
              style: TextStyle(
                  fontSize: 10, color: Colors.white, fontFamily: 'Montserrat'),
            ),
            SizedBox(height: 5),
            FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return ContatoDialog(); // Using the ContatoDialog widget here
                  },
                );
              },
              child: Icon(Icons.chat),
            ),
          ],
        ),
      ),
    );
  }
}

botaoPainel(context, _route, _label) {
  return Card(
    color: Color.fromARGB(255, 148, 0, 211),
    elevation: 5.0,
    child: SizedBox(
      height: 200, // Define a altura fixa do Card
      child: ElevatedButton(
        style: raisedButtonStyle,
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => _route));
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            _label,
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      ),
    ),
  );
}
