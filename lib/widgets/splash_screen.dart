// ignore_for_file: sized_box_for_whitespace

import 'dart:async';

import 'package:ealanat_baladna/views/user_panel/login_screen.dart';
import 'package:ealanat_baladna/views/user_panel/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return Scaffold(
      appBar: AppBar(),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Get.updateLocale(const Locale('en'));
                    Get.offAll(() => const RegisterScreen());
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white),
                  child: const Text(
                    "English",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
              ElevatedButton(
                  onPressed: () {
                    //Get.updateLocale(const Locale('ar'));
                    Get.offAll(() => const RegisterScreen());
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white),
                  child: const Text(
                    "العربيه",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
