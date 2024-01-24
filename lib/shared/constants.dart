import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portifolio/pages/contato_page.dart';
import 'package:portifolio/pages/experiencia_dart.dart';
import 'package:portifolio/pages/habilidades_page.dart';
import 'package:portifolio/pages/home_page.dart';
import 'package:portifolio/pages/projeto_page.dart';
import 'package:portifolio/pages/sobre_page.dart';

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Color.fromARGB(224, 255, 255, 255),
  primary: Color.fromARGB(255, 111, 2, 109),
  /*minimumSize: Size(100, 50),
  padding: EdgeInsets.symmetric(horizontal: 10),
  */
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(20)),
  ),
  textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
);

appBarDinamica() {
  //TabController _tabController = TabController(length: 3, vsync: this);

  return PreferredSize(
    preferredSize: Size.fromHeight(80.0),
    child: AppBar(
      toolbarHeight: 150,
      centerTitle: true,
      title: Image.asset(
        "assets/images/logo.png",
        fit: BoxFit.fitHeight,
      ),
      backgroundColor: Color.fromARGB(255, 71, 7, 82),
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
              size: 30, // Changing Drawer Icon Size
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        },
      ),
    ),
  );
}

menuLateralDinamico() {
  return Drawer(
    elevation: 20,
    backgroundColor: Color.fromARGB(190, 71, 7, 82),
    child: Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
      child: Column(children: [
        SizedBox(
          height: 50,
        ),
        objetosMenu(Icons.home, 'Painel', HomePage()),
        objetosMenu(Icons.person, 'Sobre', SobrePage()),
        objetosMenu(
            Icons.emoji_objects_rounded, 'Habilidades', HabilidadePage()),
        objetosMenu(Icons.computer, 'Experiências', ExperienciaPage()),
        objetosMenu(Icons.devices_rounded, 'Projetos', ProjetoPage()),
        //objetosMenu(Icons.contact_page, 'Contato', ContatoPage()),
      ]),
    ),
  );
}

objetosMenu(_icon, _label, _route) {
  return Container(
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(width: 2.0, color: Colors.white12),
      ),
    ),
    padding: EdgeInsets.only(left: 7),
    child: Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Builder(builder: (BuildContext context) {
          return ListTile(
            leading: Icon(
              _icon,
              color: Colors.white,
            ),
            title: Text(
              _label,
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => _route));
            },
          );
        }),
      ],
    ),
  );
}

background(context) {
  return Container(
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
  );
}

botaoContato(context, _counter) {
  return Container(
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
          backgroundColor: Color.fromARGB(255, 111, 2, 109),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return ContatoDialog(); // Using the ContatoDialog widget here
              },
            );
          },
          child: Icon(
            FontAwesomeIcons.headset,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}
