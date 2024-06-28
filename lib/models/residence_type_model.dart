
class ResidenceTypeModel {
  int? id;
  String? title;
  dynamic status;

  ResidenceTypeModel({
    this.id,
    this.title,
    this.status,
  });

  factory ResidenceTypeModel.fromJson(Map<String, dynamic> json) => ResidenceTypeModel(
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
