// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:hexcolor/hexcolor.dart';

Widget CustomForm(
        {required String text,
        required TextInputType type,
        final String? Function(String?)? validator,
        final String? Function(String?)? onchange,
        final int? maxLines,
        final int? maxlentgh,
        required TextEditingController name,
        List<TextInputFormatter>? formating,
        Icon? sufxicon}) =>
    TextFormField(
      controller: name,
      onChanged: onchange,
      inputFormatters: formating,
      maxLines: maxLines,
      maxLength: maxlentgh,
      validator: validator,
      keyboardType: type,
      decoration: InputDecoration(
          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(20),
          // ),
          suffixIcon: sufxicon,
          hintText: text,
          filled: true,
          fillColor: HexColor('FFFFFF')),
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
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(10),
        // ),
        suffixIcon: sufxicon,
        hintText: text,
        filled: true,
        fillColor: Colors.white,
      ),
    );
