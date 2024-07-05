import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthMethod {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // SignUp User

  Future<void> signupUser({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      if (email.isNotEmpty || password.isNotEmpty || name.isNotEmpty) {
        // register user in auth with email and password
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        // add user to your  firestore database
        print(cred.user!.uid);
        await _firestore.collection("users").doc(cred.user!.uid).set({
          'name': name,
          'uid': cred.user!.uid,
          'email': email,
        });

        Get.snackbar("👍", "تم التسجيل بنجاح",
            backgroundColor: Colors.amber, colorText: Colors.red);
      }
    } catch (err) {
      if (err.toString() ==
          "[firebase_auth/email-already-in-use] The email address is already in use by another account.") {
        Get.snackbar("😒", "الايميل مستخدم من قبل",
            backgroundColor: Colors.amber, colorText: Colors.red);
      } else {
        Get.snackbar("😒", err.toString(),
            backgroundColor: Colors.amber, colorText: Colors.red);
      }

      Get.snackbar("😒", "خطأ فى الايميل او الباسوورد",
          backgroundColor: Colors.amber, colorText: Colors.red);
    }
  }

  // logIn user
  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        // logging in user with email and password
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        Get.snackbar("👍", "تم الدخول بنجاح",
            backgroundColor: Colors.amber, colorText: Colors.red);
      } else {
        Get.snackbar("😊", "حاول مره اخرى",
            backgroundColor: Colors.amber, colorText: Colors.red);
      }
    } catch (err) {
      Get.snackbar("😒", err.toString(),
          backgroundColor: Colors.amber, colorText: Colors.red);
    }
  }

  // for sighout
  signOut() async {
    await _auth.signOut();
  }
}
