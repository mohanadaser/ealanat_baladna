import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class TicTacScreen extends StatefulWidget {
  final String pl1, pl2;
  const TicTacScreen({super.key, required this.pl1, required this.pl2});

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
      if (forms[row][0] == currentplayer &&
          forms[row][1] == currentplayer &&
          forms[row][1] == currentplayer) {
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
        AwesomeDialog(
            context: context,
            animType: AnimType.rightSlide,
            dialogType: DialogType.success,
            title: winner == "x"
                ? "${widget.pl1}win"
                : winner == "o"
                    ? "${widget.pl2}win"
                    : "win",
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
              height: 120,
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        "turn ",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        currentplayer == "x"
                            ? "${widget.pl1}$currentplayer"
                            : "${widget.pl2}$currentplayer",
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
            const SizedBox(height: 20.0),
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
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
