import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pcd/Widgets/custom_item.dart';
import 'package:pcd/Widgets/forward_button.dart';
import 'package:pcd/Widgets/setting_item.dart';
import 'package:pcd/Widgets/setting_switch.dart';
import 'package:pcd/pages/Aide.dart';
import 'package:pcd/pages/Edit_screen.dart';
import 'package:pcd/pages/confidentialite.dart';
import 'package:pcd/theme/themeprovider.dart';
import 'package:provider/provider.dart';

class Parametres extends StatefulWidget {
  const Parametres({Key? key}) : super(key: key);

  @override
  State<Parametres> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<Parametres> {
  User? currentUser;
  bool _isLoading = false;
  late String? profileImageURL;
   bool isDarkModeEnabled = false;

  @override
  void initState() {
    super.initState();
    profileImageURL = "";
    currentUser = FirebaseAuth.instance.currentUser!;

    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get()
          .then((doc) {
        if (doc.exists) {
          setState(() {
            profileImageURL = doc['profileImage'];
          });
        } else {
          FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .set({
            'profileImage': null,
            'email': user.email,
            'displayName': user.displayName,
          }).then((value) {
            print("User added to Firestore!");
          }).catchError((error) {
            print("Failed to add user: $error");
          });
        }
      });
    }
  }

  Future<void> _showLogoutConfirmationDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: Text('Êtes-vous sûr de vouloir vous déconnecter ?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text('Annuler'),
            ),
            TextButton(
              onPressed: () async {
                setState(() {
                  _isLoading = true;
                });
                try {
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushReplacementNamed('signin');
                } catch (e) {
                  print("Erreur lors de la déconnexion : $e");
                } finally {
                  await Future.delayed(Duration(seconds: 3));
                  setState(() {
                    _isLoading = false;
                  });
                }
              },
              child: Text('Quitter'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  "Compte",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
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
                          image: profileImageURL != null
                              ? DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(profileImageURL!),
                                )
                              : DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("assets/icons/avatar.png"),
                                ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            currentUser?.displayName ?? "Nom d'utilisateur",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            currentUser?.email ?? "Email",
                            style: TextStyle(
                              fontSize: 14,
          
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      ForwardButton(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditAccountScreen(),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Paramètres",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    
                  ),
                ),
                const SizedBox(height: 15),
                Card(
                  elevation: 5.0,
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SettingItem(
                          title: "Avis",
                          icon: Ionicons.star,
                          bgColor: Colors.transparent,
                          iconColor: Colors.amber,
                          onTap: () {},
                        ),
                        const SizedBox(height: 8),
                        SettingItem(
                          title: "Confidentialité",
                          icon: Ionicons.shield_checkmark,
                          bgColor: Colors.transparent,
                          iconColor: Colors.blue,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (BuildContext context) => confidentialite()),
                            );
                          },
                        ),
                        const SizedBox(height: 8),
                       SettingSwitch(
  title: 'Mode Sombre',
  value: isDarkModeEnabled, // Utilisation de la valeur de l'état du thème
  onTap: (value) {
    setState(() {
      // Mettre à jour l'état du thème sombre en fonction de la valeur du switch
      isDarkModeEnabled = value;
      Provider.of<ThemeProvider>(context,listen:false).toggleTheme();
    });
    // Appliquer le thème approprié
    _toggleTheme();
  }, bgColor: Colors.transparent, 
  iconColor: Colors.blue,
   icon: Icons.nightlight_round, // Icône représentant le mode sombre ,
  
  
),



 const SizedBox(height: 8),
                        SettingItem(
                          title: "Aide",
                          icon: Ionicons.help,
                          bgColor: Colors.transparent,
                          iconColor: Colors.lightBlue,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (BuildContext context) => Aide()),
                            );
                          },
                        ),
                        const SizedBox(height: 8),
                        CustomItem(
                          title: "Déconnexion",
                          icon: Ionicons.log_out,
                          backgroundColor: Colors.transparent,
                          iconColor: Colors.red,
                          onTap: () async {
                            await _showLogoutConfirmationDialog();
                          },
                          isLoading: _isLoading,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _toggleTheme() {
  // Utiliser le thème clair si le mode sombre est désactivé, sinon utiliser le thème sombre
  ThemeData selectedTheme = isDarkModeEnabled ? ThemeData.dark() : ThemeData.light();
  
  // Mettre à jour le thème de l'application
  MaterialApp(
    theme: selectedTheme,
    darkTheme: selectedTheme,
    // Autres configurations
  );
}

}
