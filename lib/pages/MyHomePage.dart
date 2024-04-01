import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 53, 53, 54),
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Color.fromARGB(255, 53, 53, 54),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Action à effectuer lors de l'appui sur la flèche de retour
          },
          iconSize: 40,
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            //Image.asset(
            //  'assets/oo.png', // Remplacez par votre URL d'image
            //  width: double.infinity,
            //  height: double.infinity,
            //  fit: BoxFit.cover,
            // ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 120),
                  Text(
                    'Passer le test pour évaluer votre situation',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 100),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '  Tous les tests',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: 30),
                  RectangleButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Questionnaire()),
                      );
                      // Ajoutez ici le code que vous souhaitez exécuter lorsque le rectangle est cliqué
                      print('Rectangle 1 cliqué');
                      // Naviguer vers une autre page, par exemple :
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => NextPage()));
                    },
                    text: 'Test de dépression',
                    image: 'assets/depression.png',
                  ),
                  SizedBox(height: 20.0), // Espacement entre les rectangles
                  RectangleButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Questionnaire()),
                      );
                      // Ajoutez ici le code que vous souhaitez exécuter lorsque le rectangle est cliqué
                      print('Rectangle 2 cliqué');
                    },
                    text: 'Test de peur       ',
                    image: 'assets/peur.png',
                  ),
                  SizedBox(height: 20.0), // Espacement entre les rectangles
                  RectangleButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Questionnaire()),
                      );
                      // Ajoutez ici le code que vous souhaitez exécuter lorsque le rectangle est cliqué
                      print('Rectangle 2 cliqué');
                    },
                    text: 'Test de trouble',
                    image: 'assets/trouble.png',
                  ),
                  SizedBox(height: 20.0), // Espacement entre les rectangles
                  RectangleButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Questionnaire()),
                      );
                      // Ajoutez ici le code que vous souhaitez exécuter lorsque le rectangle est cliqué
                      print('Rectangle 2 cliqué');
                    },
                    text: 'Test de irritabilité',
                    image: 'assets/irritabilite.png',
                  ),
                  SizedBox(height: 40.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RectangleButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final String image;

  RectangleButton({required this.onPressed, required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 380.0,
        height: 110.0,
        child: Row(
          children: [
            SizedBox(width: 5.0),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(15.0), // Ajustez le padding du texte selon vos besoins
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
            // Espacement entre l'image et le texte
            SizedBox(width: 35.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              // Ajustez le rayon des coins selon vos besoins
              child: Image.asset(
                image,
                width: 150.0, // ajustez la largeur de l'image selon vos besoins
                height: 100.0, // ajustez la hauteur de l'image selon vos besoins
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 84, 82, 82),
          borderRadius: BorderRadius.circular(13.0),
        ),
      ),
    );
  }
}
