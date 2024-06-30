import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:hexcolor/hexcolor.dart';

import 'add_transaction.dart';
import 'balance_screen.dart';

class MasrofyScreen extends StatelessWidget {
  const MasrofyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("0e2f44"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              const BalanceScreen(),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                "حركة مصروفاتك الشهريه",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const add_transaction(),
              const Divider(
                thickness: 4.0,
                color: Colors.amber,
              ),
              SizedBox(
                height: Get.height * .5,
                child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Container(
                          margin: const EdgeInsets.all(8.0),
                          padding: const EdgeInsets.all(15.0),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("فاتورة كهربا",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: [
                                  Text("20-3-2024",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey)),
                                  Spacer(),
                                  Text("20000 EGP",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red))
                                ],
                              )
                            ],
                          ),
                        ),
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
