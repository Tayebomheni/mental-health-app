import 'package:flutter/material.dart';

class Principal extends StatefulWidget {
  const Principal({Key? key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Découvrer le fonctionnement de l'application !",
          style: TextStyle(
            fontWeight: FontWeight.bold, // Rend le texte gras
          ),
        ),
        SizedBox(height: 10), // Espace entre les deux textes
        Text(
          "Nous utilisons une méthode efficace pour surmonter les problèmes psychologiques. "
          "Mais elle nécessite de la compréhension. Suivez quelques étapes d'introduction",
        ),
      ],
    );
  }
}
