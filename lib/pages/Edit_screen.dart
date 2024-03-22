import 'dart:io';

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

getImage() async {
  final ImagePicker picker = ImagePicker();
  final XFile? imagecamera = await picker.pickImage(source: ImageSource.camera);

  if (imagecamera != null) {
    // Récupérer l'utilisateur connecté
    final user = FirebaseAuth.instance.currentUser;
    
    if (user != null) {
      // Une image a été sélectionnée, mettez à jour le fichier et l'état
      file = File(imagecamera.path);

      // Générer un nom de fichier unique basé sur l'horodatage actuel et l'UID de l'utilisateur
      String fileName = DateTime.now().millisecondsSinceEpoch.toString() + '_' + user.uid + '.jpg';
      
      var refstorage = FirebaseStorage.instance.ref().child(fileName);
      await refstorage.putFile(file!);

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
              buildTextField("Full Name", _userNameTextController, false),
              buildTextField("E-mail", _emailTextController, false),
              buildTextField("Password", _passwordTextController, true),
              //buildTextField("Location", "", false),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      // Action à exécuter lorsque le bouton "CANCEL" est pressé
                      Navigator.pop(
                          context); // Ferme l'écran d'édition du profil
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(horizontal: 50),
                      ),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      side: MaterialStateProperty.all<BorderSide>(
                        BorderSide(
                          color: Colors.black,
                          width: 1.5,
                        ),
                      ),
                    ),
                    child: Text(
                      "CANCEL",
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 2.2,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      // Action à exécuter lorsque le bouton "SAVE" est pressé
                      final user = FirebaseAuth.instance.currentUser;
                      if (user != null) {
                        try {
                          // Mettre à jour le nom d'utilisateur
                          await user
                              .updateDisplayName(_userNameTextController.text);

                          // Mettre à jour l'e-mail si l'utilisateur a modifié l'e-mail
                          if (_emailTextController.text != user.email) {
                            await user.verifyBeforeUpdateEmail(
                                _emailTextController.text);
                          }

                          // Mettre à jour le mot de passe si l'utilisateur a saisi un nouveau mot de passe
                          if (_passwordTextController.text.isNotEmpty) {
                            await user
                                .updatePassword(_passwordTextController.text);
                          }

                          // Afficher une boîte de dialogue pour informer l'utilisateur que les modifications ont été enregistrées avec succès
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Modifications enregistrées'),
                                content: Text(
                                    'Vos informations ont été mises à jour avec succès.'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
              context,
              MaterialPageRoute(builder: (BuildContext context) => Parametres()),
                        );
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        } catch (error) {
                          // Gérer les erreurs
                          print(
                              'Erreur lors de la mise à jour du profil : $error');
                          // Afficher un message d'erreur à l'utilisateur
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Erreur'),
                                content: Text(
                                    'Une erreur s\'est produite lors de la mise à jour de votre profil. Veuillez réessayer.'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green),
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
                      "SAVE",
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 2.2,
                        color: Colors.white,
                      ),
                    ),
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
        obscureText: isPasswordTextField ? showPassword : false,
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
                      Icons.remove_red_eye,
                      color: Colors.grey,
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
            )),
      ),
    );
  }
}
