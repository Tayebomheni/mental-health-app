import 'package:flutter/material.dart';

import 'apprendre.dart';

void main() {
  runApp(info());
}

class info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: sinformer1(),
    );
  }
}

class sinformer1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     final List<dynamic> donnees = ModalRoute.of(context)!.settings.arguments as List<dynamic>;
     final String text= donnees[0] as String;
     final String image= donnees[1] as String;
     
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 53, 53, 54),
      
      appBar: 
      
      AppBar(
        toolbarHeight: 60,
        backgroundColor: Color.fromARGB(255, 53, 53, 54),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            
             Navigator.push(context, MaterialPageRoute(builder: (context) => Apprentissage()),);
            
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
            image, // Remplacez par votre URL d'image
           width: 300,
           height: 400,
            
         ),
             
            SizedBox(height: 20),
             Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
              text,
              style: TextStyle(color :Colors.white,fontSize: 18,),
              textAlign: TextAlign.left,
              
            ),),
                ),
                SizedBox(height: 20.0),
               
                SizedBox(height: 60,)
                
             
          
          ],
        ),
      ),
        ],
      ),
      ),
     
    );
  }
}

