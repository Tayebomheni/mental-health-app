import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Aide extends StatelessWidget {
  final TextEditingController _reclamationController = TextEditingController();

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
              question:
                  "Quels types de fonctionnalités propose l'application pour soutenir la santé mentale ?",
              answer:
                  "L'application offre une gamme de fonctionnalités, y compris des exercices de relaxation, des techniques de respiration, des journaux de suivi émotionnel, des rappels pour la prise de médicaments, des conseils pour la gestion du stress et bien plus encore.",
            ),
            _buildFAQItem(
              question: "Comment puis-je obtenir de l'aide en cas de crise ?",
              answer:
                  "Si vous vous trouvez en situation de crise ou avez besoin d'une assistance immédiate, veuillez contacter les services d'urgence de votre région ou utiliser les ressources d'aide disponibles dans l'application. Nous encourageons nos utilisateurs à ne pas hésiter à demander de l'aide en cas de besoin.",
            ),

            //réclamation

            SizedBox(height: 20),
            Text(
              'Faire une réclamation :',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _reclamationController,
              decoration: InputDecoration(
                labelText: 'Votre réclamation',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            ElevatedButton(
             style: ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
      
      // Définir la couleur du bouton en fonction du thème
      return Theme.of(context).secondaryHeaderColor;
    }),
    foregroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
      // Définir la couleur du texte en fonction du thème
      return Theme.of(context).textTheme.button!.color!;
    }),
                
                 padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero), // Supprimer le padding par défaut
              ),
              onPressed: () async {
                // Obtenir l'utilisateur actuellement authentifié
                User? user = FirebaseAuth.instance.currentUser;
                if (user != null) {
                  // Envoyer la réclamation au backend Firebase Firestore
                  String reclamationText = _reclamationController.text;
                  if (reclamationText.isNotEmpty) {
                    try {
                      await FirebaseFirestore.instance.collection('reclamations').add({
                        'email': user.email,
                        'reclamation': reclamationText,
                        'timestamp': Timestamp.now(),
                      });
                      // Réinitialiser le champ de réclamation après l'envoi
                      _reclamationController.clear();
                      // Afficher un message de confirmation
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Réclamation envoyée avec succès !')),
                      );
                    } catch (error) {
                      // Gérer les erreurs
                      print('Erreur lors de l\'envoi de la réclamation : $error');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Erreur lors de l\'envoi de la réclamation. Veuillez réessayer.')),
                      );
                    }
                  } else {
                    // Afficher un message si le champ de réclamation est vide
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Veuillez entrer votre réclamation.')),
                    );
                  }
                } 
              },
              child: Text('Envoyer la réclamation',
                ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFAQItem({required String question, required String answer}) {
    return ExpansionTile(
      title: Text(
        question,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.purple, fontSize: 18.0),
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
