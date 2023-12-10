import 'package:flutter/material.dart';
import 'package:portifolio/shared/constants.dart';

class SobrePage extends StatelessWidget {
  const SobrePage({super.key});

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
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: const Card(
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        SizedBox(height: 40),
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
                          ),
                        )
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
