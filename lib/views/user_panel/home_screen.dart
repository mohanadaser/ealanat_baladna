// ignore_for_file: avoid_types_as_parameter_names, unused_local_variable, prefer_const_constructors

import 'package:ealanat_baladna/controller/maincontroller.dart';
import 'package:ealanat_baladna/views/user_panel/login_screen.dart';
import 'package:ealanat_baladna/widgets/card_products.dart';
import 'package:ealanat_baladna/widgets/components.dart';
import 'package:ealanat_baladna/widgets/drawer.dart';
import 'package:ealanat_baladna/widgets/textrich.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GetBuilder<MainController>(
        builder: (MainController controller) {
          return Scaffold(
            key: controller.scaffoldKey,
            drawer: const MyDrawer(),
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: const TextRich(),
              centerTitle: true,
              leading: IconButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Get.offAll(() => const LoginScreen());
                },
                icon: const Icon(Icons.logout),
                color: Colors.red,
              ),
              actions: [
                //====================================drawer=============================
                TextButton(
                    onPressed: () {
                      controller.scaffoldKey.currentState!.openDrawer();
                    },
                    child: Text(
                      "تواصل معنا",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.purple),
                    ))
              ],
            ),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  //==============================Search============================
                  CustomForm(
                      text: "البحث عن محلات ومطاعم وعيادات",
                      type: TextInputType.name,
                      name: controller.searchtxt,
                      sufxicon: const Icon(Icons.search)),
                  SizedBox(
                    height: Get.height * 0.05,
                    //========================companies===================================
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: ((context, index) => Padding(
                              padding: EdgeInsets.all(3.0),
                              child: Chip(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                label: Text(
                                  controller.data[index]["companyname"],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                backgroundColor: Colors.deepPurple,
                              ),
                            )),
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: controller.data.length),
                  ),
                  //=================================================menu=========================
                  const SizedBox(height: 10.0),
                  SizedBox(
                    height: Get.height * 0.75,
                    child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: controller.pro.length,
                        separatorBuilder: (context, index) => const Divider(),
                        itemBuilder: (context, index) =>
                            CardProducts(index: index)),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
