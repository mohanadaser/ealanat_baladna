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
        body: ListView.separated(
          separatorBuilder: (context, index) => const Divider(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return ListTile(
              title: const Text("المنتج"),
              subtitle: const Text("السعر :200"),
              trailing: IconButton(
                  onPressed: () {
                    
                  },
                  icon: const Icon(Icons.delete)),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => AddProduct());
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
