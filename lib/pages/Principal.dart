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
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 70),
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
          SizedBox(height: 25),
         
          CustomContainer(onTap: onContainerClicked),
          SizedBox(height: 5),
          CustomContainer(onTap: onContainerClicked),
          SizedBox(height: 5),
          CustomContainer(onTap: onContainerClicked),
        ],
      ),
    );
  }
}
