// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ealanat_baladna/controller/reviewcontroller.dart';

import 'package:ealanat_baladna/views/user_panel/main_screen.dart';

import 'package:ealanat_baladna/views/user_panel/register_screen.dart';
import 'package:ealanat_baladna/widgets/components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 
  bool ischecked = false;
  final localstorage = GetStorage();
  bool issecure = true;
  bool isloading = false;
  TextEditingController email = TextEditingController();
  //final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController password = TextEditingController();

//=========================================================================
  @override
  void initState() {
    email.text = localstorage.read("email") ?? "";
    password.text = localstorage.read("password") ?? "";
    ischecked = false;
    isloading = false;
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //==================================login user================
    Future<void> loginUser({
      required String email,
      required String password,
    }) async {
      try {
        if (email.isNotEmpty || password.isNotEmpty) {
          if (ischecked == true) {
            localstorage.write("email", email.trim());
            localstorage.write("password", password.trim());
          }

          isloading = true;
          setState(() {});
          // logging in user with email and password
          await _auth.signInWithEmailAndPassword(
            email: email,
            password: password,
          );
        
          Get.offAll(() => const MainScreen());
          setState(() {});
          isloading = false;
        } else {
          Get.snackbar("😊", "حاول مره اخرى",
              backgroundColor: Colors.white, colorText: Colors.red);
          setState(() {});
          isloading = false;
        }
      } catch (err) {
        Get.snackbar("😒", err.toString(),
            backgroundColor: Colors.white, colorText: Colors.red);
        setState(() {});
        isloading = false;
      }
    }

//==========================================================================================
    return Scaffold(
      //appBar: AppBar(),
      body: SingleChildScrollView(
        child: Stack(children: [
          Container(
            width: Get.width,
            height: Get.height * .5,
            padding: EdgeInsets.only(top: Get.height * .15, left: 15),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              HexColor("8a2be2"),
              HexColor("000080"),
              HexColor("101010")
            ])),
            //child: Lottie.asset("assets/animations/login.json.json"),
            child: const Text(
              "❤ مرحبا بعودتك",
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            margin: EdgeInsets.only(top: Get.height * .3),
            height: Get.height,
            width: Get.width,
            decoration: BoxDecoration(
                color: HexColor("f5f5f5"),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(children: [
                  const SizedBox(
                    height: 30.0,
                  ),
                  CustomForm(
                    text: "ادخل ايميلك",
                    type: TextInputType.emailAddress,
                    name: email,
                    sufxicon: const Icon(Icons.email),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  CustomPass(
                      text: "ادخل كلمة المرور",
                      type: TextInputType.visiblePassword,
                      issecure: issecure,
                      name: password,
                      sufxicon: InkWell(
                        onTap: () {
                          issecure = !issecure;
                          setState(() {});
                        },
                        child: Icon(
                            issecure ? Icons.visibility_off : Icons.visibility),
                      )),
                  const SizedBox(
                    height: 30.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      loginUser(email: email.text, password: password.text);
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              HexColor("8a2be2"),
                              HexColor("000080"),
                              HexColor("101010")
                            ]),
                            borderRadius: BorderRadius.circular(30)),
                        child: isloading
                            ? const Center(child: CircularProgressIndicator())
                            : const Center(
                                child: Text(
                                "تسجيل الدخول",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ))),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    children: [
                      const Text(
                        "تذكرني",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Checkbox(
                          activeColor: HexColor("8a2be2"),
                          checkColor: Colors.white,
                          side: const BorderSide(color: Colors.black),
                          value: ischecked,
                          onChanged: (value) {
                            ischecked = !ischecked;
                            setState(() {});
                          }),
                    ],
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    children: [
                      const Center(
                          child: Text(
                        "ليس لديك حساب؟",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      )),
                      TextButton(
                          onPressed: () {
                            Get.to(() => const RegisterScreen());
                          },
                          child: const Text("تسجيل الحساب",
                              style: TextStyle(fontWeight: FontWeight.bold)))
                    ],
                  ),
                ])),
          )
        ]),
      ),
    );
  }
}
