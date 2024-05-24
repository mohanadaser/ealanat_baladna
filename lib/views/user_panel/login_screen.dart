// ignore_for_file: must_be_immutable

import 'package:ealanat_baladna/controller/registercontroller.dart';
import 'package:ealanat_baladna/widgets/components.dart';
import 'package:ealanat_baladna/widgets/otp_txt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController phonenum = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Get.put(RegisterController());
    return GetBuilder<RegisterController>(
      builder: (RegisterController ctrl) => Scaffold(
        backgroundColor: Colors.white,
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
                  child: Form(
                    key: ctrl.formKey,
                    child: CustomForm(
                        validator: (val) {
                          if (val!.length != 11) {
                            return " يجب ادخال رقم التليفون كاملا";
                          }
                          return null;
                        },
                        text: "رقم الهاتف",
                        formating: [LengthLimitingTextInputFormatter(11)],
                        type: TextInputType.phone,
                        name: phonenum,
                        sufxicon: const Icon(Icons.phone_android)),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              OtpText(
                otpController: ctrl.otpController,
                isshow: ctrl.otpisshow,
                onComplete: (otp) {
                  ctrl.otpentered = int.parse(otp);
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Colors.black)),
                onPressed: () {
                  if (ctrl.formKey.currentState!.validate()) {}
                },
                child: Text(
                  ctrl.otpisshow ? "   الدخول" : "ارسال ال otp ",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              // TextButton(
              //     onPressed: () {
              //       Get.to(() => ());
              //     },
              //     child: const Text("ليس لديك حساب؟ ",
              //         style: TextStyle(
              //           fontWeight: FontWeight.bold,
              //         )))
            ],
          ),
        ),
      ),
    );
  }
}
