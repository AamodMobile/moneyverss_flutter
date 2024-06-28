class ContactUsModel {
  int? id;
  String? mobile;
  String? contactUs;
  String? email;
  ContactUsModel({
    this.id,
    this.mobile,
    this.contactUs,
    this.email,
  });

  factory ContactUsModel.fromJson(Map<String, dynamic> json) => ContactUsModel(
    id: json["id"],
    mobile: json["mobile"]??"",
    contactUs: json["contact_us"]??"",
    email: json["email"]??"",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "mobile": mobile,
    "contact_us": contactUs,
    "email": email,
  };
}
