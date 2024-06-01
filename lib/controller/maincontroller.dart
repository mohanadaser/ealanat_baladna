// ignore_for_file: unnecessary_overrides, unused_field

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  List<QueryDocumentSnapshot> data = [];
  List<QueryDocumentSnapshot> pro = [];
  //List<Companies> compamies = [];
  TextEditingController searchtxt = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  bool isLoading = true;

  @override
  void onInit() {
    fetchCompanies();
    fetchProducts();
    super.onInit();
  }

//====================================companies================
  void fetchCompanies() async {
    try {
      QuerySnapshot q =
          await FirebaseFirestore.instance.collection("companies").get();

      await Future.delayed(const Duration(seconds: 1));
      data.addAll(q.docs);
      isLoading = false;
      update();
    } catch (e) {
      print(e.toString());
    }
  }

  //============================products=================
  void fetchProducts() async {
    try {
      QuerySnapshot q =
          await FirebaseFirestore.instance.collection("products").get();

      await Future.delayed(const Duration(seconds: 1));
      pro.addAll(q.docs);
      isLoading = false;
      update();
    } catch (e) {
      print(e.toString());
    }
  }
}
