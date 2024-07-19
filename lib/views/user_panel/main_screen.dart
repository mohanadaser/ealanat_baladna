import 'package:ealanat_baladna/views/Masrofy/masrofy_screen.dart';
import 'package:ealanat_baladna/views/Tic_Tac_Toe/login_game.dart';
import 'package:ealanat_baladna/views/chatBot/chat_bot.dart';
import 'package:ealanat_baladna/views/user_panel/home_screen.dart';
import 'package:ealanat_baladna/widgets/banner_screen.dart';

import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("f0f8ff"),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(height: Get.height * 0.02),
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
                          const Text(
                            "مصروفاتى",
                            style: TextStyle(
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
    );
  }
}
