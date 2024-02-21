import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pcd/Widgets/custom_item.dart';
import 'package:pcd/Widgets/forward_button.dart';
import 'package:pcd/Widgets/setting_item.dart';
//import 'package:pcd/Widgets/setting_switch.dart';
import 'package:pcd/pages/Edit_screen.dart';

class Parametres extends StatefulWidget {
  const Parametres({super.key});

  @override
  State<Parametres> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<Parametres> {
  bool isDarkMode = false;
  late User? currentUser;//hold the current user information
  bool _isLoading = false;

 @override
  void initState() {
    super.initState();
    currentUser = FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 133, 30, 198),
      body: Container(
        
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  "Compte",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                     color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Image.asset("assets/icons/avatar.png",
                          width: 70, height: 70),
                      const SizedBox(width: 20),
                       Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            currentUser?.displayName ?? "User Name",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                               color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                               currentUser?.email ?? "Email",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
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
                              builder: (context) => const EditAccountScreen(),
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
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                padding: const EdgeInsets.all(10.0),
                
                color: Color.fromARGB(255, 53, 53, 54),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                
                SettingItem(
                  title: "Avis",
                  icon: Ionicons.star,
                  bgColor: Color.fromARGB(255, 53, 53, 54),
                  iconColor: Colors.orange,
                  onTap: () {},
                ),
                const SizedBox(height: 8),
                SettingItem(
                  title: "Confidentialité",
                  icon: Ionicons.shield_checkmark,
                  bgColor: Color.fromARGB(255, 53, 53, 54),
                  iconColor: Colors.white,
                  onTap: () {},
                ),
                const SizedBox(height: 8),
                /*SettingSwitch(
                  title: "Dark Mode",
                  icon: Ionicons.earth,
                  bgColor: Colors.purple.shade100,
                  iconColor: Colors.purple,
                  value: isDarkMode,
                  onTap: (value) {
                    setState(() {
                      isDarkMode = value;
                    });
                  },
                ),
                const SizedBox(height: 20),*/
                SettingItem(
                  title: "Aide",
                  icon: Ionicons.help,
                  bgColor: Color.fromARGB(255, 53, 53, 54),
                  iconColor: Colors.white,
                  onTap: () {},
                ),
                const SizedBox(height: 8),
                CustomItem(
                  title: "Déconnexion",
                  icon: Ionicons.log_out,
                  backgroundColor:  Color.fromARGB(255, 53, 53, 54),
                  iconColor: Colors.white,
                 onTap: () async {
                    setState(() {
                    _isLoading = true;
                    });
                     try {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushReplacementNamed('signin');
            } catch (e) {
              print("Error during sign out: $e");
            } finally {
              await Future.delayed(Duration(seconds: 3));
              setState(() {
                _isLoading = false;
              });
            }
          
                  },
                  isLoading: _isLoading,
                  ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}