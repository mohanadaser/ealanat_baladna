import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ealanat_baladna/controller/homecontroller.dart';
import 'package:ealanat_baladna/views/add_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAdmin extends StatelessWidget {
  const HomeAdmin({super.key});

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
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection("products").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              return ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => const Divider(),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.network(
                        "${snapshot.data?.docs[index]['proimg']}"),
                    title: Text("${snapshot.data?.docs[index]['productname']}"),
                    subtitle: Text(
                        "الشركه :${snapshot.data?.docs[index]['company']}"),
                    trailing: IconButton(
                        onPressed: () {
                          ctrl.deleteproduct(
                              snapshot.data?.docs[index]['proid'],
                              snapshot.data?.docs[index]['proimg']);
                        },
                        icon: const Icon(Icons.delete)),
                  );
                },
              );
            }),
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
