import 'package:flutter/material.dart';
import 'package:pcd/pages/Exercices.dart';
import 'package:pcd/pages/Parametres.dart';
import 'package:pcd/pages/Principal.dart';
import 'package:pcd/pages/Therapie.dart';


class navbar extends StatefulWidget {
  @override
  State<navbar> createState() => _navbarState();
}
class _navbarState extends State<navbar> {
  int _selectedIndex = 0;
   bool isDarkMode = false;

  static const List<Widget> _widgetOptions = <Widget>[
    Principal(),
    Therapie(),
    Exercices(),
    Parametres(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Principal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.psychology),
            label: 'Thérapie',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.spa),
            label: 'Exercices',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Paramètres',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
         unselectedItemColor: isDarkMode ? Colors.white : Colors.black,
        backgroundColor: Theme.of(context).colorScheme.primary,
        onTap: _onItemTapped,
      ),
    );
  }
}
