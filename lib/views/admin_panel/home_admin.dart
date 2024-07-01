import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ealanat_baladna/controller/homecontroller.dart';
import 'package:ealanat_baladna/views/admin_panel/add_product.dart';
import 'package:ealanat_baladna/views/admin_panel/edit_product.dart';
import 'package:ealanat_baladna/views/user_panel/home_screen.dart';
import 'package:ealanat_baladna/views/user_panel/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({super.key});

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (HomeController ctrl) => Scaffold(
        appBar: AppBar(
          title: const Text(
            "قائمة المنتجات",
            style: TextStyle(
                color: Colors.deepPurple, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Get.offAll(() => LoginScreen());
            },
            icon: const Icon(Icons.logout),
            color: Colors.red,
          ),
        ),
        body: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("products")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Something went wrong');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return Expanded(
                    child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Get.to(() => EditProduct(
                                oldproname: snapshot.data?.docs[index]
                                    ['productname'],
                                oldphone: snapshot.data?.docs[index]
                                    ['phoncompany'],
                                oldDesc: snapshot.data?.docs[index]
                                    ['productdesc'],
                                oldprice: snapshot.data?.docs[index]
                                    ['productprice'],
                                oldadress: snapshot.data?.docs[index]
                                    ['addresscompany'],
                                proid: snapshot.data?.docs[index]['proid']));
                          },
                          child: ListTile(
                            leading: Image.network(
                              "${snapshot.data?.docs[index]['proimg']}",
                              width: 40,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                            title: Text(
                                "${snapshot.data?.docs[index]['productname']}"),
                            subtitle: RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text:
                                      "${snapshot.data?.docs[index]['company']} - ",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text:
                                      "${snapshot.data?.docs[index]['date_creation']}",
                                  style: const TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold))
                            ])),
                            trailing: IconButton(
                                onPressed: () {
                                  ctrl.deleteproduct(
                                      snapshot.data?.docs[index]['proid'],
                                      snapshot.data?.docs[index]['proimg']);
                                },
                                icon: const Icon(Icons.delete)),
                          ),
                        );
                      },
                    ),
                  );
                }),
            const SizedBox(height: 15),
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      Get.changeTheme(Get.isDarkMode
                          ? ThemeData.light()
                          : ThemeData.dark());
                    },
                    child: const Text("الشركات")),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      Get.to(() => const HomeScreen());
                    },
                    child: const Text("صفحة العملاء"))
              ],
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => const AddProduct());
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
