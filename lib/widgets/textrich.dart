// ignore_for_file: use_function_type_syntax_for_parameters

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class TextRich extends StatelessWidget {
  const TextRich({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: [
        WavyAnimatedText('Luxor Baladna',
            textStyle: const TextStyle(
                color: Colors.amber,
                fontSize: 30,
                fontWeight: FontWeight.bold)),
        // WavyAnimatedText('ترحب بكم',
        //     textStyle: const TextStyle(
        //         color: Colors.amber,
        //         fontSize: 30,
        //         fontWeight: FontWeight.bold)),
      ],
      repeatForever: true,
    );
    // return const Text.rich(TextSpan(children: [
    //   TextSpan(
    //       text: "Luxor",
    //       style: TextStyle(
    //           fontSize: 25, fontWeight: FontWeight.bold, color: Colors.amber)),
    //   WidgetSpan(
    //     child: SizedBox(width: 5),
    //   ),
    //   TextSpan(
    //       text: "Go",
    //       style: TextStyle(
    //           fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white))
    // ]));
  }
}
