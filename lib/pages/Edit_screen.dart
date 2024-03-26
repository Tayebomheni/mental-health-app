import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pcd/pages/Parametres.dart';

class EditAccountScreen extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditAccountScreen> {
  bool showPassword = false;
  File? file;
  late TextEditingController _passwordTextController;
  late TextEditingController _emailTextController;
  late TextEditingController _userNameTextController;

  @override
  void initState() {
    super.initState();
    // Récupérer les informations de l'utilisateur connecté
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      _userNameTextController =
          TextEditingController(text: user.displayName ?? '');
      _emailTextController = TextEditingController(text: user.email ?? '');
    }

    _passwordTextController = TextEditingController();
  }

  // Mettre à jour la méthode getImage comme suit
  Future<void> getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imagecamera =
        await picker.pickImage(source: ImageSource.camera);

    if (imagecamera != null) {
      // Récupérer l'utilisateur connecté
      final user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // Une image a été sélectionnée, mettez à jour le fichier et l'état
        file = File(imagecamera.path);

        // Générer un nom de fichier unique basé sur l'horodatage actuel et l'UID de l'utilisateur
        String fileName =
            DateTime.now().millisecondsSinceEpoch.toString() +
                '_' +
                user.uid +
                '.jpg';

        var refstorage = FirebaseStorage.instance.ref().child(fileName);
        var uploadTask = refstorage.putFile(file!);

        // Attendre que le téléchargement soit terminé
        await uploadTask.whenComplete(() async {
          // Récupérer l'URL de l'image téléchargée
          String imageURL = await refstorage.getDownloadURL();

          // Enregistrer l'URL de l'image dans Firestore
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .update({
            'profileImage': imageURL,
          });
        });

        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 15, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                "Modifier le profil",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0, 10),
                          )
                        ],
                        shape: BoxShape.circle,
                        image: file != null
                            ? DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.file(file!).image,
                              )
                            : DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/icons/avatar.png"),
                              ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () async {
                          // Action à exécuter lorsque l'icône est tapée
                          await getImage();
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: Colors.green,
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              buildTextField("Nom", _userNameTextController, false),
              buildTextField("E-mail", _emailTextController, false),
              buildTextField("Mot de passe", _passwordTextController, true),
              //buildTextField("Location", "", false),
              SizedBox(
                height: 5,
              ),
              Row
(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          // Alerte pour vérifier l'authentification de l'utilisateur 
                          _showPasswordConfirmationDialog(context);
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.symmetric(horizontal: 50),
                          ),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        child: Text(
                          "ENREGISTRER",
                          style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, TextEditingController controller,
      bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        controller: controller,
        obscureText: isPasswordTextField ? !showPassword : false,
        onChanged: (value) {
          setState(() {
            // Mettre à jour la valeur dans le contrôleur de texte
            controller.text = value;
          });
        },
        decoration: InputDecoration(
          suffixIcon: isPasswordTextField
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  icon: Icon(
                    showPassword ? Icons.visibility_off : Icons.remove_red_eye,
                    color: Colors.black,
                  ),
                )
              : null,
          contentPadding: EdgeInsets.only(bottom: 3),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: labelText,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }


  Future<void> _showPasswordConfirmationDialog(BuildContext context) async {
    TextEditingController passwordController = TextEditingController();

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Password'),
          content: TextFormField(
            decoration: InputDecoration(labelText: 'Enter Your Password'),
            obscureText: true,
            controller: passwordController,
          ),
          actions: [
            TextButton(
              onPressed: () async {
                String enteredPassword = passwordController.text.trim();

                // Vérifier le mot de passe
                try {
                  // Demander à l'utilisateur de réauthentifier avec son mot de passe actuel
                  AuthCredential credential = EmailAuthProvider.credential(
                    email: FirebaseAuth.instance.currentUser!.email!,
                    password: enteredPassword,
                  );
                  await FirebaseAuth.instance.currentUser!
                      .reauthenticateWithCredential(credential);

                  // Si la réauthentification réussit, mettre à jour les informations du compte
                  _updateAccountInfo(context);

                  Navigator.pop(context); // Fermer la boîte de dialogue
                } catch (error) {
                  // Si la réauthentification échoue, afficher un message d'erreur
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Incorrect password. Please try again.'),
                    ),
                  );
                }
              },
              child: Text('Confirm'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Fermer la boîte de dialogue
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _updateAccountInfo(BuildContext context) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      // Mettre à jour l'e-mail si un nouvel e-mail est saisi
      if (_emailTextController.text.isNotEmpty &&
          _emailTextController.text != user!.email) {
        await user.verifyBeforeUpdateEmail(_emailTextController.text);
      }

      // Mettre à jour le nom d'utilisateur si un nouveau nom est saisi
      if (_userNameTextController.text.isNotEmpty &&
          _userNameTextController.text != user!.displayName) {
        await user.updateDisplayName(_userNameTextController.text);
      }

      // Mettre à jour le mot de passe si un nouveau mot de passe est saisi
      if (_passwordTextController.text.isNotEmpty) {
        await user!.updatePassword(_passwordTextController.text);
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Account information updated successfully.'),
        ),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to update account information: $error'),
        ),
      );
    }
  }

  @override
  void dispose() {
    _passwordTextController.dispose();
    _emailTextController.dispose();
    _userNameTextController.dispose();
    super.dispose();
  }
}
