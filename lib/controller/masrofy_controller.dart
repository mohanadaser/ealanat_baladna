// ignore_for_file: avoid_single_cascade_in_expression_statements

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class MasrofyController extends GetxController {
  final TextEditingController credit = TextEditingController();
  final TextEditingController masrof = TextEditingController();
  final TextEditingController amount = TextEditingController();
  final currentuser = FirebaseAuth.instance.currentUser?.uid;
  oninInit() {
    print(currentuser);
    super.onInit();
  }

  @override
  void dispose() {
    credit.dispose();
    masrof.dispose();
    amount.dispose();
    super.dispose();
  }

  void addCredit() async {
     final uuid = const Uuid().v4();
    try {
    
        }

    
      
     catch (e) {
      print(e.toString());
    }
    
  }
}
