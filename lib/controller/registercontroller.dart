// ignore_for_file: unrelated_type_equality_checks, unnecessary_overrides

import 'package:ealanat_baladna/views/admin_panel/home_admin.dart';
import 'package:ealanat_baladna/views/user_panel/home_screen.dart';
import 'package:ealanat_baladna/views/user_panel/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class RegisterController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  bool isloading = false;

  Future signInWithGoogle() async {
    // Trigger the authentication flow
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        isloading = false;
        update();
        return;
      }
      isloading = true;
      update();
      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(credential);
      User? user = FirebaseAuth.instance.currentUser;
      String? email = user?.uid;
      if (email == "TyUZKejPZtNHW2rDmGppwmSJHd03") {
        Get.offAll(() => const HomeAdmin());
      } else {
        Get.offAll(() => const HomeScreen());
      }

      isloading = false;
      update();
    } on FirebaseException catch (e) {
      Get.snackbar("firebase faild", e.toString(),
          colorText: Colors.red, backgroundColor: Colors.deepPurple);
    } catch (e) {
      Get.snackbar("something wrong", e.toString(),
          colorText: Colors.red, backgroundColor: Colors.deepPurple);
    }
  }

  

  // TextEditingController phonenum = TextEditingController();
  // TextEditingController username = TextEditingController();
  // TextEditingController otpController = TextEditingController();
  // final formKey = GlobalKey<FormState>();
  // bool otpisshow = false;
  // int? otpsent;
  // int? otpentered;
  // late UserModel userdata;
  // //====================================================
  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // String verifyId = "";
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
  // Future sentOtp({
  //   required String phone,
  // }) async {
  //   await _firebaseAuth
  //       .verifyPhoneNumber(
  //     timeout: const Duration(seconds: 30),
  //     phoneNumber: phone.toString(),
  //     verificationCompleted: (phoneAuthCredential) async {
  //       return;
  //     },
  //     verificationFailed: (error) async {
  //       return;
  //     },
  //     codeSent: (verificationId, forceResendingToken) async {
  //       verifyId = verificationId;
  //       otpisshow = true;
  //       update();
  //     },
  //     codeAutoRetrievalTimeout: (verificationId) async {
  //       return;
  //     },
  //   )
  //       .onError((error, stackTrace) {
  //     // errorStep();
  //   });
  //   update();
  // }

  // //==========================================================================
  // Future loginWithOtp({required String otp}) async {
  //   final cred =
  //       PhoneAuthProvider.credential(verificationId: verifyId, smsCode: otp);

  //   try {
  //     final user = await _firebaseAuth.signInWithCredential(cred);
  //     if (user.user != null) {
  //       return Get.snackbar("Success", "تم الدخول بنجاح",
  //           backgroundColor: Colors.deepPurple, colorText: Colors.white);
  //     } else {
  //       return Get.snackbar("Error", "الرمز الذى ادخلته غير صحيج",
  //           colorText: Colors.red);
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     return e.message.toString();
  //   } catch (e) {
  //     return e.toString();
  //   }
  // }

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
  // clearfields() {
  //   username.clear();
  //   phonenum.clear();
  //   otpisshow = false;
  // }
}
