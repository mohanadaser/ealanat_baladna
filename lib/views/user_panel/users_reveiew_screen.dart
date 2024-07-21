import 'package:ealanat_baladna/widgets/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../controller/reviewcontroller.dart';

class UsersReveiewScreen extends StatelessWidget {
  final String proid;
  const UsersReveiewScreen({super.key, required this.proid});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(Reviewcontroller());
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("اراء المتابعين على المنتج"),
          ),
          backgroundColor: HexColor("eeeeee"),
          body: Container(
            margin: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Add Review",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10.0,
                ),
                RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                const SizedBox(
                  height: 10.0,
                ),
                CustomForm(
                    text: "التعليق",
                    type: TextInputType.text,
                    name: ctrl.reviewfeedback),
                const SizedBox(
                  height: 10.0,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Add",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )),
                //================
              ],
            ),
          )),
    );
  }
}
