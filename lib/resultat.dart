import 'package:flutter/material.dart';
import 'package:pcd/pages/MyHomePage.dart';




class resultat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 53, 53, 54),
      appBar: 
      
      AppBar(
        toolbarHeight: 60,
        backgroundColor: Color.fromARGB(255, 53, 53, 54),
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
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children :[
            Center(
            child:  Container(
            width: 430.0,
            height: 200.0,// Ajuster la hauteur selon vos besoins
             // Espace en haut de la page
            padding: EdgeInsets.zero,//rendre le texte lié a la position de box decoration
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 84, 82, 82),
            border: Border.all(),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child : Center(
            child: Text(
            'result',
            style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
            textAlign: TextAlign.center,
            
          ),
          ),
          
        ),
        
          ),
Text('data')  ,         
      
],
      ),      
    
    );
  }
}

class ResultatScreen extends StatelessWidget {
  final String result;

  ResultatScreen(this.result);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Résultat'),
      ),
      body: Center(
        child: Text(result),
      ),
    );
  }
}







class RectangleButton extends StatelessWidget {
  final VoidCallback onPressed;
  

  RectangleButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 380.0,
        height: 130.0,
        
        child: Row(
          
              children: [
                SizedBox(width: 5.0),
                Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(15.0), // Ajustez le padding du texte selon vos besoins
                child: Text(
                  'Test de dépression',
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
            borderRadius: BorderRadius.circular(12.0), 
            // Ajustez le rayon des coins selon vos besoins
            child: Image.asset(
                  'assets/pp.jfif',
                  width: 150.0, // ajustez la largeur de l'image selon vos besoins
                  height: 100.0, // ajustez la hauteur de l'image selon vos besoins
                  fit: BoxFit.cover,
                  
                ),
          ),
              ],
            ),
      
        decoration: BoxDecoration(
          color:  Color.fromARGB(255, 84, 82, 82),
          borderRadius: BorderRadius.circular(12.0),
        ),
        
      ),
    );
  }
}