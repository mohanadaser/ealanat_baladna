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
              child: Form(
                key: controller.keyform,
                child: Column(
                  children: [
                    CustomForm(
                        validator: (Value) {
                          if (Value == null) {
                            return "wrong";
                          }
                          return null;
                        },
                        text: "الاسم",
                        type: TextInputType.name,
                        name: controller.username),
                    const SizedBox(height: 15),
                    CustomForm(
                      validator: (Value) {
                        if (Value == null) {
                          return "wrong";
                        }
                        return null;
                      },
                      text: "الرقم السرى",
                      type: TextInputType.visiblePassword,
                      name: controller.password,
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                        onPressed: () {
                          if (controller.keyform.currentState!.validate()) {
                            controller.loginadmin();
                          }
                        },
                        child: const Text("تسجيل",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)))
                  ],
                ),
              ),
            ),
          ));
    });
  }
}