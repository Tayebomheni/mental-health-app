import 'package:flutter/material.dart';
import 'package:pcd/pages/Principal.dart';
import 'package:pcd/question.dart';
 

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> questtionsdepression = List.filled(18, "Choisissez une option");
  
  List<List<String>> reponsesdepression = [["Rien ne me rend triste","Je ressens de la tristesse plus souvent que d'habitude", "Je suis triste tout le temps et je ne peux pas l'arrêter" ,"Je suis tellement triste et misérable que je ne peux pas résister à ces sentiments" ],["Je n'ai pas peur de l'avenir","J'ai peur de l'avenir","Je n'entrevois rien de bon dans l'avenir","Je sais que l'avenir est effrayant et que rien ne peut être changé"],


["L'échec ne m'arrive pas plus qu'à n'importe qui d'autre","J'ai l'impression d'échouer plus souvent que les autres","Quand je regarde le passé, je vois beaucoup d'échecs","J'ai l'impression d'être un vrai loser"],["J'apprécie les choses comme je le faisais auparavant","Je n'apprécie plus les choses ordinaires autant qu'avant","Je n'aime rienJe m'ennuie", "je ne suis excité par rien"],
["Je n'ai aucune culpabilité","Je me sens coupable la plupart du temps","Je me sens complètement coupable la plupart du temps.","Je me sens toujours coupable"],
["Je n'ai pas l'impression d'être jugée","J'ai l'impression que les gens pourraient me juger","Je m'attends à être jugé","J'ai l'impression que tout le monde autour de moi me juge."],
["Je ne suis pas déçu par moi-même","Je suis déçu par moi-même","Je suis dégoûté de moi-même","Je me déteste"],
["Je n'ai pas l'impression d'être pire que les autres.","Je me critique pour mes lacunes et mes erreurs","Je me critique constamment pour mes échecs", "Je me reproche tout ce qui se passe."],
["Je n'ai pas de pensées suicidaires","J'ai déjà pensé au suicide, mais je ne le ferais jamais.","J'aimerais me suicider","Je me tuerais si je prenais le risque."],
["Je ne m'inquiète pas plus que d'habitude","Je suis plus inquiet que d'habitude en ce moment","Je m'inquiète tout le temps.","L'anxiété me submerge et je ne peux pas y faire face."],
["Je ne suis pas plus irrité que d'habitude","Je suis un peu plus agacé que d'habitude.","Je peux tout à fait être agacé et irrité pendant un certain temps.","Je me sens tout le temps irrité"],
["Je n'ai pas perdu l'intérêt pour les gens","Je m'intéresse moins aux gens que d'habitude.","J'ai perdu la plupart de mon intérêt pour les gens.","Je ne m'intéresse plus du tout aux gens"],
["Je prends des décisions aussi clairement que je l'ai toujours fait.","J'ai reporté ma décision plus longtemps que d'habitude","J'ai plus de difficultés à prendre des décisions maintenant qu'avant.","Je suis totalement incapable de prendre des décisions"],
["Je ne pense pas avoir l'air plus mal en point que d'habitude.","Je crains d'avoir l'air un peu plus vieux ou de manquer d'attrait.","J'ai constamment l'impression que quelque chose est en train de changer en moi, me rendant de moins en moins attirante.","Je suis sûre que j'ai l'air horrible"],
["Je travaille aussi bien que je l'ai jamais fait","Le travail exige un effort supplémentaire de ma part","Je dois me forcer à faire quelque chose","Je ne peux pas travailler"],
["Je dors aussi bien que d'habitude.","Je dors un peu moins bien que d'habitude","Aujourd'hui, je me réveille 1 à 2 heures plus tôt et j'ai du mal à me rendormir.","Je me réveille quelques heures plus tôt que d'habitude et je n'arrive pas à me rendormir."],
["Je ne suis pas plus fatiguée que je ne l'ai toujours été","Je me fatigue plus vite maintenant","Je me lasse de presque tous les emplois","Je me lasse de tout"],
["Mon appétit est ce qu'il était","Mon appétit n'est plus aussi bon qu'avant","Mon appétit s'est considérablement affaibli","Rien n'attire mon appétit"],


];
List<String> questtionstrouble = ["Combien de fois avez-vous eu du mal à finaliser les derniers détails d'un projet alors que le plus dur était passé ?",
"Combien de fois éprouvez-vous des difficultés à mettre de l'ordre dans vos affaires lorsque vous effectuez une tâche qui nécessite de l'organisation ?",
"A quelle fréquence avez-vous des difficultés à vous souvenir de vos rendez-vous ou de vos engagements ?",
"Lorsque vous avez une tâche qui demande beaucoup de réflexion, combien de fois évitez-vous ou reportez-vous le moment de commencer ?",
"Combien de fois vous arrive-t-il de vous agiter ou de faire des mouvements inutiles avec vos bras et vos jambes lorsque vous devez rester assis pendant de longues périodes ?",
"Combien de fois vous sentez-vous hyperactif et obligé de faire quelque chose, comme si vous aviez un moteur en marche à l'intérieur de vous ?",
"Combien de fois faites-vous des erreurs d'inattention lorsque vous effectuez un travail ennuyeux ou difficile ?",
"Combien de fois avez-vous eu du mal à maintenir votre attention lors d'un travail ennuyeux et monotone ?",
"Combien de fois avez-vous du mal à vous concentrer sur ce que les gens vous disent, même s'ils s'adressent directement à vous ?",
"Combien de fois perdez-vous ou avez-vous du mal à trouver des objets à la maison ou au travail ?",
"Combien de fois êtes-vous distrait par des événements ou des bruits autour de vous ?",
"Combien de fois quittez-vous votre siège lors de réunions ou d'autres situations où vous devez rester assis au même endroit pendant de longues périodes ?",
"A quelle fréquence vous sentez-vous anxieux ou agité ?",
"Avez-vous souvent du mal à vous détendre et à vous relaxer lorsque vous avez du temps libre ?",
"Combien de fois vous surprenez-vous à parler de manière excessive lorsque vous êtes en public ?",
"Combien de fois, au cours d'une conversation, vous surprenez-vous à finir les phrases des gens avant qu'ils ne puissent terminer les leurs ?",
"Combien de fois trouvez-vous difficile d'attendre votre tour ?",
"Combien de fois interrompez-vous les autres lorsqu'ils sont occupés ?",
];
List<List<String>> reponsestrouble = List.filled(18, ["Jamais","Rarement","Parfois","Souvent","Toujours"]);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      
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
                        MaterialPageRoute(builder: (context) => Questionnaire(),settings: RouteSettings( arguments: {'liste1': questtionsdepression, 'liste2': reponsesdepression},)),
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
                          MaterialPageRoute(builder: (context) => Questionnaire(),settings: RouteSettings( arguments: {'liste1': questtionsdepression, 'liste2': reponsesdepression},)),
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
                            MaterialPageRoute(builder: (context) => Questionnaire(),settings: RouteSettings( arguments: {'liste1': questtionstrouble, 'liste2': reponsestrouble},)),
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
                          MaterialPageRoute(builder: (context) => Questionnaire(),settings: RouteSettings( arguments: {'liste1': questtionsdepression, 'liste2': reponsesdepression},)),
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
