import 'package:flutter/material.dart';

class confidentialite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Politique de Confidentialité'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical, // Définition de la direction de défilement à vertical
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.0),
              Text(
                "Politique de confidentialité",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.red,
                ),
              ),
              
              SizedBox(height: 16.0),
              Text(
                "L'application a été créée en tant qu'application gratuite. Ce service est fourni gratuitement et est destiné à être utilisé tel quel. Cette page est utilisée pour informer les visiteurs de la politique concernant la collecte, l'utilisation et la divulgation d'informations personnelles si quelqu'un choisit d'utiliser le service. Si vous choisissez d'utiliser le service, vous consentez à la collecte et à l'utilisation d'informations en relation avec cette politique. Les informations personnelles collectées sont utilisées pour fournir et améliorer le service. Elles ne seront ni utilisées ni partagées avec quiconque, sauf conformément à cette politique de confidentialité. Les termes utilisés dans cette politique de confidentialité ont la même signification que dans nos conditions générales, sauf indication contraire dans cette politique de confidentialité.",
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                "Collecte et utilisation des informations",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.red,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                "Pour une meilleure expérience d'utilisation du service, il peut être nécessaire de fournir certaines informations personnelles, y compris mais sans s'y limiter le développeur. Les informations demandées seront stockées sur votre appareil et ne seront en aucun cas collectées par le service. L'application utilise des services tiers qui peuvent collecter des informations vous identifiant.",
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                "Services",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.red,
                ),
              ),
              
              SizedBox(height: 16.0),

              Text(
  "Des sociétés et des individus externes peuvent être engagés pour les raisons suivantes :\n\n"
  "Faciliter le service ;\n"
  "Fournir un service en notre nom ;"
  "Il est important de noter que ces tiers ont accès aux informations personnelles des utilisateurs pour effectuer les tâches qui leur sont assignées. Ils sont toutefois tenus de ne pas divulguer ou utiliser ces informations à d'autres fins.",
  style: TextStyle(fontSize: 16.0),
),

              SizedBox(height: 16.0),
              Text(
                "Sécurité",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.red,
                ),
              ),
              
              SizedBox(height: 16.0),

              Text(
                "Des moyens commercialement acceptables sont utilisés pour protéger les informations personnelles fournies. Cependant, il est important de noter qu'aucune méthode de transmission sur Internet, ni aucun moyen de stockage électronique n'est à 100% sûr et sécurisé.",
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                "Liens vers d'autres sites",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.red,
                ),
              ),
              
              SizedBox(height: 16.0),

              Text(
                "Le service peut contenir des liens vers d'autres sites. Il est recommandé de lire les politiques de confidentialité de ces sites externes, car ils ne sont pas gérés par le service et ne sont pas sous sa responsabilité.",
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                "Confidentialité des enfants",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.red,
                ),
              ),
              
              SizedBox(height: 16.0),

              Text(
                "Le service n'est pas destiné aux personnes de moins de 13 ans. Aucune information personnelle n'est sciemment collectée auprès de personnes de moins de 13 ans. Si de telles informations sont découvertes, elles seront immédiatement supprimées des serveurs.",
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                "Changements à cette politique de confidentialité",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.red,
                ),
              ),
              
              SizedBox(height: 16.0),

              Text(
                "La politique de confidentialité peut être mise à jour périodiquement. Il est recommandé de consulter cette page régulièrement pour prendre connaissance des éventuelles modifications. Tout changement sera notifié en publiant une nouvelle politique de confidentialité sur cette page.",
                style: TextStyle(fontSize: 16.0),
              ),
              // Ajoutez le reste des sections de texte de la même manière
            ],
          ),
        ),
      ),
    );
  }
}
