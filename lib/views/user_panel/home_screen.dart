// ignore_for_file: avoid_types_as_parameter_names, unused_local_variable, prefer_const_constructors, body_might_complete_normally_nullable, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:ealanat_baladna/controller/maincontroller.dart';
import 'package:ealanat_baladna/views/user_panel/login_screen.dart';

import 'package:ealanat_baladna/widgets/card_products.dart';
import 'package:ealanat_baladna/widgets/components.dart';
import 'package:ealanat_baladna/widgets/drawer.dart';
import 'package:ealanat_baladna/widgets/textrich.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../widgets/companies_filter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey1 = GlobalKey<ScaffoldState>();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GetBuilder<MainController>(
        builder: (MainController controller) {
          return Scaffold(
            key: scaffoldKey1,
            drawer: const MyDrawer(),
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: const TextRich(),
              centerTitle: true,
              leading: IconButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Get.offAll(() => LoginScreen());
                },
                icon: const Icon(Icons.logout),
                color: Colors.red,
              ),
              actions: [
                //====================================drawer=============================
                IconButton(
                  onPressed: () {
                    scaffoldKey1.currentState!.openDrawer();
                  },
                  icon: Icon(Icons.list),
                  color: Colors.white,
                )
                // TextButton(
                //     onPressed: () {
                //       scaffoldKey1.currentState!.openDrawer();
                //     },
                //     child: Text(
                //       "تواصل معنا",
                //       style: TextStyle(
                //           fontWeight: FontWeight.bold, color: Colors.purple),
                //     ))
              ],
            ),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  //==============================Search============================
                  CustomForm(
                      onchange: (Value) {
                        controller.searchCompany(Value);
                      },
                      text: "البحث عن محلات ومطاعم وعيادات",
                      type: TextInputType.name,
                      name: controller.searchtxt,
                      sufxicon: const Icon(Icons.search)),

                  SizedBox(
                    height: Get.height * 0.08,
                    //========================companies===================================
                    child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection("companies")
                            .snapshots(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return const Text('Something went wrong');
                          }
                          // if (snapshot.connectionState ==
                          //     ConnectionState.waiting) {
                          //   return const Center(
                          //       child: CircularProgressIndicator());
                          // }
                          if (snapshot.hasData) {
                            //=====================Search text=================
                            List<DocumentSnapshot> filteredDocuments =
                                snapshot.data!.docs.where((doc) {
                              return doc['companyname']
                                  .contains(controller.searchtxt.text);
                            }).toList();

                            return ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: ((context, index) {
                                  var doc = filteredDocuments[index];
                                  return Padding(
                                    padding: EdgeInsets.all(3.0),
                                    //=======================================filter chips=============
                                    child: CompaniesFilter(doc: doc),
                                  );
                                }),
                                separatorBuilder: (context, index) =>
                                    const Divider(),
                                itemCount: filteredDocuments.length);
                          } else {
                            return Text('No data available');
                          }
                        }),
                  ),
                  //=================================================menu=========================
                  // const SizedBox(height: 10.0),
                  SizedBox(
                    height: Get.height * 0.73,
                    child: RefreshIndicator(
                      onRefresh: () {
                        return controller.refreshProducts();
                      },
                      child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: controller.pro.length,
                          separatorBuilder: (context, index) => const Divider(),
                          itemBuilder: (context, index) => CardProducts(
                              index: index,
                              likes: controller.pro[index]["likes"],
                              proid: controller.pro[index]["proid"])),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
