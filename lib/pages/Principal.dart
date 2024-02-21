import 'package:flutter/material.dart';
import 'package:pcd/Widgets/custom_container.dart';

class Principal extends StatefulWidget {
  const Principal({Key? key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  void onContainerClicked() {
    // Ajoutez votre logique ou action ici
    print("Container cliqué !");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Text(
            "Découvrir le fonctionnement de l'application !",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Nous utilisons une méthode efficace pour surmonter les problèmes psychologiques. Mais elle nécessite de la compréhension. Suivez quelques étapes d'introduction",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
         SizedBox(height: 20),
        Card(
            elevation: 5.0,
            margin: EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/icons/apprentissage.png',
                  width: 50, // Ajustez la largeur selon vos besoins
                  height: 50, // Ajustez la hauteur selon vos besoins
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Commencer l\'apprentissage',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Card(
            elevation: 5.0,
            margin: EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/icons/test.jpg',
                  width: 50, // Ajustez la largeur selon vos besoins
                  height: 50, // Ajustez la hauteur selon vos besoins
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Passer un test',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Card(
            elevation: 5.0,
            margin: EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/icons/journal.png',
                  width: 50, // Ajustez la largeur selon vos besoins
                  height: 50, // Ajustez la hauteur selon vos besoins
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Commencer l\'apprentissage',
                    style: TextStyle(
                      fontSize: 16,
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