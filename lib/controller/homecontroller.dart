import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class HomeController extends GetxController {
  TextEditingController productname = TextEditingController();
  TextEditingController productdesc = TextEditingController();
 TextEditingController companyname = TextEditingController();
  TextEditingController productprice = TextEditingController();
  List<String> companies = ['محل 3', 'محل 2', 'محل 1'];
  String? selectedValue;
  File? imageSelected;
  @override
  // ignore: unnecessary_overrides
  void onInit() {
    super.onInit();
  }

  void addproduct() async {
    final uuid = const Uuid().v4();
    final ref = FirebaseStorage.instance.ref().child("proimg").child(uuid);
    await ref.putFile(imageSelected!);
    final imageurl = await ref.getDownloadURL();
    try {
      await FirebaseFirestore.instance.collection("products").doc(uuid).set({
        "proid": uuid,
        "productname": productname.text,
        "productdesc": productdesc.text,
        "proimg": imageurl,
        "productprice": double.parse(productprice.text),
        "company": selectedValue,
        "date_creation": DateTime.now()
      });

      Get.snackbar("Success", "تم الحفظ بنجاح",
          backgroundColor: Colors.deepPurple, colorText: Colors.white);
      clearcontent();
      update();
    } on FirebaseException catch (e) {
      Get.snackbar("faild", e.toString(), colorText: Colors.red);
    }
  }

  void pickedImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ['jpg', 'pdf', 'doc']);

    if (result == null) {
      print("No file selected");
    } else {
      imageSelected = File(result.files.single.path ?? "");
      update();
    }
  }

  void clearcontent() {
    productname.clear();
    productdesc.clear();
    productprice.clear();
    imageSelected = null;
    selectedValue = null;
  }
}
