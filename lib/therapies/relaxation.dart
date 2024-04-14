import 'package:flutter/material.dart';

class exercice extends StatelessWidget {
  Widget boldText(String boldPart, String normalPart) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: boldPart,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: normalPart,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Exercices de relaxation'),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(
                    context); // Fermer la page statique et retourner à la page précédente
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("1. La méditation",
                  style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(231, 204, 158, 228))),
              SizedBox(
                height: 10,
              ),
              Text(
                  "La méditation est une pratique ancienne qui vise à cultiver l'attention, la conscience et la tranquillité mentale. Elle implique généralement de se concentrer sur un objet, une pensée, une sensation ou une activité spécifique, tout en observant ses pensées et ses émotions sans les juger. La méditation est souvent utilisée comme un outil pour réduire le stress, améliorer la concentration, favoriser le bien-être émotionnel et développer une plus grande clarté mentale."),
              SizedBox(
                height: 10,
              ),
              Image(image: AssetImage('assets/icons/meditation.gif')),
              SizedBox(
                height: 20,
              ),
              Text("Etapes de méditation :",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 10,
              ),
              boldText("1. Trouvez un endroit calme : ",
                  "Choisissez un endroit tranquille où vous ne serez pas dérangé."),
              SizedBox(height: 20), // Espacement entre les textes
              boldText("2. Pratiquez la respiration profonde : ",
                  "Prenez des respirations lentes et profondes pour vous détendre."),
              SizedBox(height: 20), // Espacement entre les textes
              boldText("3. Concentrez-vous sur le moment présent : ",
                  "Évitez de penser au passé ou au futur et concentrez-vous sur le présent."),
              SizedBox(height: 20), // Espacement entre les textes
              boldText("4. Respirez naturellement : ",
                  "Laissez votre respiration suivre son cours naturel sans essayer de la contrôler."),
              SizedBox(height: 20), // Espacement entre les textes
              boldText("5. Soyez indulgent avec vous-même : ",
                  "Acceptez vos pensées et émotions sans jugement et avec bienveillance."),
              SizedBox(height: 20), // Espacement entre les textes
              boldText("6. Pratiquez régulièrement : ",
                  "La méditation s'améliore avec la pratique régulière, alors essayez de méditer chaque jour."),
              SizedBox(height: 20), // Espacement entre les textes
              boldText("7. Restez patient : ",
                  "La méditation peut prendre du temps à maîtriser, alors soyez patient avec vous-même tout au long du processus."),
              SizedBox(
                height: 20,
              ),
              Text("2. Le Yoga",
                  style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(231, 204, 158, 228))),
              SizedBox(
                height: 20,
              ),
              Text(
                  "Le yoga est une pratique millénaire originaire d’Inde qui vise à apporter un équilibre entre le corps, le mental et le spirituel. Il s’agit à la fois d’une philosophie et d’une discipline comportant diverses techniques pour parvenir à cet objectif. Voyons plus en détail ce qu’est le yoga et les différents aspects de cette pratique. Le mot « yoga » vient du sanskrit et signifie « lier », « attacher », « mettre sous un joug ». Il désigne l’union du corps, de l’esprit et de l’âme. Le yoga est donc une discipline qui permet de lier le corps et l’esprit pour atteindre un état d’harmonie."),
              Image(image: AssetImage("assets/icons/yoga3.png")),
              SizedBox(
                height: 20,
              ),
              Text("Les composantes d’une séance de yoga ",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 20,
              ),
              boldText("•",
                  "  Des exercices de respiration (pranayama) pour se concentrer et se recentrer sur soi-même."),
              SizedBox(
                height: 10,
              ),
              boldText("•",
                  "  Des postures (asanas) pour assouplir, renforcer et étirer le corps en conscience. Elles se pratiquent de manière fluide et coordonnée avec la respiration."),
              SizedBox(
                height: 10,
              ),
              boldText("•",
                  "  De la relaxation et/ou de la méditation pour se relaxer profondément et calmer le mental."),
              SizedBox(
                height: 10,
              ),
              boldText("•",
                  "  Parfois, du chant de mantras ou de la lecture de textes spirituels"),

              SizedBox(
                height: 20,
              ),
              Text("Les bienfaits du yoga ",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 10,
              ),
              Image(image: AssetImage("assets/icons/yoga2.png")),
              SizedBox(
                height: 20,
              ),
              boldText("•",
                  "  Amélioration de la souplesse, de la force et de l’équilibre."),
              SizedBox(
                height: 10,
              ),
              boldText("•",
                  "  Renforcement des muscles profonds qui soutiennent la colonne vertébrale."),
              SizedBox(
                height: 10,
              ),
              boldText("•",
                  "  Amélioration de la posture et soulagement des douleurs dorsales."),
              SizedBox(
                height: 10,
              ),
              boldText("•", "  Meilleure circulation sanguine et lymphatique."),
              SizedBox(
                height: 10,
              ),
              boldText("•", "  Réduction du stress et de l’anxiété."),
              SizedBox(
                height: 10,
              ),
              boldText(
                  "•", "  Amélioration de la concentration et de la mémoire."),
              SizedBox(
                height: 10,
              ),
              boldText("•", "  Meilleure qualité du sommeil"),
              SizedBox(
                height: 10,
              ),
              boldText("•", "  Sensation de bien-être et de sérénité."),
              SizedBox(
                height: 10,
              ),
              Text("Conseils pour débuter le yoga ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 10,
              ),
              boldText("•",
                  "  Suivre des cours avec un professeur qualifié, au moins au début."),
              SizedBox(
                height: 10,
              ),
              boldText("•",
                  "  Choisir un style de yoga adapté à ses capacités et à ses objectifs."),
              SizedBox(
                height: 10,
              ),
              boldText("•",
                  "  Progresser à son rythme et écouter les sensations de son corps"),
              SizedBox(
                height: 10,
              ),
              boldText("•",
                  "  Pratiquer sur un tapis antidérapant et porter des vêtements confortables."),
              SizedBox(
                height: 10,
              ),
              boldText("•", "  Éviter de manger juste avant la pratique."),
              SizedBox(
                height: 10,
              ),
              boldText("•",
                  "  Se concentrer sur sa respiration pour rester détendu dans les postures."),
              SizedBox(
                height: 10,
              ),
              boldText("•",
                  "  Ne pas forcer et respecter ses limites pour éviter les blessures."),
              SizedBox(
                height: 10,
              ),
              boldText("•",
                  "  Pratiquer de façon régulière pour en retirer tous les bienfaits."),

              Image(image: AssetImage("assets/icons/yoga1.png")),
            ]),
          ),
        ));
  }
}
