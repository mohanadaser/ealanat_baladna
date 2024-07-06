import 'package:flutter/material.dart';

class MasrofItem extends StatefulWidget {
  const MasrofItem({super.key});

  @override
  State<MasrofItem> createState() => _MasrofItemState();
}

class _MasrofItemState extends State<MasrofItem> {
  List<String> items = [
    "كهربا",
    "غاز",
    "الماء",
    "ايجار",
    "مواصلات",
    "قروض",
    "اقساط",
    "اكل وشرب",
    "ايجار",
    "صيانه واصلاع",
    "كهربا",
    "مدارس ودروس واعياد"
  ];

  String dropdownValue = "كهربا";

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      isExpanded: true,
      hint: const Text("اختر المصروف"),
      items: items
          .map((e) => DropdownMenuItem(
                value: e,
                child: Text(e),
              ))
          .toList(),
      onChanged: (value) {
        setState(() {
          dropdownValue = value.toString();
        });
      },
    );
  }
}
