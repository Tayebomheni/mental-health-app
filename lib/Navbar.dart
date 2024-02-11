import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
class navbar extends StatefulWidget {
  const navbar({super.key});

  @override
  State<navbar> createState() => _navbarState();
}

class _navbarState extends State<navbar> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: GNav(
        gap: 8,
        tabs: [
        GButton(icon: Icons.home, text: "Principal"),
        GButton(icon:Icons.favorite_border,text: "Thérapie"),
        GButton(icon:Icons.search,text: "vvv"),
        GButton(icon:Icons.settings,text:"Paramètres"),
      ]),
    );
  }
}