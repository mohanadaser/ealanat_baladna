

import 'dart:ffi';

class Products {
  String productname;
  String productdesc;
  String proimg;
  String companyname;
  String dateCreation;
  Array likes;
  int price;

  Products(
      {required this.productname,
      required this.productdesc,
      required this.proimg,
      required this.companyname,
      required this.dateCreation,
      required this.price,
      required this.likes});

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        productname: json["productname"],
        productdesc: json["productdesc"],
        proimg: json["proimg"],
        companyname: json["companyname"],
        dateCreation: json["date_creation"],
        price: json["price"],
        likes: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "productname": productname,
        "productdesc": productdesc,
        "proimg": proimg,
        "companyname": companyname,
        "date_creation": dateCreation,
        "price": price,
        "likes": likes
      };
}
