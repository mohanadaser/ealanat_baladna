import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class Reviewcontroller extends GetxController {
  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  TextEditingController reviewfeedback = TextEditingController();
  final currentuser = FirebaseAuth.instance.currentUser?.uid;
  String username = "";
  double productrating = 0.0;
  @override
  void onInit() {
    currentuser;
    getusername();

    super.onInit();
  }

  @override
  void dispose() {
    reviewfeedback.dispose();
    super.dispose();
  }

  Future<String> getusername() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      return username = userDoc['name'];
    }
    update();
    return "no one";
  }

  //=====================Add Review==========================

  addreview(proid) async {
    try {
      if (reviewfeedback.text.isEmpty) {
        Get.snackbar("لا يمكنك ترك هذا الحقل فارغ", "الرجاء تعبئة هذا الحقل",
            colorText: Colors.red);
      }
      await FirebaseFirestore.instance
          .collection("products")
          .doc(proid)
          .collection("reviews")
          .doc(username)
          .set({
        "feedback": reviewfeedback.text.trim(),
        "rating": productrating.toString(),
        "username": username,
        "createdat": formatter.format(now),
      });
      EasyLoading.dismiss();
      reviewfeedback.clear();
      update();
    } catch (e) {
      Get.snackbar("faild", e.toString(),
          colorText: Colors.red, snackPosition: SnackPosition.BOTTOM);
    }
  }
}
