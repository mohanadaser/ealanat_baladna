class Companies {
  String companyname;
  String compid;

  Companies({
    required this.companyname,
    required this.compid,
  });

  factory Companies.fromJson(Map<String, dynamic> json) => Companies(
        companyname: json["companyname"],
        compid: json["compid"],
      );

  Map<String, dynamic> toJson() => {
        "companyname": companyname,
        "compid": compid,
      };
}
