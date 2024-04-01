import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class Therapiste extends StatefulWidget {
  @override
  State<Therapiste> createState() => _TherapisteState();
}

class _TherapisteState extends State<Therapiste> {
  CollectionReference message =
      FirebaseFirestore.instance.collection("message");

  TextEditingController _controller1 = TextEditingController();

  TextEditingController _controller2 = TextEditingController();
  String? _validateFields(String? email, String? message) {
    if (email == null || email.isEmpty) {
      return 'Please enter your email';
    }
    if (message == null || message.isEmpty) {
      return 'Please enter your message';
    }
    // Regular expression for email validation
    final RegExp emailRegex = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
      caseSensitive: false,
      multiLine: false,
    );
    if (!emailRegex.hasMatch(email)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parler avec un thérapiste'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(
                  context); // Fermer la page statique et retourner à la page précédente
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(13.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage('assets/parler.png'),
                alignment: Alignment.centerRight,
              ),
              SizedBox(
                height: 40,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  labelText: 'Your email...',
                  border: OutlineInputBorder(),
                ),
                controller: _controller1,

                // Permet à l'utilisateur d'entrer plusieurs lignes
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your message',
                  labelText: 'Message to Therapist...',
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
                controller:
                    _controller2, // Permet à l'utilisateur d'entrer plusieurs lignes
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () async {
                  String? emailError =
                      _validateFields(_controller1.text, _controller2.text);
                  if (emailError == null) {
                    // If email is valid, proceed with sending the message
                    await message.add({
                      'email': _controller1.text,
                      'message': _controller2.text
                    }).then((value) {
                      setState(() {
                        _controller1.clear();
                        _controller2.clear();
                      });
                      print('message added');
                    });
                  } else {
                    // If email is invalid, show error message
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(emailError)),
                    );
                  }
                },
                child: Text('Send Message'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
