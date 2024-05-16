// ignore_for_file: must_be_immutable

import 'package:ealanat_baladna/controller/homecontroller.dart';
import 'package:ealanat_baladna/views/admin_panel/dropdownlist.dart';
import 'package:ealanat_baladna/widgets/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return GetBuilder<HomeController>(
      builder: (HomeController controller) => Scaffold(
          appBar: AppBar(
            title: const Text(
              "اضافة منتج جديد",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple),
            ),
            centerTitle: true,
          ),
          body: Directionality(
            textDirection: TextDirection.rtl,
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    CustomForm(
                      text: "اكتب اسم المنتج",
                      type: TextInputType.name,
                      name: controller.productname,
                    ),
                    const SizedBox(height: 10.0),
                    CustomForm(
                        text: "العنوان",
                        type: TextInputType.streetAddress,
                        name: controller.addresscompany),
                    const SizedBox(height: 10.0),
                    CustomForm(
                        text: "رقم التليفون",
                        type: TextInputType.phone,
                        name: controller.phoncompany),
                    const SizedBox(height: 10.0),
                    CustomForm(
                        text: "وصف المنتج",
                        type: TextInputType.name,
                        name: controller.productdesc,
                        maxLines: 2),
                    const SizedBox(height: 10.0),
                    CustomForm(
                        text: "سعر المنتج",
                        type: TextInputType.number,
                        name: controller.productprice),
                    const SizedBox(height: 10.0),
                    //======مكان تحميل الصوره
                    controller.imageSelected == null
                        ? SizedBox(height: h * 0.04)
                        : Image.file(controller.imageSelected!,
                            height: h * 0.3, width: w * 0.3),
                    IconButton(
                        onPressed: () {
                          controller.pickedImage();
                        },
                        icon: const Icon(
                          Icons.upload,
                          size: 30,
                        )),
                    const Text("تحميل صورة المنتج"),
                    SizedBox(
                      height: h * 0.05,
                    ),
                    //==================================================
                    const SizedBox(height: 10.0),
                    IconButton(
                        onPressed: () {
                          Get.dialog(AlertDialog(
                            actions: [
                              TextField(
                                controller: controller.companyname,
                                decoration: InputDecoration(
                                    hintText: "اسم الشركه",
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    )),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.deepPurple,
                                          foregroundColor: Colors.white),
                                      onPressed: () {
                                        controller.addCompanies();
                                        Get.back();
                                      },
                                      child: const Text(
                                        "اضافة الشركه",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  IconButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      icon: const Icon(Icons.cancel))
                                ],
                              ),
                            ],
                          ));
                        },
                        icon: const Icon(Icons.add, size: 30)),
                    const Text("اضف شركه"),
                    const SizedBox(height: 10.0),

                    const FirebaseDropdownMenuItem(),

                    const SizedBox(height: 20.0),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple,
                            foregroundColor: Colors.white),
                        onPressed: () {
                          controller.addproduct();
                        },
                        child: const Text(
                          "اضافة المنتج",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
