import 'package:flutter/material.dart';
import 'package:portifolio/pages/contato_page.dart';
import 'package:portifolio/pages/experiencia_dart.dart';
import 'package:portifolio/pages/home_page.dart';
import 'package:portifolio/pages/sobre_page.dart';

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Color.fromARGB(224, 255, 255, 255),
  primary: Color.fromARGB(255, 148, 0, 211),
  minimumSize: Size(100, 50),
  padding: EdgeInsets.symmetric(horizontal: 20),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(20)),
  ),
  textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
);

appBarDinamica() {
  //TabController _tabController = TabController(length: 3, vsync: this);

  return AppBar(
    toolbarHeight: 150,
    centerTitle: true,
    title: Image.asset("assets/images/logo.png"),
    backgroundColor: Color.fromARGB(255, 71, 7, 82),
    leading: Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
            size: 40, // Changing Drawer Icon Size
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        );
      },
    ),
  );
}

menuLateralDinamico() {
  return Drawer(
    backgroundColor: Color.fromARGB(190, 71, 7, 82),
    child: Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Column(children: [
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 2.0, color: Colors.white12),
            ),
          ),
          padding: EdgeInsets.only(left: 7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 70,
              ),
              Builder(builder: (BuildContext context) {
                return ListTile(
                    leading: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Painel',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => HomePage()));
                    });
              }),
            ],
          ),
        ),
        Container(
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
                      Icons.person,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Sobre',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => SobrePage()));
                    });
              }),
            ],
          ),
        ),
        Container(
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
                      Icons.computer,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Experiência',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ExperienciaPage()));
                    });
              }),
            ],
          ),
        ),
        Container(
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
                      Icons.contact_page,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Contato',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ContatoPage()));
                    });
              }),
            ],
          ),
        )
      ]),
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
