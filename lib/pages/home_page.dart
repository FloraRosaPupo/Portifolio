//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:portifolio/pages/contato_page.dart';
import 'package:portifolio/pages/experiencia_dart.dart';
import 'package:portifolio/pages/sobre_page.dart';
import '../shared/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
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
        alignment: Alignment.center,
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ElevatedButton(
                  style: raisedButtonStyle,
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SobrePage()));
                  },
                  child: Text('Sobre'),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: raisedButtonStyle,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ExperienciaPage()));
                  },
                  child: Text('Experiência'),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: raisedButtonStyle,
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ContatoPage()));
                  },
                  child: Text('Contato'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
