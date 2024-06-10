import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ealanat_baladna/controller/maincontroller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';

class CardProducts extends StatelessWidget {
  final int index;

  const CardProducts({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder<MainController>(
      builder: (MainController ctrl) => Container(
        margin: const EdgeInsets.only(left: 5, right: 5),
        child: Column(
          children: [
            Container(
              width: Get.width,
              height: Get.height * 0.5,
              decoration: BoxDecoration(
                  color: Colors.grey[100],
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
                  Image.network(
                    ctrl.pro[index]["proimg"] ?? "No Image",
                    height: 100,
                  ),
                  Text(
                    ctrl.pro[index]["company"] ?? "=======",
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ctrl.pro[index]["productname"] ?? "=======",
                    style: const TextStyle(fontSize: 22),
                  ),
                  Text(
                    ctrl.pro[index]["productprice"] ?? "==========",
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent),
                  ),
                  Text(ctrl.pro[index]["productdesc"] ?? "=================="),
                  Text(ctrl.pro[index]["addresscompany"]),
                  Text(
                    ctrl.pro[index]["phoncompany"] ?? "=================",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple),
                  ),
                  Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection("products")
                            .snapshots(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          List<dynamic> userlikes =
                              snapshot.data?.docs[index]["likes"] ?? [0, 1];
                          return Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  ctrl.addLikes(
                                      snapshot.data?.docs[index].data());
                                },
                                icon: Icon(Icons.favorite,
                                    color: snapshot.data?.docs[index]["likes"]
                                                .contains(FirebaseAuth.instance
                                                    .currentUser?.uid) ??
                                            false
                                        ? Colors.red
                                        : Colors.grey),
                              ),
                              Text("${userlikes.length}  اعجبنى"),
                              const Spacer(),
                              const Text("اتصال"),
                              IconButton(
                                onPressed: () {
                                  FlutterPhoneDirectCaller.callNumber(
                                      ctrl.pro[index]["phoncompany"]);
                                },
                                icon: const Icon(
                                  Icons.phone,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          );
                        }),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
