// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ealanat_baladna/widgets/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

class EditProduct extends StatefulWidget {
  final String oldproname;
  final String oldphone;
  final String oldDesc;
  final String oldprice;
  final String oldadress;
  final String proid;

  const EditProduct(
      {super.key,
      required this.oldproname,
      required this.oldphone,
      required this.oldDesc,
      required this.oldprice,
      required this.oldadress,
      required this.proid});

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  @override
  void initState() {
    proname.text = widget.oldproname;
    address.text = widget.oldadress;
    phone.text = widget.oldphone;
    desc.text = widget.oldDesc;
    price.text = widget.oldprice;
    super.initState();
  }

  @override
  void dispose() {
    price.dispose();
    proname.dispose();
    phone.dispose();
    desc.dispose();
    address.dispose();
    super.dispose();
  }

  TextEditingController proname = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController price = TextEditingController();

  //=====================================update products=====================

  void updateproducts() async {
    //=========================convert currency to egypt==========
    final number = double.parse(price.text.replaceAll(RegExp(r'[^0-9.]'),''));
    final curency = NumberFormat.currency(locale: 'ar_EG', symbol: 'ج.م.');
    final formattedCurrency = curency.format(number);
//==================================================================================

    try {
      await FirebaseFirestore.instance
          .collection('products')
          .doc(widget.proid)
          .update({
        "productname": proname.text,
        "addresscompany": address.text,
        "phoncompany": phone.text,
        "productdesc": desc.text,
        "productprice": formattedCurrency
      });

      Get.snackbar("Success", "تم التعديل بنجاح",
          backgroundColor: Colors.deepPurple, colorText: Colors.white);
    } on FirebaseException catch (e) {
      Get.snackbar("faild", e.toString(), colorText: Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "تعديل المنتج",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                const SizedBox(height: 10.0),
                CustomForm(text: "", type: TextInputType.name, name: proname),
                const SizedBox(height: 10.0),
                CustomForm(
                  text: "",
                  type: TextInputType.streetAddress,
                  name: address,
                ),
                const SizedBox(height: 10.0),
                CustomForm(text: "", type: TextInputType.phone, name: phone),
                const SizedBox(height: 10.0),
                CustomForm(
                    text: "",
                    type: TextInputType.text,
                    name: desc,
                    maxLines: 3,
                    maxlentgh: 150),
                const SizedBox(height: 10.0),
                CustomForm(text: "", type: TextInputType.number, name: price),
                const SizedBox(height: 20.0),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white),
                    onPressed: () {
                      updateproducts();
                      Get.back();
                    },
                    child: const Text(
                      "تعديل المنتج",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ),
        ));
  }
}
