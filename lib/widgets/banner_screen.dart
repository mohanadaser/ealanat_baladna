import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class BannerScreen extends StatelessWidget {
  const BannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * .3,
      child: Stack(
        children: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: Container(
              width: Get.width,
              // height: double.infinity,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    HexColor("8a2be2"),
                    HexColor("000080"),
                    HexColor("101010")
                  ]),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.deepPurple),
              child: Text(
                "تطبيق الاقصر بلدنا يرحب بأعلاناتكم \n يمكنك وضع اعلان لشركتك \nاو مطعمك او عيادتك\n او اى نشاط لك"
                    .tr,
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // Positioned(
          //     left: 10,
          //     bottom: 0,
          //     child: ElevatedButton(
          //         onPressed: () {}, child: const Text("للتواصل معنا"))),
          Positioned(
              right: 16,
              top: 0,
              child: Image.asset(
                "assets/animations/banner _1.png",
                height: 200,
              ))
        ],
      ),
    );
  }
}
