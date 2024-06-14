import 'package:ealanat_baladna/views/Tic_Tac_Toe/tic_tac_scren.dart';
import 'package:ealanat_baladna/widgets/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginGame extends StatefulWidget {
  const LoginGame({super.key});

  @override
  State<LoginGame> createState() => _LoginGameState();
}

class _LoginGameState extends State<LoginGame> {
  @override
  Widget build(BuildContext context) {
    TextEditingController player1 = TextEditingController();
    TextEditingController player2 = TextEditingController();
    final fkey = GlobalKey<FormState>();

    return Scaffold(
        appBar: AppBar(),
        body: Form(
          key: fkey,
          child: Column(
            children: [
              const Text(
                "Players Login",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 70.0,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: CustomForm(
                    validator: (value) {
                      if (value == null || player1.text.isEmpty) {
                        return "Enter Ur Name";
                      }
                      return null;
                    },
                    text: "Enter Name Player One ",
                    type: TextInputType.name,
                    name: player1),
              ),
              const SizedBox(height: 15.0),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: CustomForm(
                    validator: (value) {
                      if (value == null || player2.text.isEmpty) {
                        return "Enter Ur Name";
                      }
                      return null;
                    },
                    text: "Enter Name Player Two",
                    type: TextInputType.name,
                    name: player2),
              ),
              const SizedBox(
                height: 10.0,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (fkey.currentState!.validate()) {
                      Get.to(() =>
                          TicTacScreen(pl1: player1.text, pl2: player2.text));
                    }
                  },
                  child: const Text("Start Game",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold)))
            ],
          ),
        ));
  }
}
