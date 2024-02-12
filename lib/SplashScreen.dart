import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pcd/WelcomeScreen.dart';


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
        builder: (_) =>  WelcomeScreen()
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
          Image.network(
            "https://scontent.ftun8-1.fna.fbcdn.net/v/t39.30808-6/302449720_463785412458120_6953622856769465843_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=efb6e6&_nc_ohc=AgPx_T8gYcsAX_xEfIi&_nc_ht=scontent.ftun8-1.fna&oh=00_AfDaX5jXq7NlZfwPonaGQhwTT25vcbDcNS0gp_q5pIKLlw&oe=65CCB29F",
            height: 100,
            width: 100,
            ),
        SizedBox(height:20),
        Text(
          "ATPSM",
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