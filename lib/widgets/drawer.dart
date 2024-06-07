// ignore_for_file: prefer_const_constructors

import 'package:ealanat_baladna/controller/maincontroller.dart';
import 'package:ealanat_baladna/views/admin_panel/admin_login.dart';
import 'package:ealanat_baladna/views/admin_panel/home_admin.dart';
import 'package:ealanat_baladna/views/user_panel/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

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
                color: Colors.blue,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/animations/sertup.jpg')),
              ),
            );
          }),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Favorites'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Friends'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text('Share'),
            onTap: () {},
          ),
          const ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Request'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('الاعدادات'),
            onTap: () {
              Get.to(() => AdminLogin());
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('العوده للصفحة الرئيسيه'),
            leading: const Icon(Icons.exit_to_app),
            onTap: () {
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}
