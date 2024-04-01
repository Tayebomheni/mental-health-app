import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
 import 'package:pcd/pages/Exercices.dart';

import 'rate.dart';



class Questionnaire extends StatefulWidget {
  @override
  _QuestionnaireState createState() => _QuestionnaireState();
}

class _QuestionnaireState extends State<Questionnaire> {
  List<String> questions = [
    'Question 1: Flutter est-il génial?',
    
    'Question 2: Aimez-vous programmer en Dart?',
    // Ajoutez autant de questions que nécessaire
  ];

  List<String> reponses = [
    'Oui',
    'Non',
    'Peut-être',
    'autre',
  ];

  int questionIndex = 0;
  int finish = 0 ;

  
  double calculateRatio(int currentIndex) {
    int totalQuestions= questions.length;
    

    return (questionIndex + 1) / totalQuestions;
  }
  
  

  List<bool> checkedAnswers = List.generate(3, (index) => false);

  @override
  Widget build(BuildContext context) {
    double ratio = calculateRatio(questionIndex);
    return Scaffold(

      backgroundColor: Color.fromARGB(255, 53, 53, 54),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),

        child: AppBar(
          toolbarHeight: 95,
          automaticallyImplyLeading: false,
          title: Text(' Test',style: TextStyle(color: Colors.white,fontSize: 40.0, // Changer la taille de la police ici
                 fontWeight: FontWeight.bold,),),
          backgroundColor: Color.fromARGB(255, 53, 53, 54),
          elevation: 0.0,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [ LinearPercentIndicator(
            
            percent: ratio, // Ajustez la valeur de la progression ici (de 0.0 à 1.0)
            lineHeight: 10.0, // Ajustez la hauteur de la ligne de progression
            backgroundColor: Color.fromARGB(255, 217, 119, 244),
            progressColor: const Color.fromARGB(255, 133, 30, 198),
            
          ),
],
          ),
         
        actions: [
          IconButton(
            icon: Icon(Icons.cancel),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()),);
              // Ajoutez ici le code que vous souhaitez exécuter lorsque l'icône est appuyée
              print('Annuler');
            },
            iconSize: 35,
            color: Colors.white,
            
          
          ),
         
         
        ],
        
        ),
        
      ),
      
    
     
      body: 
      
      
      
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          
          
          children: [
            
            Text(
              questions[questionIndex],
              style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 35),
            Column(
              children:[

                RectangleButton(
            onPressed: () {
                finish =1 ;
               setState(() {
                  if (questionIndex < questions.length-1) {
                    // Vous avez atteint la fin du questionnaire, vous pouvez ajouter la logique finale ici
                    // par exemple, afficher un message de fin, réinitialiser le questionnaire, etc.
                    
                    questionIndex++;
                  }

                  else { Future.delayed(Duration(seconds: 1), () {
                  
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => RateAppScreen()),);
                    // Vous avez atteint la fin du questionnaire, vous pouvez ajouter la logique finale ici
                    // par exemple, afficher un message de fin, réinitialiser le questionnaire, etc
            });
                  }
              // Utiliser Navigator.push pour naviguer vers la deuxième page                  
                // Ajoutez ici le code que vous souhaitez exécuter lorsque le rectangle est cliqué
                print('Rectangle 3 cliqué');
                // Naviguer vers une autre page, par exemple :
                // Navigator.push(context, MaterialPageRoute(builder: (context) => NextPage()));
           
          });
            
                  
              },
              
              texte: reponses[0],
            ),
            SizedBox(height: 20),
            RectangleButton(
           onPressed: () {
                finish =1 ;
               setState(() {
                  if (questionIndex < questions.length-1) {
                    // Vous avez atteint la fin du questionnaire, vous pouvez ajouter la logique finale ici
                    // par exemple, afficher un message de fin, réinitialiser le questionnaire, etc.
                    
                    questionIndex++;
                  }

                  else { Future.delayed(Duration(seconds: 1), () {
                  
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => RateAppScreen()),);
                    // Vous avez atteint la fin du questionnaire, vous pouvez ajouter la logique finale ici
                    // par exemple, afficher un message de fin, réinitialiser le questionnaire, etc
            });
                  }
              // Utiliser Navigator.push pour naviguer vers la deuxième page                  
                // Ajoutez ici le code que vous souhaitez exécuter lorsque le rectangle est cliqué
                print('Rectangle 3 cliqué');
                // Naviguer vers une autre page, par exemple :
                // Navigator.push(context, MaterialPageRoute(builder: (context) => NextPage()));
           
          });
            
                  
              },
              
              texte: reponses[1],
            ),
            SizedBox(height: 20),
            RectangleButton(
             onPressed: () {
                finish =1 ;
               setState(() {
                  if (questionIndex < questions.length-1) {
                    // Vous avez atteint la fin du questionnaire, vous pouvez ajouter la logique finale ici
                    // par exemple, afficher un message de fin, réinitialiser le questionnaire, etc.
                    
                    questionIndex++;
                  }

                  else { Future.delayed(Duration(seconds: 1), () {
                  
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => RateAppScreen()),);
                    // Vous avez atteint la fin du questionnaire, vous pouvez ajouter la logique finale ici
                    // par exemple, afficher un message de fin, réinitialiser le questionnaire, etc
            });
                  }
              // Utiliser Navigator.push pour naviguer vers la deuxième page                  
                // Ajoutez ici le code que vous souhaitez exécuter lorsque le rectangle est cliqué
                print('Rectangle 3 cliqué');
                // Naviguer vers une autre page, par exemple :
                // Navigator.push(context, MaterialPageRoute(builder: (context) => NextPage()));
           
          });
            
                  
              },
              
              texte: reponses[2],
              
            ),
             SizedBox(height: 20),
            RectangleButton(
             onPressed: () {
                finish =1 ;
               setState(() {
                  if (questionIndex < questions.length-1) {
                    // Vous avez atteint la fin du questionnaire, vous pouvez ajouter la logique finale ici
                    // par exemple, afficher un message de fin, réinitialiser le questionnaire, etc.
                    
                    questionIndex++;
                  }

                  else { Future.delayed(Duration(seconds: 1), () {
                  
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => RateAppScreen()),);
                    // Vous avez atteint la fin du questionnaire, vous pouvez ajouter la logique finale ici
                    // par exemple, afficher un message de fin, réinitialiser le questionnaire, etc
            });
                  }
              // Utiliser Navigator.push pour naviguer vers la deuxième page                  
                // Ajoutez ici le code que vous souhaitez exécuter lorsque le rectangle est cliqué
                print('Rectangle 3 cliqué');
                // Naviguer vers une autre page, par exemple :
                // Navigator.push(context, MaterialPageRoute(builder: (context) => NextPage()));
           
          });
            
                  
              },
              
              texte: reponses[3],
            ),
            
               ],
              
              
            ),
            SizedBox(height:10),
            
            GestureDetector(
              
          onTap: () {
             setState(() {
                   
                  if (questionIndex <= 0) {
                    // Vous avez atteint la fin du questionnaire, vous pouvez ajouter la logique finale ici
                    // par exemple, afficher un message de fin, réinitialiser le questionnaire, etc.
                    questionIndex = 0;
                     Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()),);
                    
                  }
                  if (questionIndex >= 1) {
                    // Vous avez atteint la fin du questionnaire, vous pouvez ajouter la logique finale ici
                    // par exemple, afficher un message de fin, réinitialiser le questionnaire, etc.
                   questionIndex--;
                    
                  }
           
          });
            // Action à effectuer lors du clic
            
          },
          
          child: 
          Align(
            alignment: Alignment.topLeft,
            child :Text(
            '< Retour',
            style: TextStyle(
              fontSize: 22,
              decoration: TextDecoration.underline,
              color: Colors.white,
            ),
            
          ),
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
  final String texte;
  

  RectangleButton({required this.onPressed ,required this.texte});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed, 
      
      child: Container(
        width: 380.0,
        height: 80.0,
        
        child: Row(
          
              children: [
                SizedBox(width: 5.0),
                Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(15.0), // Ajustez le padding du texte selon vos besoins
                child: Text(
                  texte,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
                // Espacement entre l'image et le texte
                
                SizedBox(width: 35.0),
          
              ],
            ),
      
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 84, 82, 82),
          borderRadius: BorderRadius.circular(12.0),
        ),
        
      ),
    );
  }
}
