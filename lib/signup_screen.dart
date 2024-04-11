import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pcd/color_utils.dart';
import 'package:pcd/reusable_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();

  // Méthode pour afficher une alerte
  void _showErrorAlert(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Erreur"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK",
              style: TextStyle(color: Colors.black),),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "S'inscrire",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringToColor("CB2B93"),
              hexStringToColor("9546C4"),
              hexStringToColor("5E61F4"),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                reusableTextField(
                  "Nom de l'utilisateur",
                  Icons.person_outline,
                  false,
                  _userNameTextController,
                  errorText: '',
                ),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField(
                  "Email",
                  Icons.person_outline,
                  false,
                  _emailTextController,
                  errorText: '',
                ),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField(
                  "Mot de passe",
                  Icons.lock_outlined,
                  true,
                  _passwordTextController,
                  errorText: '',
                ),
                const SizedBox(
                  height: 20,
                ),
                firebaseUIButton(context, "S'inscrire", () async {
                  try {
                    final credential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: _emailTextController.text,
                      password: _passwordTextController.text,
                    );
                    await credential.user?.updateDisplayName(
                        _userNameTextController.text);
                    Navigator.of(context).pushReplacementNamed("navbar");
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      _showErrorAlert('Le mot de passe est trop faible.');
                    } else if (e.code == 'email-already-in-use') {
                      _showErrorAlert(
                          'Le compte existe déjà pour cet e-mail.');
                    }
                  } catch (e) {
                    print(e);
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
