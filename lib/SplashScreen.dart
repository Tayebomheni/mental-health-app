import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pcd/signin_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> 
with SingleTickerProviderStateMixin{//allows us to use duration , animation ...
  
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);//get rid of bottom and top bar
    Future.delayed(Duration(seconds: 3),() {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) =>  SignInScreen()
        ));
    });
  }

@override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays: SystemUiOverlay.values);//display top and bottom bars
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors:[Colors.white,Colors.pink] ,
            begin: Alignment.topRight,
            end:Alignment.bottomLeft,

          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Image.asset(
            "assets/images/logo.jpg",
            height: 100,
            width: 100,
            ),
        SizedBox(height:20),
        Text(
          "ATPPSM",
          style: TextStyle(
            fontSize: 32,
            fontStyle: FontStyle.italic,
            color: Colors.white,
          ),
          )
        ],
        ),
      ),
    );
  }
}