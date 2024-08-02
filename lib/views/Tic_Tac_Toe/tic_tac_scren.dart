// ignore_for_file: must_be_immutable

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ealanat_baladna/views/Tic_Tac_Toe/login_game.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class TicTacScreen extends StatefulWidget {
  String pl1, pl2;
  TicTacScreen({super.key, required this.pl1, required this.pl2});

  @override
  State<TicTacScreen> createState() => _TicTacScreenState();
}

class _TicTacScreenState extends State<TicTacScreen> {
  late List<List<String>> forms;
  late String currentplayer;
  late String winner;
  late bool gameover;
  @override
  void initState() {
    forms = List.generate(3, (_) => List.generate(3, (_) => ""));
    currentplayer = "x";
    winner = "";
    gameover = false;
    super.initState();
  }

  //reset game=================
  void resetGame() {
    setState(() {
      forms = List.generate(3, (_) => List.generate(3, (_) => ""));
      currentplayer = "x";
      winner = "";
      gameover = false;
    });
  }

  //====moveforms===================
  void makemove(int row, int col) {
    if (forms[row][col] != "" || gameover) {
      return;
    }
    setState(() {
      forms[row][col] = currentplayer;
      if (forms[row][0] == currentplayer &&
          forms[row][1] == currentplayer &&
          forms[row][2] == currentplayer) {
        winner = currentplayer;
        gameover = true;
      } else if (forms[0][col] == currentplayer &&
          forms[1][col] == currentplayer &&
          forms[2][col] == currentplayer) {
        winner = currentplayer;
        gameover = true;
      } else if (forms[0][0] == currentplayer &&
          forms[1][1] == currentplayer &&
          forms[2][2] == currentplayer) {
        winner = currentplayer;
        gameover = true;
      } else if (forms[0][2] == currentplayer &&
          forms[1][1] == currentplayer &&
          forms[2][0] == currentplayer) {
        winner = currentplayer;
        gameover = true;
      }
      currentplayer = currentplayer == "x" ? "o" : "x";
      if (!forms.any((row) => row.any((cell) => cell == ""))) {
        gameover = true;
        winner = "TieToc";
      }
      if (winner != "") {
        // Get.snackbar(
        //     snackStyle: SnackStyle.FLOATING,
        //     duration: const Duration(seconds: 5),
        //     "Congrats!",
        //     winner == "الحمد لله"
        //         ? "ًWinner is ${widget.pl1}"
        //         : winner == "الله اكبر"
        //             ? "Winner is ${widget.pl2} "
        //             : "No Winner  ",
        //     backgroundColor: Colors.deepPurple,
        //     colorText: Colors.white);
        AwesomeDialog(
            context: context,
            animType: AnimType.bottomSlide,
            dialogType: DialogType.success,
            title: winner == "x"
                ? "${widget.pl1} مبرووووووك "
                : winner == "o"
                    ? "${widget.pl2} مبرووووك "
                    : "No One",
            btnOkText: "Play Again",
            btnOkOnPress: () {
              resetGame();
            }).show();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            SizedBox(
              height: 100,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "turn is : ",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        currentplayer == "x"
                            ? "${widget.pl1} ($currentplayer)"
                            : "${widget.pl2} ($currentplayer)",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: currentplayer == "x"
                                ? Colors.red
                                : Colors.green),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0)
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemCount: 9,
                itemBuilder: (context, index) {
                  int row = index ~/ 3;
                  int col = index % 3;
                  return GestureDetector(
                    onTap: () {
                      makemove(row, col);
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: HexColor('1f2937'),
                      ),
                      child: Center(
                        child: Text(forms[row][col],
                            style: TextStyle(
                                fontSize: 75,
                                fontWeight: FontWeight.bold,
                                color: forms[row][col] == "x"
                                    ? Colors.red
                                    : Colors.green)),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {
                      resetGame();
                    },
                    child: const Text("ResetGame",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white))),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple),
                    onPressed: () {
                      Get.off(() => const LoginGame());
                      widget.pl1 = "";
                      widget.pl2 = "";
                    },
                    child: const Text("Start Game",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)))
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextButton(
                onPressed: () {
                  navigator?.pop(context);
                },
                child: const Text(
                  "الرجوع الى الصفحه الرئيسيه",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}
