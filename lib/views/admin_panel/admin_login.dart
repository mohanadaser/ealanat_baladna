// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:ealanat_baladna/controller/registercontroller.dart';
import 'package:ealanat_baladna/views/user_panel/home_screen.dart';
import 'package:ealanat_baladna/widgets/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class AdminLogin extends StatelessWidget {
  const AdminLogin({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RegisterController());
    return GetBuilder<RegisterController>(
        builder: (RegisterController controller) {
      return Scaffold(
          backgroundColor: HexColor('efeee5'),
          appBar: AppBar(
            backgroundColor: HexColor('efeee5'),
            leading: IconButton(
                onPressed: () {
                  Get.off(() => const HomeScreen());
                },
                icon: const Icon(Icons.arrow_back)),
            title: const Text(
              "خاص بأدارة التطبيق",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          body: Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                //key: controller.keyform,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                        name: controller.useradmin),
                    const SizedBox(height: 15),
                    CustomPass(
                      validator: (Value) {
                        if (Value == null) {
                          return "wrong";
                        }
                        return null;
                      },
                      text: "الرقم السرى",
                      type: TextInputType.visiblePassword,
                      name: controller.passwordAdmin,
                      issecure: true,
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                        onPressed: () {
                          controller.loginadmin();
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
