import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardProducts extends StatelessWidget {
  const CardProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      margin: const EdgeInsets.only(left: 5, right: 5),
      child: Column(
        children: [
          Container(
            width: Get.width,
            height: Get.height * 0.4,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: const Offset(0, 3))
                ]),
            child: Column(
              children: [
                Image.asset(
                  "assets/animations/jampary.jpg",
                  height: 100,
                ),
                const Text(
                  "اسماك القرش",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "200",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent),
                ),
                const Text("وجبه جمبره+ رز + سلطه+لل 2 فرد"),
                const Text("شارع المدينه المنوره- امام نادى المدينه المنوره"),
                const Text(
                  "ت:01016305317",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ),
                    const Text("44"),
                    const Spacer(),
                    const Text("اتصال"),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.phone,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
