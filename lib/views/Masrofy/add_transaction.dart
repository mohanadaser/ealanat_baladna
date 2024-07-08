import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/masrofy_controller.dart';
import '../../widgets/components.dart';
import '../../widgets/dropdown_button.dart';

class add_transaction extends StatefulWidget {
  const add_transaction({
    super.key,
  });

  @override
  State<add_transaction> createState() => _add_transactionState();
}

class _add_transactionState extends State<add_transaction> {
  var items = "كهربا";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MasrofyController>(
      builder: (MasrofyController controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("اضافة مصروف",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          const SizedBox(
            width: 15.0,
          ),
          CircleAvatar(
            backgroundColor: Colors.amber,
            radius: 25,
            child: IconButton(
                onPressed: () {
                  Get.dialog(AlertDialog(actions: [
                    const SizedBox(height: 10.0),
                    // CustomForm(
                    //   text: " الاسم",
                    //   type: TextInputType.name,
                    //   name: controller.masrof,
                    // ),
                    const SizedBox(height: 10.0),
                    const MasrofItem(),
                    const SizedBox(height: 10.0),
                    CustomForm(
                      text: " المبلغ",
                      type: TextInputType.number,
                      name: controller.balance,
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
                              Get.back();
                            },
                            child: const Text(
                              "اضافة المصروف",
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
                icon: const Icon(Icons.add)),
          ),
          const SizedBox(
            width: 20.0,
          ),
        ],
      ),
    );
  }
}
