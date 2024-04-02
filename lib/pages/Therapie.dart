import 'package:flutter/material.dart';
import 'package:pcd/therapies/therapist.dart';
import 'package:pcd/therapies/alimentation.dart';
import 'package:pcd/therapies/sommeil.dart';
import 'package:pcd/therapies/relaxation.dart';
import 'package:pcd/therapies/chatbott.dart';

class Therapie extends StatefulWidget {
  const Therapie({super.key});

  @override
  State<Therapie> createState() => _HomeState();
}

class _HomeState extends State<Therapie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          ClickableContainer(
            onTap: () {
              // Navigate to another page when the container is clicked
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BOT()),
              );
            },
            child: Container(
              width: 350,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Color.fromRGBO(187, 66, 191, 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 40,
                  ),
                  Text(
                    'Parler avec un chatbot ',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Image(
                    image: AssetImage('assets/icons/chatbot.png'),
                    alignment: Alignment.centerRight,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.only(
                left: 20,
              ),
              child: Text(
                'Recommendations:',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20), // Align the text to the left
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  ClickableContainer(
                    //le premier
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Therapiste()),
                      );
                    },
                    child: Container(
                      height: 300,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Color.fromRGBO(187, 66, 191, 1),
                      ),
                      child: Column(children: [
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          ' Parler avec un specialiste',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Image(
                          image: AssetImage('assets/icons/therapy.png'),
                          alignment: Alignment.centerRight,
                        ),
                      ]),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ClickableContainer(
                    //le second
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => exercice()),
                      );
                    },
                    child: Container(
                      height: 300,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Color.fromRGBO(187, 66, 191, 1),
                      ),
                      child: Column(children: [
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          ' Exercices de relaxation et de respiration',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Image(
                          image: AssetImage('assets/icons/Yoga.png'),
                          alignment: Alignment.centerRight,
                        ),
                      ]),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ClickableContainer(
                    //le troisieme
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => alimentation()),
                      );
                    },
                    child: Container(
                      height: 300,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Color.fromRGBO(187, 66, 191, 1),
                      ),
                      child: Column(children: [
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          " Suivi de l'alimentation et du mode de vie",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Image(
                          image: AssetImage('assets/icons/healthy.png'),
                          alignment: Alignment.centerRight,
                        ),
                      ]),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ClickableContainer(
                    //le quatrieme
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => sommeil()),
                      );
                    },
                    child: Container(
                      height: 300,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Color.fromRGBO(187, 66, 191, 1),
                      ),
                      child: Column(children: [
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          ' Gestion du sommeil et relaxation',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Image(
                          image: AssetImage('assets/icons/sommeil.png'),
                          alignment: Alignment.centerRight,
                        ),
                      ]),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}

class clickablebox extends StatelessWidget {
  final VoidCallback onTap;
  clickablebox({required this.onTap, required Row child});
  @override
  Widget build(BuildContext context) {
    return ClickableContainer(
      onTap: onTap,
      child: Container(
        height: 300,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Color.fromRGBO(24, 139, 196, 1),
        ),
      ),
    );
  }
}

class ClickableContainer extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;

  ClickableContainer({required this.onTap, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: child,
    );
  }
}
