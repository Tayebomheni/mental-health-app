import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// ignore: depend_on_referenced_packages
import 'package:ttoui/resultat.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RateAppScreen(),
    );
  }
}

class RateAppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 53, 53, 54),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Evaluez notre App !',
              style: TextStyle(color: Colors.white,fontSize: 40.0, // Changer la taille de la police ici
                 fontWeight: FontWeight.bold,),
                 
            ),
            SizedBox(height: 60),
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Color.fromARGB(255, 133, 30, 198),
              ),
              onRatingUpdate: (rating) {
                // You can use the rating value as needed
                print(rating);
              },
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
              

               Navigator.push(context, MaterialPageRoute(builder: (context) => resultat()),);

              },
              child:Text('Envoyer', style: TextStyle(color: const Color.fromARGB(255, 241, 235, 235),fontSize: 20,fontWeight: FontWeight.bold),),
              style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 133, 30, 198), 
            padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 40.0),// Changer la couleur de fond du bouton ici
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0), // Ajustez le rayon pour arrondir les coins
            ),
          ),
            ),
          SizedBox(height: 300,),
          
            
            GestureDetector(
              
          onTap: () {
             // Navigator.push(context, MaterialPageRoute(builder: (context) => ResultScreen()),);
            // Action à effectuer lors du clic
                           Navigator.push(context, MaterialPageRoute(builder: (context) => resultat()),);

          },
          
          child: 
          Align(
            alignment: Alignment.topRight,
            child :Text(
            'Echaper     ',
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

class NextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Screen'),
      ),
      body: Center(
        child: Text('This is the next screen.'),
      ),
    );
  }
}
