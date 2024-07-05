// ignore_for_file: must_be_immutable

import 'package:ealanat_baladna/views/user_panel/register_screen.dart';
import 'package:ealanat_baladna/widgets/components.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              "👋  مرحبا بك",
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
                      issecure: true,
                      name: password,
                      sufxicon: const Icon(Icons.password)),
                  const SizedBox(
                    height: 30.0,
                  ),
                  GestureDetector(
                    onTap: () {},
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
                        child: const Center(
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
                      const Center(
                          child: Text(
                        "ليس لديك حساب؟",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      )),
                      TextButton(
                          onPressed: () {
                            Get.to(() => RegisterScreen());
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
