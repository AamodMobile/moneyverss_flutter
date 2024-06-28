class ProductTypeModel {
  int? id;
  String? title;
  dynamic status;


  ProductTypeModel({
    this.id,
    this.title,
    this.status,
  });

  factory ProductTypeModel.fromJson(Map<String, dynamic> json) => ProductTypeModel(
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
