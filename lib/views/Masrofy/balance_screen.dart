import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ealanat_baladna/controller/masrofy_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../widgets/components.dart';

class BalanceScreen extends StatelessWidget {
  const BalanceScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MasrofyController>(
      builder: (MasrofyController controller) => Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(20.0),
        height: Get.height * .18,
        width: double.infinity,
        decoration: BoxDecoration(
            color: HexColor("000000"),
            borderRadius: BorderRadius.circular(20.0)),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  " رصيدك حاليا",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("credits")
                        .where("userid",
                            isEqualTo: FirebaseAuth.instance.currentUser?.uid)
                        .snapshots(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.data == null) {
                        const Text("${44}" " " "EGP",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white));
                      }
                      var creditdocument =
                          snapshot.data!.docs[0]['credit'] ?? 0;
                      if (snapshot.hasData) {
                        return Text("$creditdocument" " " "EGP",
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white));
                      }
                      return const Text("${44}" " " "EGP");
                    })
              ],
            ),
            const Spacer(),
            CircleAvatar(
              backgroundColor: Colors.cyan,
              radius: 25,
              child: IconButton(
                  onPressed: () {
                    //=============================================alert dialog=============================
                    Get.dialog(AlertDialog(actions: [
                      CustomForm(
                        text: " الرصيد الجديد",
                        type: TextInputType.number,
                        name: controller.credit,
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.deepPurple,
                                  foregroundColor: Colors.white),
                              onPressed: () {
                                controller.addCredit();
                                Get.back();
                              },
                              child: const Text(
                                "اضافة الرصيد",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              )),
                          IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: const Icon(Icons.cancel))
                        ],
                      ),
                    ]));
                  },
                  //====================================================================================================
                  icon: const Icon(Icons.add)),
            )
          ],
        ),
      ),
    );
  }
}
