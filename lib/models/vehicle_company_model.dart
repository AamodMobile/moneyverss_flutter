class VehicleCompanyModel {
  int? id;
  String? title;
  dynamic status;

  VehicleCompanyModel({
    this.id,
    this.title,
    this.status,
  });

  factory VehicleCompanyModel.fromJson(Map<String, dynamic> json) => VehicleCompanyModel(
    id: json["id"],
    title: json["title"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "status": status,
  };
}
