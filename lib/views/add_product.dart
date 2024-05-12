// ignore_for_file: must_be_immutable

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ealanat_baladna/controller/homecontroller.dart';
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
                        text: "وصف المنتج",
                        type: TextInputType.name,
                        name: controller.productdesc,
                        maxLines: 4),
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
                    const Text("Upload Image"),
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
                    Center(
                        child: DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: const Row(
                        children: [
                          Icon(
                            Icons.add,
                            size: 16,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Expanded(
                            child: Text(
                              'اختر اسم الشركه',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      items: controller.companies
                          .map((String item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                          .toList(),
                      value: controller.selectedValue,
                      onChanged: (String? value) {
                        controller.selectedValue = value;
                        controller.update();
                      },
                    ))),
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
