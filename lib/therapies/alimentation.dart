import 'package:flutter/material.dart';

class alimentation extends StatelessWidget {
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
        title: Text("L' alimentation"),
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
        child: Column(
          children: [
            Image(image: AssetImage("assets/icons/entete.png")),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "Le régime alimentaire peut être un outil puissant pour améliorer les symptômes du trouble dépressif. Il existe des aliments qui peuvent contribuer à réduire les symptômes de la dépression. Il s’agit notamment des aliments riches en oméga-3, en vitamine B, en magnésium et en fer. Voici un tableau récapitulatif :"),
                  SizedBox(
                    height: 20,
                  ),
                  Image(image: AssetImage("assets/icons/tableau.png")),
                  SizedBox(
                    height: 20,
                  ),
                  Text("La réduction ds troubles anxieux ",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "Les habitudes alimentaires peuvent avoir un impact important sur le risque de développer des troubles anxieux. En effet, une alimentation saine et variée aide à maintenir l’équilibre émotionnel. Elle minimise le risque de développer des troubles anxieux. Une alimentation riche en fruits et légumes frais, en céréales complètes, en viande maigre, en poisson et en noix peut contribuer à réduire le risque de troubles anxieux.Cependant, il vous faudra éviter de consommer de l’alcool et des produits illicites. Ces produits sont susceptibles de contribuer à l’anxiété. Pour finir, il est conseillé de prendre le temps de préparer et de manger des repas sains. Cela peut permettre de soulager le stress et de prévenir les troubles anxieux."),
                  SizedBox(
                    height: 10,
                  ),
                  Image(
                    image: AssetImage("assets/icons/steak.gif"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("La réduction du niveau du stress",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "Un régime alimentaire approprié peut jouer un rôle important dans la gestion du stress. Lorsque nous sommes stressés, notre corps et notre cerveau réagissent différentes manières. Il se peut que nous soyons plus fatigués et plus anxieux. Adopter une alimentation saine et équilibrée peut alors contribuer à réduire le stress."),
                  Image(image: AssetImage("assets/icons/food1.png")),
                  Text(
                      "Voici quelques conseils pour une alimentation saine et équilbrée qui peut aider à réduire le stress :"),
                  SizedBox(
                    height: 10,
                  ),
                  boldText("•",
                      "  Privilégiez les aliments pauvres en graisses et en sucre."),
                  SizedBox(
                    height: 10,
                  ),
                  boldText("•",
                      "  Mangez des aliments sains et nutritifs tels que : des légumes, des fruits, des céréales complètes et des protéines maigres."),
                  SizedBox(
                    height: 10,
                  ),
                  boldText("•",
                      "  Faites des pauses pour prendre des collations saines et équilibrées."),
                  SizedBox(
                    height: 10,
                  ),
                  boldText("•",
                      "  Essayez de trouver le temps de prendre un petit-déjeuner équilibré. Il est essentiel pour commencer la journée en beauté."),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
