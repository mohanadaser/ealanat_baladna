// ignore_for_file: avoid_single_cascade_in_expression_statements

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MasrofyController extends GetxController {
  final TextEditingController credit = TextEditingController();
  final TextEditingController masrof = TextEditingController();
  final TextEditingController amount = TextEditingController();
  final currentuser = FirebaseAuth.instance.currentUser?.uid;
  oninInit() {
    super.onInit();
  }

  void addCredit() async {
    try {
      // final number = double.parse(credit.text);
      // final curency = NumberFormat.currency(locale: 'ar_EG', symbol: 'ج.م.');
      // var formattedCurrency = curency.format(number);
      //double parsedCurrency = double.parse(formattedCurrency);

      if (credit.text.isNotEmpty) {
        await FirebaseFirestore.instance
            .collection("credits")
            .doc(currentuser)
            .update({
          "credit": FieldValue.increment(int.parse(credit.text)),
        });
        update();
        //   await FirebaseFirestore.instance
        //       .collection("credits")
        //       .doc(currentuser)
        //       .set({"credit": int.parse(credit.text), "userid": currentuser});
        //   update();
        //   // Get.snackbar("success", "تم اضافة الرصيد بنجاح",
        //   //     snackPosition: SnackPosition.TOP,
        //   //     colorText: Colors.white,
        //   //     backgroundColor: Colors.deepPurple);
        credit.clear();
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
