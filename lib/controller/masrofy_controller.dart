// ignore_for_file: avoid_single_cascade_in_expression_statements

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ealanat_baladna/widgets/dropdown_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MasrofyController extends GetxController {
  String? dropdownValue;
  final TextEditingController amount = TextEditingController();
  final TextEditingController balance = TextEditingController();
  final currentuser = FirebaseAuth.instance.currentUser?.uid;
  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  oninInit() {
    amount.clear();
    dropdownValue == null;
    balance.clear();
    super.onInit();
  }

  @override
  void dispose() {
    amount.dispose();
    balance.dispose();
    super.dispose();
  }

  void addbalance(userid) async {
    try {
      DocumentReference ref =
          FirebaseFirestore.instance.collection("users").doc(userid);

      ref.update({
        "current_balance": FieldValue.increment(int.parse(balance.text)),
      });
      update();
      balance.clear();
    } catch (e) {
      print(e.toString());
    }
  }
//=======================Add transactions==========================================
  void addtransaction() async {
    try {
      if (amount.text.isEmpty || dropdownValue == null) {
        return;
      }
      await FirebaseFirestore.instance
          .collection("users")
          .doc(currentuser)
          .collection("transactions")
          .add({
        "masrofitem": dropdownValue.toString(),
        "current_date": formatter.format(now),
        "amount": int.parse(amount.text)
      });
      amount.clear();
      dropdownValue == null;

      update();
    } catch (e) {
      print(e.toString());
    }
  }
}
