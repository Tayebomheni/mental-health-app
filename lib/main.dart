import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pcd/Navbar.dart';
import 'package:pcd/SplashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pcd/signin_screen.dart';
import 'package:pcd/signup_screen.dart';



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

class MyApp extends StatefulWidget{
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirebaseAuth.instance.currentUser ==null ? SplashScreen() : navbar(),
      routes: {"signin":(context)=>SignInScreen(),
      "signup":(context)=>SignUpScreen(),
      "navbar":(context)=>navbar(),
      },
    );
  }
}
