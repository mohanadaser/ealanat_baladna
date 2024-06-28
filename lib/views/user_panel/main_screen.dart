import 'package:ealanat_baladna/widgets/banner_screen.dart';

import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(5.0),
              child: const BannerScreen(),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  //=====================================================
                  Container(
                    margin: const EdgeInsets.all(5.0),
                    padding: const EdgeInsets.all(8.0),
                    height: Get.height * 0.1,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.home,
                          size: 50,
                          color: Colors.white,
                        ),
                        Spacer(),
                        Text(
                          "  الصفحة الرئيسيه",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  //=================================================================
                  Container(
                    margin: const EdgeInsets.all(5.0),
                    padding: const EdgeInsets.all(8.0),
                    height: Get.height * 0.1,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.xbox,
                          size: 50,
                          color: Colors.white,
                        ),
                        Spacer(),
                        Text(
                          "tic tac toe لعبة ",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  //================================================================================
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    margin: const EdgeInsets.all(5.0),
                    padding: const EdgeInsets.all(8.0),
                    height: Get.height * 0.1,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/animations/OPENAI.png',
                          color: Colors.white,
                        ),
                        const Spacer(),
                        const Text(
                          "chat with Ai",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  //=========================================================================
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
