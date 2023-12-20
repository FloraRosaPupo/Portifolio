import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portifolio/shared/constants.dart';

class ContatoPage extends StatefulWidget {
  const ContatoPage({Key? key}) : super(key: key);

  @override
  _ContatoPageState createState() => _ContatoPageState();
}

class _ContatoPageState extends State<ContatoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDinamica(),
      drawer: menuLateralDinamico(),
      body: Stack(
        children: [
          background(context),
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              //height: MediaQuery.of(context).size.height * 0.9,
              // width: MediaQuery.of(context).size.width * 1,
              child: Card(
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      ChatMessage(
                        message: "Olá! Como posso ajudar?",
                        isUser: false,
                      ),
                      SizedBox(height: 10),
                      ChatMessage(
                        message: "Você me encontra aqui:",
                        isUser: false,
                      ),
                      SizedBox(height: 20),
                      ContactInfo(
                        icon: FontAwesomeIcons.github,
                        text: "/FloraRosaPupo",
                        onPressed: () {
                          // Adicione a lógica para abrir o GitHub
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ContactInfo(
                        icon: FontAwesomeIcons.instagram,
                        text: "@florarosapupo",
                        onPressed: () {
                          // Adicione a lógica para abrir o Instagram
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ContactInfo(
                        icon: FontAwesomeIcons.whatsapp,
                        text: "+55 34 99313-0077",
                        onPressed: () {
                          // Adicione a lógica para abrir o WhatsApp
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ContactInfo(
                        icon: FontAwesomeIcons.envelope,
                        text: "florapupo@gmail.com",
                        onPressed: () {
                          // Adicione a lógica para enviar um e-mail
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ContactInfo(
                        icon: FontAwesomeIcons.linkedin,
                        text: '/flora-rosa-b386841b6',
                        onPressed: () {},
                      ),
                      SizedBox(height: 20),
                      // Resposta simulada
                      FutureBuilder(
                        future: Future.delayed(Duration(seconds: 3)),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            // Quando a resposta chegar, mostra a mensagem
                            return ChatMessage(
                              message: "Obrigada! Fico à disposição.",
                              isUser: false,
                            );
                          } else {
                            return Container();
                          }
                        },
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String message;
  final bool isUser;

  const ChatMessage({
    required this.message,
    required this.isUser,
  });

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isUser)
            CircleAvatar(
              backgroundColor: Colors.purple,
              radius: 20,
              child: Icon(
                FontAwesomeIcons.user,
                color: Colors.white,
              ),
            ),
          SizedBox(width: 10),
          Flexible(
            child: Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                color: isUser ? Colors.purple : Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(isUser ? 20 : 0),
                  topRight: Radius.circular(isUser ? 0 : 20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Text(
                message,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: isUser ? Colors.black : Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FadeIn extends StatefulWidget {
  final Widget child;

  const FadeIn({required this.child});

  @override
  _FadeInState createState() => _FadeInState();
}

class _FadeInState extends State<FadeIn> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _opacity = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _opacity,
      builder: (context, child) {
        return Opacity(
          opacity: _opacity.value,
          child: widget.child,
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class ContactInfo extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  const ContactInfo({
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: 310,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 30,
              color: Colors.black,
            ),
            SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Montserrat',
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
