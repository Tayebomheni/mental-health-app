import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Exercices extends StatefulWidget {
  const Exercices({super.key});

  @override
  State<Exercices> createState() => _ExercicesState();
}

class _ExercicesState extends State<Exercices> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          await FirebaseAuth.instance.signOut();
          Navigator.of(context).pushReplacementNamed('signin');
        },
        child: Text('Sign Out'),
      ),
    );
  }
}