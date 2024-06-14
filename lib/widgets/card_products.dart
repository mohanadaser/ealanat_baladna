import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ealanat_baladna/controller/maincontroller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class CardProducts extends StatefulWidget {
  final int index;

  const CardProducts({super.key, required this.index});

  @override
  State<CardProducts> createState() => _CardProductsState();
}

class _CardProductsState extends State<CardProducts> {
  final TransformationController _transformationController =
      TransformationController();
  TapDownDetails? _doubleTapDetails;
  @override
  Widget build(BuildContext context) {
    void handleDoubleTap() {
      if (_transformationController.value != Matrix4.identity()) {
        _transformationController.value = Matrix4.identity();
      } else {
        final position = _doubleTapDetails!.localPosition;
        // For a 3x zoom
        _transformationController.value = Matrix4.identity()
          ..translate(-position.dx * 2, -position.dy * 2)
          ..scale(3.0);
        // For a 2x zoom
        // ..translate(-position.dx, -position.dy)
        // ..scale(2.0);
      }
    }

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
                    color: HexColor('F5F5F5'),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.7),
                          spreadRadius: 3,
                          blurRadius: 10,
                          offset: const Offset(0, 3))
                    ]),
                child: Column(
                  children: [
                    GestureDetector(
                      onDoubleTapDown: (details) => _doubleTapDetails = details,
                      onDoubleTap: handleDoubleTap,
                      child: InteractiveViewer(
                        transformationController: _transformationController,
                        boundaryMargin: const EdgeInsets.all(
                            80.0), // Margin around the content
                        minScale: 1.0,
                        maxScale: 2.2,
                        child: Image.network(
                          ctrl.pro[widget.index]["proimg"] ?? "No Image",
                          width: 200.0, // Width of the initial image
                          height: 100.0, // Height of the initial image
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Text(
                      ctrl.pro[widget.index]["company"] ?? "=======",
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      ctrl.pro[widget.index]["productname"] ?? "=======",
                      style: const TextStyle(fontSize: 22),
                    ),
                    Text(
                      ctrl.pro[widget.index]["productprice"] ?? "==========",
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(ctrl.pro[widget.index]["productdesc"] ??
                          "=================="),
                    ),
                    Text(ctrl.pro[widget.index]["addresscompany"]),
                    Text(
                      ctrl.pro[widget.index]["phoncompany"] ??
                          "=================",
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
                                snapshot.data?.docs[widget.index]["likes"] ??
                                    [0, 1];
                            return Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    ctrl.addLikes(snapshot
                                        .data?.docs[widget.index]
                                        .data());
                                  },
                                  icon: Icon(Icons.favorite,
                                      color: snapshot.data
                                                  ?.docs[widget.index]["likes"]
                                                  .contains(FirebaseAuth
                                                      .instance
                                                      .currentUser
                                                      ?.uid) ??
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
                                        ctrl.pro[widget.index]["phoncompany"]);
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
          )),
    ));
  }
}
