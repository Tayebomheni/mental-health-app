import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:pcd/resultat.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RateAppScreen extends StatefulWidget {
   const RateAppScreen({super.key});
  @override
  _RateAppScreenState createState() => _RateAppScreenState();
}

class _RateAppScreenState extends State<RateAppScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Evaluez notre App !',
              style: TextStyle(color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,fontSize: 40.0, // Changer la taille de la police ici
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
              

               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => resultat()),);

              },
              child:Text('Envoyer', style: TextStyle(color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
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
              color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
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
