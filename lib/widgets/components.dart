// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget CustomForm(
        {required String text,
        required TextInputType type,
        final String? Function(String?)? validator,
        final int? maxLines,
        required TextEditingController name,
       List<TextInputFormatter>? formating,
        Icon? sufxicon}) =>
    TextFormField(
      controller: name,
    inputFormatters: formating,
      maxLines: maxLines,
      validator: validator,
      keyboardType: type,
      decoration: InputDecoration(
        suffixIcon: sufxicon,
        hintText: text,
        filled: true,
        fillColor: Colors.white,
      ),
    );
