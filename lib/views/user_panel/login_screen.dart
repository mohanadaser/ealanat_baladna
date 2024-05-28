// ignore_for_file: must_be_immutable

import 'package:ealanat_baladna/controller/registercontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  //TextEditingController phonenum = TextEditingController();

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
              const Text(
                "👋  مرحبا بك",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: Get.height / 18),
              Container(
                margin: const EdgeInsets.all(15),
                child: MaterialButton(
                  onPressed: () {
                    
                    ctrl.signInWithGoogle();
                  },
                  height: 50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  color: Colors.black,
                  textColor: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(
                        image: AssetImage("assets/animations/google.png"),
                        height: 30,
                        fit: BoxFit.cover,
                      ),
                      ctrl.isloading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text(
                              "تسجيل الدخول بواسطة حساب",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                      const SizedBox(width: 5),
                    ],
                  ),
                ),
              ),
              // SizedBox(
              //   width: Get.width * .9,
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Form(
              //       key: ctrl.formKey,
              //       child: CustomForm(
              //           validator: (val) {
              //             if (val!.length != 11) {
              //               return " يجب ادخال رقم التليفون كاملا";
              //             }
              //             return null;
              //           },
              //           text: "رقم الهاتف",
              //           formating: [LengthLimitingTextInputFormatter(11)],
              //           type: TextInputType.phone,
              //           name: phonenum,
              //           sufxicon: const Icon(Icons.phone_android)),
              //     ),
              //   ),
              // ),
              // const SizedBox(height: 10),
              // OtpText(
              //   otpController: ctrl.otpController,
              //   isshow: ctrl.otpisshow,
              //   onComplete: (otp) {
              //     ctrl.otpentered = int.parse(otp);
              //   },
              // ),
              // const SizedBox(height: 20),
              // ElevatedButton(
              //   style: const ButtonStyle(
              //       backgroundColor:
              //           MaterialStatePropertyAll<Color>(Colors.black)),
              //   onPressed: () {
              //     if (ctrl.formKey.currentState!.validate()) {
              //       if (ctrl.otpisshow) {
              //         ctrl.loginWithOtp(otp: ctrl.otpController.text);
              //       } else {
              //         ctrl.sentOtp(phone: ctrl.otpController.text);
              //       }
              //     }
              //   },
              //   child: Text(
              //     ctrl.otpisshow ? "   الدخول" : "ارسال ال otp ",
              //     style: const TextStyle(
              //         color: Colors.white,
              //         fontWeight: FontWeight.bold,
              //         fontSize: 18),
              //   ),
              // ),
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
