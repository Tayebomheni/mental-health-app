import 'package:flutter/material.dart';
import 'package:pcd/apprendre.dart';
import 'package:pcd/pages/MyHomePage.dart';
import 'package:pcd/therapies/chatbott.dart';

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
  bool isLoading=false;

  @override
  Widget build(BuildContext context) {
    return  Container(
      color : Theme.of(context).colorScheme.background,
      child: Padding(
        
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
            SizedBox(height: 8),
            Card(
        elevation: 5.0,
        color: Theme.of(context).colorScheme.primary,
        margin: EdgeInsets.all(10.0),
        child: GestureDetector(
      onTap: () {
        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Apprentissage()),
                      );
        // Ajoutez l'action que vous souhaitez exécuter lors du clic sur la carte
        Navigator.push(context, MaterialPageRoute(builder: (context) => Apprentissage()));
        // Vous pouvez ajouter d'autres logiques ou navigations ici
      },
      child: Container(
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 106.0,
              width: MediaQuery.of(context).size.width * 0.3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset(
                  'assets/icons/apprentissage3.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 8.0),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Commencer l\'apprentissage',
                        style: TextStyle(
                          fontSize: 15.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 2.0),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Familiariser vous avec le concept de thérapie pour comprendre ses principes!',
                        style: TextStyle(
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
        ),
      )
      ,
      
      
       
      Card(
        elevation: 5.0,
        color: Theme.of(context).colorScheme.primary,
        margin: EdgeInsets.all(10.0),
        child: GestureDetector(
      onTap: () {
        // Ajoutez l'action que vous souhaitez exécuter lors du clic sur la carte
         Navigator.push(context, MaterialPageRoute(builder: (context) => BOT()));
        // Vous pouvez ajouter d'autres logiques ou navigations ici
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 115.0,
            width: MediaQuery.of(context).size.width * 0.3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                'assets/icons/chatbot4.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 8.0),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    'Discuter avec un chatbot ',
                    style: TextStyle(
                      fontSize: 15.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 2.0),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Interagir avec un chatbot qui fournit un soutien, des conseils et des informations sur la santé mentale !',
                      style: TextStyle(
                        fontSize: 11,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
        ),
      )
      ,
      
      
            Card(
  elevation: 5.0,
  color: Theme.of(context).colorScheme.primary,
  margin: EdgeInsets.all(10.0),
  child: GestureDetector(
    onTap: () {;
      // Ajoutez l'action que vous souhaitez exécuter lors du clic sur la carte
     Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
      // Vous pouvez ajouter d'autres logiques ou navigations ici
    },
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      
      children: [
        Container(
          height: 105.0,
          width: MediaQuery.of(context).size.width * 0.3,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              'assets/icons/test4.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 8.0),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Passer un test ',
                  style: TextStyle(
                    fontSize: 15.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2.0),
                Padding(
                 // padding: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.only(left: 2.0, top: 8.0),
                  child: Text(
                    'Evaluer l\'état psychologique actuel !',
                    style: TextStyle(
                      fontSize: 11,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  ),
),

      
      
          /*  Card(         
        elevation: 5.0,
        margin: EdgeInsets.all(10.0),
        child: GestureDetector(
      onTap: () {
        // Ajoutez l'action que vous souhaitez exécuter lors du clic sur la carte
        print("La troisième carte a été cliquée !");
        // Vous pouvez ajouter d'autres logiques ou navigations ici
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 110.0,
            width: MediaQuery.of(context).size.width * 0.3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                'assets/icons/journal1.webp',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 8.0),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Text(
                    'Créer une entrée dans le journal',
                    style: TextStyle(
                      fontSize: 15.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 2.0),
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Text(
                      'Commencer le travail pratique pour changer les pensées !',
                      style: TextStyle(
                        fontSize: 11,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
        ),
      )
      ,*/
          ],
        ),
      ),
    );
  }
}
