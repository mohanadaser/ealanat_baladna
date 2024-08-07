// ignore_for_file: prefer_const_constructors

import 'package:ealanat_baladna/controller/maincontroller.dart';
import 'package:ealanat_baladna/views/admin_panel/admin_login.dart';
import 'package:ealanat_baladna/views/user_panel/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          GetBuilder<MainController>(builder: (MainController controller) {
            return UserAccountsDrawerHeader(
              accountName: const Text('مهند عبد الحميد حسانى'),
              accountEmail: const Text('للتواصل واتس اب : 01556997194 '),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.asset(
                    'assets/animations/profile.jpeg',
                    fit: BoxFit.cover,
                    width: 90,
                    height: 90,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/animations/luxor_go.png'))),
            );
          }),

          // ListTile(
          //   leading: Icon(
          //     FontAwesomeIcons.playstation,
          //     color: Colors.black,
          //   ),
          //   title: const Text('لعبة Tic Tac Toe'),
          //   onTap: () {
          //     Get.to(() => LoginGame());
          //   },
          // ),
          ListTile(
              leading: const Icon(Icons.share),
              title: Text('مشاركة تطبيقنا مع الغير'.tr),
              onTap: () {}),
          // ),
          // ListTile(
          //   leading: Icon(Icons.notifications),
          //   title: Text('ارسال الاشعارات'.tr),
          // ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text('الاعدادات'.tr),
            onTap: () {
              Get.offAll(() => AdminLogin());
            },
          ),
          const Divider(),
          ListTile(
            title: Text('العوده للقائمة الرئيسيه'.tr),
            leading: const Icon(Icons.exit_to_app),
            onTap: () {
              Get.to(() => MainScreen());
            },
          ),
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back))
        ],
      ),
    );
  }
}
