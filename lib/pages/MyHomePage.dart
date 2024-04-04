import 'package:flutter/material.dart';
import 'package:pcd/question.dart';
 import 'package:pcd/pages/Principal.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> liste1 = ["élément 1", "élément 2"];
  List<String> liste2 = ['1', '2', '3'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
             Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Principal()),
                      );
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
            //  'assets/icons/oo.png', // Remplacez par votre URL d'image
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
                        color:  Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
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
                          color:  Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
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
                        MaterialPageRoute(builder: (context) => Questionnaire(),settings: RouteSettings( arguments: {'liste1': liste1, 'liste2': liste2},)),
                      );
                      // Ajoutez ici le code que vous souhaitez exécuter lorsque le rectangle est cliqué
                      print('Rectangle 1 cliqué');
                      // Naviguer vers une autre page, par exemple :
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => NextPage()));
                    },
                    text: 'Test de dépression',
                    image: 'assets/icons/depression.png',
                  ),
                  SizedBox(height: 20.0), // Espacement entre les rectangles
                  RectangleButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                       MaterialPageRoute(builder: (context) => Questionnaire(),settings: RouteSettings( arguments: {'liste1': liste1, 'liste2': liste2},)),
                      );
                      // Ajoutez ici le code que vous souhaitez exécuter lorsque le rectangle est cliqué
                      print('Rectangle 2 cliqué');
                    },
                    text: 'Test de peur       ',
                    image: 'assets/icons/peur.png',
                  ),
                  SizedBox(height: 20.0), // Espacement entre les rectangles
                  RectangleButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                         MaterialPageRoute(builder: (context) => Questionnaire(),settings: RouteSettings( arguments: {'liste1': liste1, 'liste2': liste2},)),
                      );
                      // Ajoutez ici le code que vous souhaitez exécuter lorsque le rectangle est cliqué
                      print('Rectangle 2 cliqué');
                    },
                    text: 'Test de trouble',
                    image: 'assets/icons/trouble.png',
                  ),
                  SizedBox(height: 20.0), // Espacement entre les rectangles
                  RectangleButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Questionnaire(),settings: RouteSettings( arguments: {'liste1': liste1, 'liste2': liste2},)),
                      );
                      // Ajoutez ici le code que vous souhaitez exécuter lorsque le rectangle est cliqué
                      print('Rectangle 2 cliqué');
                    },
                    text: 'Test de irritabilité',
                    image: 'assets/icons/irritabilite.png',
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
                    color:  Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
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
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(13.0),
        ),
      ),
    );
  }
}
