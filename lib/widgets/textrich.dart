// ignore_for_file: use_function_type_syntax_for_parameters

import 'package:flutter/material.dart';

class TextRich extends StatelessWidget {
  const TextRich({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text.rich(TextSpan(children: [
      TextSpan(
          text: "اعلانات",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.amber)),
      WidgetSpan(
        child: SizedBox(width: 5),
      ),
      TextSpan(
          text: "بلدنا",
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple))
    ]));
  }
}
