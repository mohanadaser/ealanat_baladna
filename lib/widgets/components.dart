// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget CustomForm(
        {required String text,
        required TextInputType type,
        final String? Function(String?)? validator,
        final String? Function(String?)? onchange,
        final int? maxLines,
        required TextEditingController name,
        List<TextInputFormatter>? formating,
        Icon? sufxicon}) =>
    TextFormField(
      controller: name,
      onChanged: onchange,
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
Widget CustomPass(
        {required String text,
        required TextInputType type,
        final String? Function(String?)? validator,
        required bool issecure,
        required TextEditingController name,
        Icon? sufxicon}) =>
    TextFormField(
      controller: name,
      obscureText: issecure,
      validator: validator,
      keyboardType: type,
      decoration: InputDecoration(
        suffixIcon: sufxicon,
        hintText: text,
        filled: true,
        fillColor: Colors.white,
      ),
    );
