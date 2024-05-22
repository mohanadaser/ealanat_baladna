// ignore_for_file: avoid_types_as_parameter_names

import 'package:ealanat_baladna/widgets/card_products.dart';
import 'package:ealanat_baladna/widgets/textrich.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(232, 255, 255, 255),
        appBar: AppBar(
          title: const TextRich(),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout),
            color: Colors.red,
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.06,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) => const Padding(
                          padding: EdgeInsets.all(3.0),
                          child: Chip(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            label: Text(
                              "محلات القرش",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            backgroundColor: Colors.deepPurple,
                          ),
                        )),
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: 6),
              ),
              //=================================================menu
              const SizedBox(height: 10.0),
              SizedBox(
                height: Get.height * 0.80,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: 5,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, index) => const CardProducts()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}