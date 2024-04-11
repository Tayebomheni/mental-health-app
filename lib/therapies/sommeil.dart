import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class sommeil extends StatefulWidget {
  const sommeil({super.key});

  @override
  State<sommeil> createState() => _sommeilState();
}

class _sommeilState extends State<sommeil> {
  final videoURL = "https://youtu.be/xZ2a_U5O0M4";
  late YoutubePlayerController _controller;
  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(videoURL);
    _controller = YoutubePlayerController(
      initialVideoId: videoID!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
    super.initState();
  }

  Widget boldText(String boldPart, String normalPart) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: boldPart,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: normalPart,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Le sommeil"),
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
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Sommeil et santé mentale : comment bien les soigner?",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(231, 204, 158, 228))),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Les troubles du sommeil touchent l'ensemble de la population. Selon leurs fréquences, ils peuvent être anodins ou avoir des conséquences sur l'ensemble de notre organisme (troubles cardio-vasculaires, surpoids, obésité) ou sur notre santé mentale, menant même jusqu'à la dépression."),
              SizedBox(
                height: 10,
              ),
              YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
              ),
              SizedBox(
                height: 20,
              ),
              Text("Insomnie et santé mentale :",
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              SizedBox(
                height: 10,
              ),
              Text(
                  "l’insomnie, qui se caractérise par des difficultés à s’endormir ou à rester endormi, est souvent associée à des problèmes de santé mentale tels que la dépressions et l’anxiété. Les troubles du sommeil peuvent également aggraver les symptômes de certaines maladies mentales existantes."),
              SizedBox(
                height: 20,
              ),
              Text("Prévenir l'insomnie :",
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              SizedBox(
                height: 20,
              ),
              Text(
                  "Pour lutter contre l'insomnie, voici quelques stratégies simples que vous pouvez mettre en œuvre :"),
              SizedBox(
                height: 10,
              ),
              boldText("✿", "  Établir une routine de sommeil régulière"),
              SizedBox(
                height: 10,
              ),
              boldText("✿", "  Créer un environnement propice au sommeil "),
              SizedBox(
                height: 10,
              ),
              boldText("✿", "  Éviter les stimulants avant le coucher"),
              SizedBox(
                height: 10,
              ),
              boldText("✿", "  Éviter les écrans électroniques"),
              SizedBox(
                height: 10,
              ),
              boldText("✿", "  Pratiquer la relaxation"),
              SizedBox(
                height: 10,
              ),
              boldText("✿", "  Faire de l'exercice régulièrement"),
              SizedBox(
                height: 10,
              ),
              boldText("✿", "  Gérer le stress et l'anxiété"),
              SizedBox(
                height: 10,
              ),
              boldText("✿", "  Éviter les siestes excessives"),
              SizedBox(
                height: 20,
              ),
              Image(
                image: AssetImage("assets/icons/insomnia.gif"),
                height: 200,
                width: 400,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                  "En mettant en pratique ces stratégies simples, vous pouvez améliorer la qualité de votre sommeil et lutter efficacement contre l'insomnie. Si vos problèmes de sommeil persistent, il est recommandé de consulter un professionnel de la santé pour obtenir des conseils et un soutien supplémentaires."),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
