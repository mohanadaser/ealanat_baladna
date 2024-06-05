import 'package:ealanat_baladna/controller/registercontroller.dart';
import 'package:ealanat_baladna/views/admin_panel/home_admin.dart';
import 'package:ealanat_baladna/widgets/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminLogin extends StatelessWidget {
  const AdminLogin({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RegisterController());
    return GetBuilder<RegisterController>(
        builder: (RegisterController controller) {
      return Scaffold(
          appBar: AppBar(
            title: const Text(
              "خاص بأدارة التطبيق",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          body: Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CustomForm(
                      text: "الاسم",
                      type: TextInputType.name,
                      name: controller.username),
                  const SizedBox(height: 15),
                  CustomForm(
                    text: "الرقم السرى",
                    type: TextInputType.visiblePassword,
                    name: controller.password,
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                      onPressed: () {
                        Get.to(() => const HomeAdmin());
                      },
                      child: const Text("تسجيل",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)))
                ],
              ),
            ),
          ));
    });
  }
}
