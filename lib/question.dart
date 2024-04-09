import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:csv/csv.dart';
import 'dart:io';
import 'package:pcd/pages/MyHomePage.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'rate.dart';

class Questionnaire extends StatefulWidget {
  const Questionnaire({Key? key}) : super(key: key);

  @override
  _QuestionnaireState createState() => _QuestionnaireState();
}

class _QuestionnaireState extends State<Questionnaire> {
  List<List<String>> reponsesutilisateur = [];
  int questionIndex = 0;

  Future<void> writeCSV(List<List<String>> data) async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/responses.csv';

    String csv = const ListToCsvConverter().convert(data);

    await File(filePath).writeAsString(csv);

    print('Fichier CSV créé : $filePath');
    // Upload the file to Firebase Storage
  firebase_storage.Reference storageReference = firebase_storage.FirebaseStorage.instance
      .ref('dossier/responses.csv');
  await storageReference.putFile(File(filePath));

  print('Fichier CSV téléversé vers Firebase Storage avec succès.');
  }

  double calculateRatio(int currentIndex, int totalQuestions) {
    return (currentIndex + 1) / totalQuestions;
  }

  void recordUserResponse(String response, int totalQuestions) {
    reponsesutilisateur.add([response]);
    setState(() {
      if (questionIndex < totalQuestions - 1) {
        questionIndex++;
      } else {
        Future.delayed(Duration(seconds: 1), () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RateAppScreen()),
          );
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> donnees =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final List<String> questions = donnees['liste1'];
    final List<List<String>> reponses = donnees['liste2'];
    final int totalQuestions = questions.length;
    
    
    Future<void> predData(List<List<String>>reponsesutilisateur) async {
    final interpreter = await Interpreter.fromAsset('predmodel.tflite');
    var input = reponsesutilisateur;
    var output = List.filled(1, 0).reshape([1, 1]);
    interpreter.run(input, output);
    
    this.setState(() {
      
    });
  }

    double ratio = calculateRatio(questionIndex, totalQuestions);

    if (questionIndex >= totalQuestions - 1) {
      print('Liste des réponses de l\'utilisateur : $reponsesutilisateur');
      writeCSV(reponsesutilisateur);
      predData(reponsesutilisateur);
    }
    

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          toolbarHeight: 95,
          automaticallyImplyLeading: false,
          title: Text(
            'Test',
            style: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.background,
          elevation: 0.0,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              LinearPercentIndicator(
                percent: ratio,
                lineHeight: 10.0,
                backgroundColor: Color.fromARGB(255, 217, 119, 244),
                progressColor: const Color.fromARGB(255, 133, 30, 198),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.cancel),
              onPressed: () {
                print('Annuler');
              },
              iconSize: 35,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                questions[questionIndex],
                style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 35),
              Column(
                children: [
                  for (int i = 0; i < reponses[questionIndex].length; i++)
                    RectangleButton(
                      onPressed: () {
                        recordUserResponse(reponses[questionIndex][i], totalQuestions);
                      },
                      texte: reponses[questionIndex][i],
                    ),
                ],
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (questionIndex <= 0) {
                      questionIndex = 0;
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage()),
                      );
                    }
                    if (questionIndex >= 1) {
                      questionIndex--;
                    }
                  });
                },
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '< Retour',
                    style: TextStyle(
                      fontSize: 20,
                      decoration: TextDecoration.underline,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RectangleButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String texte;

  RectangleButton({required this.onPressed, required this.texte});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 380.0,
        height: 80.0,
        child: Row(
          children: [
            SizedBox(width: 5.0),
            Flexible(
              child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    texte,
                    style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 35.0),
          ],
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }
}
