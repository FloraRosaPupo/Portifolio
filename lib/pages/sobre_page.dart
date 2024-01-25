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
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //SizedBox(height: 10),
                    Container(
                      //height: MediaQuery.of(context).size.height * 0.75,
                      //width: MediaQuery.of(context).size.width * 0.9,
                      child: Card(
                        color: Colors.transparent,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 50),
                            const CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 70,
                              backgroundImage:
                                  AssetImage('assets/images/perfil.png'),
                            ),
                            SizedBox(height: 20),
                            const Text(
                              'Sobre Mim',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30.0),
                              child: Text(
                                ' Sou Flora Rosa Pupo, graduanda em Sistemas de Informação na Universidade Federal de Viçosa (UFV) com especialização em Desenvolvimento Mobile, notadamente no front-end. Tenho uma paixão por tecnologia, inovação e liderança, aspirando construir uma trajetória sólida em uma empresa, ocupando eventualmente uma posição de destaque.\n Ao longo da minha formação, destaco características essenciais como organização e comunicação. Esses atributos são alicerces para a construção de processos eficientes e entregas de qualidade, contribuindo para o sucesso da equipe e da empresa como um todo.\n Minha jornada acadêmica teve início em 2020, no curso de Sistema de Informação. Na empresa júnior, fui participante ativa, envolvendo-me em projetos relevantes, incluindo iniciativas sociais, como o combate à violência doméstica. Durante essa experiência, tive a oportunidade de representar o projeto na Assembleia Estadual de Minas Gerais, um momento marcante em minha trajetória.\n Além disso, destaco minha participação no Movimento Empresa Júnior (MEJ), onde acumulei experiência em gestão de projetos, engenharia de requisitos e liderança de equipes. Minha busca constante por aprimoramento técnico e interpessoal é evidenciada por minha comunicação eficaz, organização meticulosa e dedicação.\n Estou em busca de oportunidades e conexões profissionais que enriqueçam minha trajetória no campo da tecnologia. Meu objetivo é contribuir para projetos inovadores e impactantes, aplicando os conhecimentos adquiridos ao longo da minha jornada acadêmica e profissional.',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            const SizedBox(
                              height: 50,
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
        ],
      ),
    );
  }
}
