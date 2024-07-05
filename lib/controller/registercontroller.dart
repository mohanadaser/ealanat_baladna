// ignore_for_file: unrelated_type_equality_checks, unnecessary_overrides

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ealanat_baladna/views/Masrofy/masrofy_screen.dart';
import 'package:ealanat_baladna/views/admin_panel/home_admin.dart';
import 'package:ealanat_baladna/views/user_panel/home_screen.dart';
import 'package:ealanat_baladna/views/user_panel/main_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class RegisterController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    print(FirebaseAuth.instance.currentUser);
  }

  @override
  void dispose() {
    useradmin.dispose();
    passwordAdmin.dispose();
    
    super.dispose();
  }

  TextEditingController useradmin = TextEditingController();
  TextEditingController passwordAdmin = TextEditingController();
  
  // final keyform = GlobalKey<FormState>();
  bool isloading = false;

  //================================Login admin===================
  void loginadmin() async {
    try {
      // if (username.text == "ali" && password.text == "ali123") {
      //   Get.to(() => const HomeAdmin());
      //   username.clear();
      //   password.clear();
      // }
      QuerySnapshot q = await FirebaseFirestore.instance
          .collection("adminusers")
          .where("name", isEqualTo: useradmin.text)
          .where("password", isEqualTo: passwordAdmin.text)
          .get();
      if (q.docs.isNotEmpty) {
        Get.to(() => const HomeAdmin());
        useradmin.clear();
        passwordAdmin.clear();
        update();
      } else {
        Get.snackbar("😉", "اطلع بره لو سمحت ", colorText: Colors.red);
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar("faild", e.toString(), colorText: Colors.red);
    } catch (e) {
      print(e.toString());
    }
  }

  //=====================login users=====================
  // void loginuser() async {
  //   try {
  //     QuerySnapshot q = await FirebaseFirestore.instance
  //         .collection("users")
  //         .where("email", isEqualTo: emailaddress.text)
  //         .where("password", isEqualTo: password.text)
  //         .get();
  //     if (q.docs.isNotEmpty) {
  //       Get.to(() => const MasrofyScreen());
  //       emailaddress.clear();
  //       password.clear();
  //       update();
  //     } else {
  //       Get.snackbar("😉", "خطأ فى الايميل او الباسوورد",
  //           backgroundColor: Colors.amber, colorText: Colors.red);
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     Get.snackbar("faild", e.toString(), colorText: Colors.red);
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

//===========================================Google Sign in=====================
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
        Get.offAll(() => const MainScreen());
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
//=============================================================================================================

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
