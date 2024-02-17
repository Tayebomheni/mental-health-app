import 'package:flutter/material.dart';
import 'package:pcd/SplashScreen.dart';
import 'package:firebase_core/firebase_core.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
     options:const FirebaseOptions(
      apiKey: "AIzaSyDK2YzreNUP12J8Axy9IbCX28MzmR1-gwo",
      
      projectId: "signin-b0256",
      appId: "1:792151502069:android:9dbffe8b8be8cd108d69bc",
      messagingSenderId: "792151502069"
  ));
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
