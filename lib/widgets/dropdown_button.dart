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
    "مياه",
    "ايجار",
    "مواصلات",
    "قروض",
    "اقساط",
    "اكل وشرب",
    "ايجار",
    "صيانه واصلاع",
    "كهربا",
    "مدارس ودروس واعياد",
    "مصاريف اخرى"
  ];

  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      dropdownColor: Colors.white,
      value: dropdownValue,
      isExpanded: true,
      hint: const Text("اختر المصروف"),
      items: items
          .map((e) => DropdownMenuItem(
                value: e,
                child: Text(e.toString()),
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
