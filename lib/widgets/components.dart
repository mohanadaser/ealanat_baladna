// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

Widget CustomForm(
        {required String text,
        required TextInputType type,
        final String? Function(String?)? validator,
        final int? maxLines,
        required TextEditingController name}) =>
    TextFormField(
      controller: name,
      maxLines: maxLines,
      validator: validator,
      keyboardType: type,
      decoration: InputDecoration(
          hintText: text,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          )),
    );
