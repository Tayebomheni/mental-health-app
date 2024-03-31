import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


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
  final XFile? imageCamera = await picker.pickImage(source: ImageSource.camera);

  if (imageCamera != null) {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString() +
          '_' +
          user.uid +
          '.jpg';

      var refStorage = FirebaseStorage.instance.ref().child(fileName);
      
      // Utiliser une variable locale pour éviter le null check operator sur file
      File? imageFile = File(imageCamera.path);

      var uploadTask = refStorage.putFile(imageFile);

      await uploadTask.whenComplete(() async {
        String imageURL = await refStorage.getDownloadURL();

        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .update({
          'profileImage': imageURL,
        });
      });
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
                                image: FileImage(file!),
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
          title: Text('Confirmation du mot de passe'),
          content: TextFormField(
            decoration: InputDecoration(labelText: 'Entrer votre mot de passe'),
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
    if (_emailTextController.text.isNotEmpty && _emailTextController.text != user!.email) {
      await user.verifyBeforeUpdateEmail(_emailTextController.text);
    }

    // Mettre à jour le nom d'utilisateur si un nouveau nom est saisi
    if (_userNameTextController.text.isNotEmpty && _userNameTextController.text != user!.displayName) {
      await user.updateDisplayName(_userNameTextController.text);
    }

    // Mettre à jour le mot de passe si un nouveau mot de passe est saisi
    if (_passwordTextController.text.isNotEmpty) {
      await user!.updatePassword(_passwordTextController.text);
    }

    // Mettre à jour l'image de profil si un fichier est sélectionné
    if (file != null) {
      String? profileImageURL = await _sauvegarderImageToStorage(file!);
      if (profileImageURL != null) {
        await FirebaseFirestore.instance.collection('users').doc(user?.uid).update({
          'profileImage': profileImageURL,
        });
      }
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Les informations du compte sont mis à jour avec succées'),
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


// Méthode pour sauvegarder l'image dans Firebase Storage et retourner son URL de téléchargement...
  Future<String?> _sauvegarderImageToStorage(File imageFile) async {
    try {
      // Récupérer l'utilisateur connecté
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return null;

      // Générer un nom de fichier unique basé sur l'UID de l'utilisateur
      String fileName = '${user.uid}_${DateTime.now().millisecondsSinceEpoch}.jpg';

      // Référence au répertoire de stockage Firebase
      var refStorage = FirebaseStorage.instance.ref().child(fileName);

      // Télécharger l'image vers Firebase Storage
      await refStorage.putFile(imageFile);

      // Récupérer l'URL de téléchargement de l'image
      String imageURL = await refStorage.getDownloadURL();
      
      return imageURL;
    } catch (error) {
      print('Error uploading image to Firebase Storage: $error');
      return null;
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
