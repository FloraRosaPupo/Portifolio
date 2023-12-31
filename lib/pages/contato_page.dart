import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContatoDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: Colors.transparent,
      child: Container(
        width: 500,
        height: 600, // Adjust the height as needed
        child: Card(
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
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
                    launch('https://github.com/FloraRosaPupo');
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                ContactInfo(
                  icon: FontAwesomeIcons.instagram,
                  text: "@florarosapupo",
                  onPressed: () {
                    launch('https://www.instagram.com/florarosapupo/');
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                ContactInfo(
                  icon: FontAwesomeIcons.envelope,
                  text: "florapupo@gmail.com",
                  onPressed: () {
                    launch('mailto:florapupo@gmail.com');
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                ContactInfo(
                  icon: FontAwesomeIcons.linkedin,
                  text: '/flora-rosa-b386841b6',
                  onPressed: () {
                    launch('https://www.linkedin.com/in/flora-rosa-b386841b6/');
                  },
                ),
                SizedBox(height: 20),
                // Resposta simulada
                FutureBuilder(
                  future: Future.delayed(Duration(seconds: 3)),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
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
              ],
            ),
          ),
        ),
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
                  fontSize: 15,
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
              size: 20,
              color: Colors.black,
            ),
            SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(
                fontSize: 15,
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
