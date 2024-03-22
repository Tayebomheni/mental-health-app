import 'package:flutter/material.dart';

class Aide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aide et Support'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(height: 20),
            _buildFAQItem(
              question: "Comment puis-je commencer à utiliser l'application ?",
              answer:
                  "Pour commencer à utiliser L'application, téléchargez simplement l'application depuis l'App Store ou Google Play Store, créez un compte sécurisé et commencez à explorer nos fonctionnalités conçues pour améliorer votre bien-être mental.",
            ),
            _buildFAQItem(
              question:
                  "Est-ce que l'app garantit la confidentialité de mes données ?",
              answer:
                  "Oui,nous accordons une grande importance à la confidentialité et à la sécurité des données de nos utilisateurs. Toutes vos informations sont cryptées et stockées de manière sécurisée conformément aux réglementations en vigueur.",
            ),
            _buildFAQItem(
              question: "Quels types de fonctionnalités propose MindEase pour soutenir la santé mentale ?",
              answer:
                  "L'application offre une gamme de fonctionnalités, y compris des exercices de relaxation, des techniques de respiration, des journaux de suivi émotionnel, des rappels pour la prise de médicaments, des conseils pour la gestion du stress et bien plus encore.",
            ),
            _buildFAQItem(
              question: "Comment puis-je obtenir de l'aide en cas de crise ?",
              answer:
                  "Si vous vous trouvez en situation de crise ou avez besoin d'une assistance immédiate, veuillez contacter les services d'urgence de votre région ou utiliser les ressources d'aide disponibles dans l'application. Nous encourageons nos utilisateurs à ne pas hésiter à demander de l'aide en cas de besoin.",
            ),
            

           //réclamation


          ],
        ),
      ),
    );
  }

  Widget _buildFAQItem({required String question, required String answer}) {
    return ExpansionTile(
      title: Text(
        question,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 18.0),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            answer,
            style: TextStyle(fontSize: 16.0),
          ),
        ),
      ],
    );
  }
}

