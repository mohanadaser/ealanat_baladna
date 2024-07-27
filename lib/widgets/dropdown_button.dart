import 'package:ealanat_baladna/controller/masrofy_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MasrofItem extends StatefulWidget {
  const MasrofItem({super.key});

  @override
  State<MasrofItem> createState() => _MasrofItemState();
}

class _MasrofItemState extends State<MasrofItem> {
  List<String> items = [
    "كهربا",
    "غاز",
    "مياه",
    "ايجار",
    "مواصلات",
    "قروض",
    "اقساط",
    "اكل وشرب",
    "استثمار",
    "صيانه واصلاع",
    "مدارس ودروس واعياد",
    "مصاريف اخرى"
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MasrofyController>(
      builder: (MasrofyController controller) => DropdownButton(
        dropdownColor: Colors.white,
        value: controller.dropdownValue,
        isExpanded: true,
        hint: Text("اختر المصروف".tr),
        items: items
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(e.toString().tr),
                ))
            .toList(),
        onChanged: (value) {
          setState(() {
            controller.dropdownValue = value.toString();
            print(controller.dropdownValue);
          });
        },
      ),
    );
  }
}
