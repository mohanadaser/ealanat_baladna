// ignore_for_file: unnecessary_overrides, unused_field, unrelated_type_equality_checks

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
      pro.clear();
      QuerySnapshot q =
          await FirebaseFirestore.instance.collection("products").get();
      pro.addAll(q.docs);
      isLoading = false;
      update();
    } catch (e) {
      print(e.toString());
    }
  }

  //===============================filter companies==========
  filterCompanies(name) async {
    try {
      if (name != null) {
        QuerySnapshot q =
            await FirebaseFirestore.instance.collection("companies").get();

        data.clear();
        update();
        data.addAll(q.docs
            .where((element) => element['companyname'].contains(name))
            .toList());
        update();
      }
    } catch (e) {
      print(e.toString());
    }
  }

  //==========================filter products by company========================
  void filterProductsByCompany(datacomp) async {
    try {
      pro.clear();
      if (datacomp == "الكل") {
        QuerySnapshot q =
            await FirebaseFirestore.instance.collection("products").get();
        pro.addAll(q.docs);
        update();
      } else {
        QuerySnapshot q = await FirebaseFirestore.instance
            .collection("products")
            .where("company", isEqualTo: datacomp)
            .get();
        pro.addAll(q.docs);
        update();
      }
    } catch (e) {
      print(e.toString());
    }
  }
}