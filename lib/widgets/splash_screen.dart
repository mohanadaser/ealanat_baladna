// ignore_for_file: sized_box_for_whitespace

import 'dart:async';
import 'dart:collection';

import 'package:ealanat_baladna/views/user_panel/register_screen.dart';
import 'package:ealanat_baladna/widgets/textrich.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Timer(const Duration(seconds: 6), () {
    //   Get.offAll(() => const LoginScreen());
    // });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("00253F"),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: Get.width,
              child: Lottie.asset("assets/animations/logo.json.json"),
            ),
            const SizedBox(
              height: 20,
            ),
            const TextRich(),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Get.updateLocale(const Locale('en'));
                      Get.to(() => const RegisterScreen());
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white),
                    child: const Text(
                      "English",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                ElevatedButton(
                    onPressed: () {
                      //Get.updateLocale(const Locale('ar'));
                      Get.to(() => const RegisterScreen());
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.white),
                    child: const Text(
                      "العربيه",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
