// ignore_for_file: avoid_single_cascade_in_expression_statements

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MasrofyController extends GetxController {
  final TextEditingController credit = TextEditingController();
  final TextEditingController masrof = TextEditingController();
  final TextEditingController balance = TextEditingController();
  final currentuser = FirebaseAuth.instance.currentUser?.uid;
  oninInit() {
    print(currentuser);
    balance.clear();
    super.onInit();
  }

  @override
  void dispose() {
    // credit.dispose();
    // masrof.dispose();
    balance.dispose();
    super.dispose();
  }

  void addbalance() async {
    try {
      //FirebaseFirestore.instance.collection("users").get();
      await FirebaseFirestore.instance
          .collection("users")
          .doc(currentuser)
          .update({
        "current_balance": FieldValue.increment(int.parse(balance.text)),
      });
//update();
      balance.clear();
    } catch (e) {
      print(e.toString());
    }
  }
}
