import 'package:ealanat_baladna/widgets/components.dart';
import 'package:flutter/material.dart';
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
      body: Padding(
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
                    text: "رقم الهاتف",
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
    );
  }
}
