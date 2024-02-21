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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Compte",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
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
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Uranus Code",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Youtube Channel",
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
                  ),
                ),
                const SizedBox(height: 20),
                SettingItem(
                  title: "Avis",
                  icon: Ionicons.star,
                  bgColor: Colors.orange.shade100,
                  iconColor: Colors.orange,
                  onTap: () {},
                ),
                const SizedBox(height: 20),
                SettingItem(
                  title: "Confidentialité",
                  icon: Ionicons.shield_checkmark,
                  bgColor: Colors.blue.shade100,
                  iconColor: Colors.blue,
                  onTap: () {},
                ),
                const SizedBox(height: 20),
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
                  bgColor: Colors.red.shade100,
                  iconColor: Colors.red,
                  onTap: () {},
                ),
                const SizedBox(height: 20),
                CustomItem(
                  title: "Déconnexion",
                  icon: Ionicons.log_out,
                  backgroundColor:  Colors.red.shade100,
                  iconColor: Colors.red,
                 onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushReplacementNamed('signin');
                  },
                ),
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}
