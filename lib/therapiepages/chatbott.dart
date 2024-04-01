import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:pcd/therapiepages/Messages.dart';

class BOT extends StatefulWidget {
  const BOT({Key? key}) : super(key: key);

  @override
  _BOTstate createState() => _BOTstate();
}

class _BOTstate extends State<BOT> {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> messages = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        title: Text('Mental Health Bot'),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 30),
      ),
      body: Container(
        color: Color.fromARGB(255, 57, 56, 56),
        child: Column(
          children: [
            Expanded(child: MessagesScreen(messages: messages)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              color: Color.fromARGB(255, 67, 53, 91),
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Color.fromRGBO(216, 210, 210, 1),
                    ),
                    width: 290,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0), // Adjust as needed
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: 'Enter text here...',
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(52, 51, 51, 0.856)),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        textAlign: TextAlign.left, // Align text to the left
                      ),
                    ),
                  ),
                  IconButton(
                      alignment: Alignment.topRight,
                      onPressed: () {
                        sendMessage(_controller.text);
                        _controller.clear();
                      },
                      icon: Icon(Icons.send)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  sendMessage(String text) async {
    if (text.isEmpty) {
      print('message is empty');
    } else {
      setState(() {
        addMessage(Message(text: DialogText(text: [text])), true);
      });

      DetectIntentResponse response = await dialogFlowtter.detectIntent(
          queryInput: QueryInput(text: TextInput(text: text)));
      if (response.message == null) return;
      setState(() {
        addMessage(response.message!);
      });
    }
  }

  addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({'message': message, 'isUserMessage': isUserMessage});
  }
}
