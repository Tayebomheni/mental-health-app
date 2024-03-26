import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pcd/color_utils.dart';
import 'package:pcd/reset_password.dart';
import 'package:pcd/reusable_widget.dart';
import 'package:pcd/signup_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  bool _isLoading =
      false; //initialisation de l'état de l'indicateur de changement

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            hexStringToColor("CB2B93"),
            hexStringToColor("9546C4"),
            hexStringToColor("5E61F4")
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              20,
              MediaQuery.of(context).size.height * 0.1,
              20,
              0,
            ),
            child: Column(
              children: <Widget>[
                Image.asset(
                  "assets/icons/logo1.png",
                  fit: BoxFit.fitWidth,
                  width: 240,
                  height: 240,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 30,
                ),
                reusableTextField(
                  "Nom de l'utilisateur",
                  Icons.person_outline,
                  false,
                  _emailTextController,
                ),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField(
                  "Mot de passe",
                  Icons.lock_outline,
                  true,
                  _passwordTextController,
                ),
                const SizedBox(
                  height: 5,
                ),
                forgetPassword(context),
                _isLoading
                    ? CircularProgressIndicator()
                    : firebaseUIButton(context, "Se connecter", () async {
                        //ajouter un boutton se connecter
                        try {
                          setState(() {
                            _isLoading =
                                true; //changement de l'état de l'indicateur de changement
                          });

                          // ignore: unused_local_variable
                          final credential = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                            email: _emailTextController.text,
                            password: _passwordTextController.text,
                          );

                          Navigator.of(context).pushReplacementNamed("navbar");
                          
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            print('No user found for that email.');
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.warning,
                              headerAnimationLoop: false,
                              animType: AnimType.bottomSlide,
                              title: 'Error',
                              desc: 'No user found for that email.',
                              buttonsTextStyle:
                                  const TextStyle(color: Colors.black),
                              showCloseIcon: true,
                            ).show();
                          } else if (e.code == 'wrong-password') {
                            print('Wrong password provided for that user.');
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.warning,
                              headerAnimationLoop: false,
                              animType: AnimType.bottomSlide,
                              title: 'Error',
                              desc: 'Wrong password provided for that user.',
                              buttonsTextStyle:
                                  const TextStyle(color: Colors.black),
                              showCloseIcon: true,
                            ).show();
                          }
                        } finally {
                          await Future.delayed(Duration(
                              seconds: 3)); // Ajout du délai de 3 secondes
                          setState(() {
                            _isLoading = false;
                          });
                        }
                      }),
                signUpOption()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Vous n'avez pas de compte ?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            " S'inscrire",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget forgetPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text(
          "Mot de passe oublié?",
          style: TextStyle(color: Colors.white70),
          textAlign: TextAlign.right,
        ),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => ResetPassword())),
      ),
    );
  }
}
