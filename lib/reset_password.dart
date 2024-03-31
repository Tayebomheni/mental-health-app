import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pcd/color_utils.dart';
import 'package:pcd/reusable_widget.dart';
import 'package:pcd/signin_screen.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Réinitialiser le mot de passe",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            hexStringToColor("CB2B93"),
            hexStringToColor("9546C4"),
            hexStringToColor("5E61F4")
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Email", Icons.person_outline, false,
                    _emailTextController, errorText: ''),
                const SizedBox(
                  height: 20,
                ),
                firebaseUIButton(context, "Réinitialiser le mot de passe", () {
                  FirebaseAuth.instance
                      .sendPasswordResetEmail(email: _emailTextController.text);
                      //.then((value) => Navigator.of(context).pop());
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Alerte'),
                        content: Text('Un courriel contenant les instructions pour réinitialiser votre mot de passe a été envoyé. '),
                        actions: <Widget>[
                          TextButton(
                          onPressed: () {
                            // Fermer l'alerte lorsqu'on appuie sur le bouton "OK"
                            Navigator.of(context).pop();

                            // Naviguer vers la page SignInScreen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignInScreen(),
                              ),
                            );
                          },
                          child: Text('OK'),
                        ),
                        ],
                      );
                    },
                  );
                })
              ],
            ),
          ))),
    );
  }
}
