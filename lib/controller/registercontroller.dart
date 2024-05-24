

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ealanat_baladna/models/users.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field_v2/otp_field_v2.dart';
import 'package:uuid/uuid.dart';

class RegisterController extends GetxController {
  TextEditingController phonenum = TextEditingController();
  TextEditingController username = TextEditingController();
  OtpFieldControllerV2 otpController = OtpFieldControllerV2();
  final formKey = GlobalKey<FormState>();
  bool otpisshow = false;
  int? otpsent;
  int? otpentered;
  late UserModel userdata;
  //====================================================
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

   String verifyId = "";
//=====================================================adduser
  // Future<void> addUser() async {
  //   try {
  //     final uuid = const Uuid().v4();
  //     if (username.text.isEmpty || phonenum.text.isEmpty) {
  //       Get.snackbar("Error", "يجب ملىء الخانات",
  //           colorText: Colors.red, backgroundColor: Colors.blue[200]);
  //       return;
  //     }

  //     if (otpsent == otpentered) {
  //       await FirebaseFirestore.instance.collection("users").doc(uuid).set(
  //           {"uid": uuid, "username": username.text, "phone": phonenum.text});

  //       Get.snackbar("Success", "تم التسجيل بنجاح",
  //           backgroundColor: Colors.deepPurple, colorText: Colors.white);
  //       clearfields();
  //       update();
  //     } else {
  //       Get.snackbar("Error", "الرمز الذى ادخلته غير صحيج",
  //           colorText: Colors.red);
  //     }
  //   } on FirebaseException catch (e) {
  //     Get.snackbar("faild", e.toString(), colorText: Colors.red);
  //   }

  //   update();
  // }
  //======================================================================================= send OTP
  Future sentOtp({
    required int phone,
    required Function errorStep,
    required Function nextStep,
  }) async {
    await _firebaseAuth
        .verifyPhoneNumber(
      timeout: Duration(seconds: 30),
      phoneNumber: phone.toString(),
      verificationCompleted: (phoneAuthCredential) async {
        return;
      },
      verificationFailed: (error) async {
        return;
      },
      codeSent: (verificationId, forceResendingToken) async {
        verifyId = verificationId;
        nextStep();
      },
      codeAutoRetrievalTimeout: (verificationId) async {
        return;
      },
    )
        .onError((error, stackTrace) {
      errorStep();
    });
  }
  //==========================================================================
  

  // sendOtp() {
  //   try {
  //     if (username.text.isEmpty || phonenum.text.isEmpty) {
  //       Get.snackbar("Error", "يجب ملىء الخانات",
  //           colorText: Colors.red, backgroundColor: Colors.blue[200]);
  //       return;
  //     }
  //     final random = Random();
  //     int otp = 1000 + random.nextInt(9000);
  //     print(otp);
  //     otpisshow = true;
  //     update();
  //     otpsent = otp;

  //     Get.snackbar("Success", "تم ارسال الرمز بنجاح",
  //         backgroundColor: Colors.deepPurple, colorText: Colors.white);
  //   } catch (e) {
  //     Get.snackbar("faild", e.toString(), colorText: Colors.red);
  //     update();
  //   }
  // }

  //========================================================================cleartxt
  clearfields() {
    username.clear();
    phonenum.clear();
    otpisshow = false;
  }
}
