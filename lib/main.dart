
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pcd/Navbar.dart';
import 'package:pcd/SplashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pcd/signin_screen.dart';
import 'package:pcd/signup_screen.dart';
import 'package:pcd/theme/theme.dart';
import 'package:pcd/theme/themeprovider.dart';
import 'package:provider/provider.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
     options:const FirebaseOptions(
      apiKey: "AIzaSyDK2YzreNUP12J8Axy9IbCX28MzmR1-gwo",
      projectId: "signin-b0256",
      appId: "1:792151502069:android:9dbffe8b8be8cd108d69bc",
      messagingSenderId: "792151502069",
      storageBucket: "gs://signin-b0256.appspot.com"
  ));
  
 /* await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.playIntegrity,
  );*/
  
  runApp(
    ChangeNotifierProvider(
      create:(context) => ThemeProvider(),
      child: const  MyApp(),
      )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late User? _currentUser;

  @override
  void initState() {
    super.initState();
    _currentUser = FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.themeData == darkMode; // Déduit si le thème est sombre ou non
    return MaterialApp(
      theme: themeProvider.themeData,
      debugShowCheckedModeBanner: false,
      home: _currentUser == null ? SplashScreen() : navbar(isDarkMode: isDarkMode),
      routes: {
        "signin": (context) => SignInScreen(),
        "signup": (context) => SignUpScreen(),
        "navbar": (context) => navbar(isDarkMode: isDarkMode),
      },
    );
  }
}
