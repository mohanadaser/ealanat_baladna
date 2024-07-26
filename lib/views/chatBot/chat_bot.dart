import 'dart:convert';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  final url =
      "https://generativelanguage.googleapis.com/v1/models/gemini-pro:generateContent?key=AIzaSyClNhYnUv4MF6eAEbnFZEK9-JDcgtpbVDU";
  final header = {'Content-Type': 'application/json'};

  ChatUser myuser = ChatUser(id: "1", firstName: "you");
  ChatUser bot = ChatUser(id: "2", firstName: "Gemini");
  List<ChatMessage> allmessages = [];
  List<ChatUser> typing = [];
//==========================================get data===================
  getdata(ChatMessage message) async {
    typing.add(bot);
    allmessages.insert(0, message);
    setState(() {});
    var data = {
      "contents": [
        {
          //"role": "user",
          "parts": [
            {"text": message.text}
          ]
        }
      ]
    };
    await http
        .post(Uri.parse(url), headers: header, body: jsonEncode(data))
        .then((value) {
      if (value.statusCode == 200) {
        var result = jsonDecode(value.body);
        ChatMessage m = ChatMessage(
            user: bot,
            createdAt: DateTime.now(),
            text: result['candidates'][0]['content']['parts'][0]['text']);
        allmessages.insert(0, m);
        typing.remove(bot);
        setState(() {});
      } else {
        print("something error");
      }
    }).catchError((err) {});
  }

//=============================================================================
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "اسأل الذكاء الصناعى",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: HexColor("f9d9da"),
        body: DashChat(
          typingUsers: typing,
          currentUser: myuser,
          messages: allmessages,
          onSend: (ChatMessage message) {
            getdata(message);
          },
        ),
      ),
    );
  }
}
