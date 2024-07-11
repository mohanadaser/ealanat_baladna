// ignore_for_file: collection_methods_unrelated_type

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:hexcolor/hexcolor.dart';

import '../user_panel/login_screen.dart';
import 'add_transaction.dart';
import 'balance_screen.dart';

class MasrofyScreen extends StatelessWidget {
  const MasrofyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("0e2f44"),
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Get.offAll(() => const LoginScreen());
              },
              icon: const Icon(
                Icons.login_outlined,
                color: Colors.amber,
              ))
        ],
      ),
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
              // const Divider(
              //   thickness: 4.0,
              //   color: Colors.amber,
              // ),
              SizedBox(
                height: Get.height * .5,
                child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("users")
                        .doc(FirebaseAuth.instance.currentUser?.uid)
                        .collection("transactions")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.separated(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemBuilder: (context, index) => Container(
                                  margin: const EdgeInsets.all(8.0),
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          snapshot.data?.docs[index]
                                              ["masrofitem"],
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                              snapshot.data?.docs[index]
                                                  ["current_date"],
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey)),
                                          const Spacer(),
                                          Text(
                                              "${snapshot.data?.docs[index]["amount"]} EGP",
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.red))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                            separatorBuilder: (context, index) =>
                                const Divider(),
                            itemCount: snapshot.data?.docs.length ?? 0);
                      } else {
                        return const Text("no data yet");
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
