// ignore_for_file: must_be_immutable

import 'package:ealanat_baladna/views/user_panel/register_screen.dart';
import 'package:ealanat_baladna/widgets/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController phonenum = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(232, 255, 255, 255),
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: Colors.lightBlue,
              width: Get.width,
              child: Lottie.asset("assets/animations/login.json.json"),
            ),
            SizedBox(height: Get.height / 18),
            SizedBox(
              width: Get.width * .9,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomForm(
                    text: "رقم الهاتف",
                     formating:[LengthLimitingTextInputFormatter(11)],
                    type: TextInputType.phone,
                    name: phonenum,
                    sufxicon: const Icon(Icons.phone_android)),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Colors.black)),
              onPressed: () {},
              child: const Text(
                "تسجيل الدخول",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
            TextButton(
                onPressed: () {
                  Get.to(() => RegisterScreen());
                },
                child: const Text("ليس لديك حساب؟ ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )))
           
          ],
        ),
      ),
    );
  }
}
