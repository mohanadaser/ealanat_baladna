// ignore_for_file: deprecated_member_use

import 'package:ealanat_baladna/views/Masrofy/masrofy_screen.dart';
import 'package:ealanat_baladna/views/Tic_Tac_Toe/login_game.dart';
import 'package:ealanat_baladna/views/chatBot/chat_bot.dart';
import 'package:ealanat_baladna/views/user_panel/home_screen.dart';
import 'package:ealanat_baladna/widgets/banner_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:url_launcher/url_launcher_string.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

//===============================تحميل وتشغيل الواتساب=============================
  void launchWhatsapp(
    String phone,
    String message,
  ) async {
    final url = 'https://wa.me/+20$phone?text=$message';

    await launchUrlString(
      url,
      mode: LaunchMode.externalApplication,
    );
  }

//==============================================================================
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: HexColor("00253F"),
        //======black nearly color
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: Get.height * 0.01),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  child: const BannerScreen(),
                ),
                Column(
                  children: [
                    //================================الصفحه الرئيسيه=====================
                    GestureDetector(
                      onTap: () {
                        Get.off(() => const HomeScreen());
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        padding: const EdgeInsets.all(8.0),
                        height: Get.height * 0.1,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            HexColor("00B2E7"),
                            HexColor("E064F7"),
                            HexColor("FF8D6C")
                          ]),
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.home,
                              size: 50,
                              color: Colors.white,
                            ),
                            const Spacer(),
                            Text(
                              "عروض بلدنا".tr,
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    //==========================================لعبة تيك تاك توى=======================
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const LoginGame());
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        padding: const EdgeInsets.all(8.0),
                        height: Get.height * 0.1,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            HexColor("00B2E7"),
                            HexColor("E064F7"),
                            HexColor("FF8D6C")
                          ]),
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              FontAwesomeIcons.xbox,
                              size: 50,
                              color: Colors.white,
                            ),
                            const Spacer(),
                            Text(
                              "tic tac toe".tr,
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //=============================================شات جى بى تى===================================
                    const SizedBox(
                      height: 10.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const ChatBot());
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        padding: const EdgeInsets.all(8.0),
                        height: Get.height * 0.1,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            HexColor("00B2E7"),
                            HexColor("E064F7"),
                            HexColor("FF8D6C")
                          ]),
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
                              "Chat With GPT",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //====================================Masrofaty=====================================
                    const SizedBox(
                      height: 10.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const MasrofyScreen());
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        padding: const EdgeInsets.all(8.0),
                        height: Get.height * 0.1,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            HexColor("00B2E7"),
                            HexColor("E064F7"),
                            HexColor("FF8D6C")
                          ]),
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/animations/masrofaty.png',
                              color: Colors.white,
                            ),
                            const Spacer(),
                            Text(
                              "مصروفاتى".tr,
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        launchUrlString('https://wa.me/+201556997194');
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        padding: const EdgeInsets.all(8.0),
                        height: Get.height * 0.1,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            HexColor("00B2E7"),
                            HexColor("E064F7"),
                            HexColor("FF8D6C")
                          ]),
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/animations/watsapp.png',
                              color: Colors.white,
                            ),
                            const Spacer(),
                            Text(
                              "تواصل معنا".tr,
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
