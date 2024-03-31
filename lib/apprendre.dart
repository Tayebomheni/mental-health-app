import 'package:flutter/material.dart';
import 'main.dart';
import 'information.dart';

void main() {
  runApp(Apprendre());
}

class Apprendre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Apprentissage(),
    );
  }
}

class Apprentissage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 53, 53, 54),
      
      appBar: 
      
      AppBar(
        toolbarHeight: 100,
        backgroundColor: Color.fromARGB(255, 53, 53, 54),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            //Navigator.push(context, MaterialPageRoute(builder: (context) => home()),);
            // Action à effectuer lors de l'appui sur la flèche de retour
            
          },
          iconSize: 40,
        ),
        elevation: 0.0,
      ),


      body: SingleChildScrollView(
      child :
      Stack(
        children: [
        
      Center(
         
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Image.asset(
            'assets/22bg.png', // Remplacez par votre URL d'image
           width: 300,
           height: 380,
            
         ),
             
            SizedBox(height: 60),
             Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
              "Découvrez la puissance de la thérapie cognitivo-comportementale avec notre cours interactif sur les fondamentaux de la TCC !\nCe cours est destiné à tous ceux qui aspirent à se comprendre et à surmonter des problèmes psychologiques tels que le stress, l'anxiété et la dépression, grâce à des techniques et stratégies éprouvées par le temps.Apprenez à modifier les pensées négatives et les modèles de comportement afin de mener une vie plus heureuse et saine.",
              style: TextStyle(color :Colors.white,fontSize: 18,),
              textAlign: TextAlign.left,
              
            ),),
                ),
                
             SizedBox(height: 30),
            RectangleButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => sinformer1(), settings: RouteSettings(arguments: ["OBJECT DE CETTE SECTION \n \nL'équipe de MindHealth vous souhaite la bienvenue au début d'un voyage passionnant pour apprendre l'une des techniques les plus efficaces pour maintenir la santé psychologique ! \n \nTous les membres de notre équipe ont été confrontés à des problèmes psychologiques par le passé.\n \nEn essayant de les surmonter, chacun d'entre nous a trouvé exactement la méthodologie sur laquelle cette application est basée et dont nous allons parler maintenant. \n\nBien que les principes de cette technique soient assez simples, s'y plonger demande un certain effort. \n\nNous souhaitons vous expliquer de manière détendue le fonctionnement de cette approche et nous espérons vous enthousiasmer autant que notre équipe !\n\nCette approche est appelée thérapie cognitivo-comportementale. \n\nPar souci de simplicité, convenons de l'appeler CPT à l'avenir, d'accord ? \n \nPour les plus impatients, nous allons résumer son idée de base, mais dans les prochains chapitres, nous aborderons tout en détail.\n\nLE CONCEPT DE BASE DE LA CPT EST QUE NOS PENSÉES, NOS SENTIMENTS ET NOS COMPORTEMENTS SONT INTERCONNECTÉS ET S'INFLUENCENT MUTUELLEMENT.\n\nPar exemple, si nous pensons que nous ne réussirons jamais au travail, nous nous sentirons impuissants et notre comportement reflétera ce sentiment.\n\nÇa a l'air simple, non ?\n\nPeut-être. Mais beaucoup sous-estiment la profondeur de ce concept en l'appliquant de manière superficielle.\n\nLeurs efforts ont toujours un impact, mais il est possible de faire beaucoup plus !\n\nNous sommes là pour vous guider sur la bonne voie et rendre votre expérience aussi productive que possible.\n\nMais nous ne sommes pas non plus à l'abri des erreurs.\n\nAlors écrivez vos impressions, donnez-nous votre avis, signalez-nous nos inexactitudes. \n\nNous sommes heureux de recevoir vos commentaires! \n\nIl convient également de préciser que la kinésithérapie, plus que toute autre thérapie, est éducative.",'assets/objectif.png']
,),),);
                // Ajoutez ici le code que vous souhaitez exécuter lorsque le rectangle est cliqué
                print('Rectangle 1 cliqué');
                // Naviguer vers une autre page, par exemple :
                // Navigator.push(context, MaterialPageRoute(builder: (context) => NextPage()));
              },
              image: 'assets/objectif.png',
              text: 'Objectif de cette section',
              
              
            ),
            SizedBox(height: 20.0), // Espacement entre les rectangles
            RectangleButton(
              onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => sinformer1(), settings: RouteSettings(arguments: ["EST-CE QUE CELA FONCTIONNE ?\n\nLe ciel n'était pas sans nuages pour le CPT à ses débuts.\n\nLes analystes freudiens et d'autres chercheurs contemporains ont critiqué la théorie de Beck pour sa 'superficialité' et ont souligné son manque de preuves. \n\nLes firmes pharmaceutiques, dont les profits générés par les médicaments psychotropes sont menacés, ont également été attaquées.Il a fallu du temps pour que la base de données probantes se développe.En 1977, le psychologue a mené des essais avec des patients souffrant de dépression, qui ont prouvé que la thérapie cognitivo-comportementale était plus efficace que l'imipramine, l'antidépresseur le plus efficace à l'époque.\n\nÀ ce jour, plus de 200 expériences approfondies ont prouvé l'efficacité de la technique dans différents cas.\n\nVoici au moins quelques exemples montrant que la kinésithérapie respiratoire est efficace pour des problèmes psychologiques très différents :\n\n    Dépression : Une étude réalisée en 2012 par Thad Jude et ses collègues a révélé que la TPC était efficace chez 40 à 60 % des patients souffrant de dépression après 14 à 16 séances de thérapie. À long terme, l'efficacité de la TPC a continué à augmenter, réduisant le risque de rechute de 50 à 60 %.\n\n    Anxiété : Une étude réalisée en 2018 par Norton et ses collègues a révélé que la TPC était efficace pour 46 à 66 % des patients souffrant de troubles anxieux généralisés. Les effets de la TPC semblent être stables à long terme, avec de faibles taux de rechute.\n\n    SSPT : une étude réalisée en 2014 par Schneider et ses collègues a révélé que 60 à 72 % des patients souffrant de SSPT présentaient une amélioration significative après un cours de TCC. De plus, les résultats étaient stables à long terme.\n\n    Attaques de panique : En 2017, Barlow et ses collègues ont constaté que la TCC entraînait une réduction significative des attaques de panique chez 60 à 75 % des patients. Les améliorations se sont maintenues à long terme, avec de faibles taux de rechute.\n\n  <<On dit que les chiffres gouvernent le monde. Non, ils montrent seulement comment ils gouvernent le monde.>>\n                                          - Johann Wolfgang Goethe",'assets/fonctionne.png']
,),),);
                // Ajoutez ici le code que vous souhaitez exécuter lorsque le rectangle est cliqué
                print('Rectangle 2 cliqué');
              },
               image: 'assets/fonctionne.png',
              text: 'Est-ce que cela fonctio- \n nne ?',
            ),
            SizedBox(height: 20.0), // Espacement entre les rectangles
            RectangleButton(
              onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => sinformer1(), settings: RouteSettings(arguments: ["PENSEZ, SENTEZ, AGISSEZ !\n\nIl est donc temps de parler des principes de base de la thérapie !\n\nLa CPT nous offre un modèle simple et illustratif, la 'triade' des pensées, des sentiments et des comportements.\n\nChaque élément de ce triangle influe sur les deux autres.Par exemple, repensez à une situation qui vous a traumatisé.Dès que vous plongerez dans les souvenirs, vous ressentirez des émotions négatives.\n\nVous vous sentirez triste ou nostalgique, ou peut-être, au contraire, en colère.\n\nVotre corps réagit alors : vous commencez à transpirer, vos muscles se contractent, etc.\n\nComme vous pouvez le constater, l'un influe clairement sur l'autre.\n\nMais il n'y a rien de mal à cette corrélation : nous passons chaque jour par un cycle similaire de pensées positives et négatives.\n\nLes problèmes commencent lorsque nous sommes pris dans un cercle vicieux de négativité.\n\nLa première pensée négative est suivie d'émotions et de réactions négatives.\nEt déjà ces émotions nous font penser toujours la même chose défavorable, entretenant un cycle perpétuel et générant de plus en plus de réactions négatives.",'assets/penser.png']
,),),);
                print('Rectangle 2 cliqué');
              },
               image: 'assets/penser.png',
              text: 'Pensez,sentez,agissez !',
            ),
            SizedBox(height: 20.0), // Espacement entre les rectangles
            RectangleButton(
              onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => sinformer1(), settings: RouteSettings(arguments: ["Les attitudes irrationnelles peuvent-elles être utiles ?\n\nDans les chapitres précédents, nous avons mis l'accent sur les pensées et croyances destructrices.\n\n Ce n'est pas surprenant, car ce sont elles qui affectent négativement nos émotions, notre comportement et notre bien-être général.\nCela soulève la question suivante : toutes nos croyances sont-elles vraiment si mauvaises et peuvent-elles nous être utiles ?\n\nLe problème est que les croyances négatives sont activées lorsque nous sommes stressés, déprimés ou dépressifs, ou lorsque nous rencontrons une confirmation de ces croyances.\n\nPar exemple, si une personne est convaincue qu'elle n'est capable de rien, elle risque d'activer cette croyance en cas d'échec à un examen ou de réprimande de la part d'un supérieur.\n\nUne personne interprétera ce qui se passe à travers le prisme de cette croyance, même si elle est illogique et irrationnelle.Cependant, cela ne signifie pas que toutes nos croyances sont mauvaises et qu'elles n'ont aucune utilité.Dans des situations moins stressantes ou dans un état plus débrouillard, une autre croyance positive peut être activée, comme par exemple : 'Je suis suffisamment capable' : 'Je suis suffisamment capable'.\nPar conséquent, la réponse à la question 'Toutes les croyances sont-elles nuisibles ?' \n                                         - non, pas toutes.\n\nQuant à l'influence positive des attitudes irrationnelles, la situation est un peu plus compliquée, comprenons-nous bien.Certains peuvent penser que les choses ne sont pas si mauvaises et que les croyances irrationnelles peuvent même aider dans la vie, mais il s'agit plus d'une idée fausse que de la vérité.\n\nPour compléter le tableau, voici quelques exemples. \n\nNous avons déjà discuté du fait qu'il existe trois niveaux de pensée : les pensées, les croyances intermédiaires et les croyances profondes.\nImaginons qu'un jeune homme nommé John ait une croyance sous-jacente, 'Je ne suis capable de rien', et une croyance intermédiaire, telle que 'Je devrais toujours réussir'.\n\nD'un côté, on peut penser qu'il n'y a rien de mal à cette croyance. Après tout, c'est une bonne chose que Jean veuille réussir. \n\nÀ première vue, il n'y a vraiment rien de mal s'il s'agit simplement d'un désir ou d'un objectif plutôt que d'une règle rigide.\n\nVous pouvez penser que c'est même une bonne chose pour lui, car grâce à cette attitude, il travaillera dur, obtiendra quelques succès, deviendra plus motivé et plus déterminé.\n\nLe travail devient très important pour lui et ne semble avoir que des conséquences positives.\nMais creusons un peu plus loin.\n\nS'il s'agit vraiment d'une croyance intermédiaire et non d'un simple désir, elle risque d'être destructrice plutôt que constructive.\n En effet, elle est enracinée dans sa croyance sous-jacente. \n\nDans ce cas, le travail devient une stratégie d'adaptation pour Jean (nous reviendrons sur les stratégies d'adaptation dans les chapitres suivants).\nPuisqu'une personne ne peut qu'aimer ou détester son travail, elle doit en voir les conséquences. \n\nLes bourreaux de travail oublient simplement qu'ils n'existent pas pour le travail, mais que le travail est pour eux.\n                                                - Léon Tolstoï",'assets/quatre.png']
,),),);
                print('Rectangle 2 cliqué');
              },
               image: 'assets/quatre.png',
              text: 'Les attitudes irration-\nnelles  peuvent-elle \netre utiles ?',
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
  final String text ;
  final String image ;

  RectangleButton({required this.onPressed,required this.text,required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 390.0,
        height: 100.0,
        
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
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
                // Espacement entre l'image et le texte
                
                SizedBox(width: 35.0),
                     ClipRRect(
            borderRadius: BorderRadius.circular(22.0), 
            // Ajustez le rayon des coins selon vos besoins
            child: Image.asset(
                  image,
                  width: 140.0, // ajustez la largeur de l'image selon vos besoins
                  height: 140.0, // ajustez la hauteur de l'image selon vos besoins
                  
                  
                ),
          ),
              ],
            ),
      
        decoration: BoxDecoration(
          color:  Color.fromARGB(255, 84, 82, 82),
          borderRadius: BorderRadius.circular(13.0),
        ),
        
      ),
    );
  }
}
