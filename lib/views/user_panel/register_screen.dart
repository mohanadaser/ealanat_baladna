// ignore_for_file: must_be_immutable

import 'package:ealanat_baladna/widgets/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  TextEditingController phonenum = TextEditingController();
  TextEditingController username = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(232, 255, 255, 255),
        appBar: AppBar(),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "تسجيل حساب جديد",
                  style: TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                SizedBox(
                  width: Get.width * .9,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomForm(
                      validator: (val) {
                          if (val == null || val.isEmpty) {
                            return "يجب ادخال الاسم";
                          }
                          return null;
                        },
                        text: " الاسم ...",
                        type: TextInputType.name,
                        name: username,
                        sufxicon: const Icon(Icons.person)),
                  ),
                ),
                SizedBox(height: Get.height / 18),
                SizedBox(
                  width: Get.width * .9,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomForm(
                      validator: (val) {
                          if (val == null || val.isEmpty) {
                            return "يجب ادخال رقم التليفون";
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
                SizedBox(height: Get.height / 18),
                ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.black)),
                  onPressed: () {},
                  child: const Text(
                    "تسجيل الحساب",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
