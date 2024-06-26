import 'package:flutter/material.dart';

import 'package:get/get.dart';

class BannerScreen extends StatelessWidget {
  const BannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * .2,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.deepPurple),
            child: const Text(
              "تطبيق الاقصر جوو يرحب بأعلاناتكم \n يمكنك وضع اعلان لشركتك \nاو مطعمك او عيادتك\nهنا",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
              left: 10,
              bottom: 0,
              child: ElevatedButton(
                  onPressed: () {}, child: const Text("للتواصل معنا"))),
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
