

class FaqsModel {
  int? id;
  String? title;
  String? description;

  FaqsModel({
    this.id,
    this.title,
    this.description,
  });

  factory FaqsModel.fromJson(Map<String, dynamic> json) => FaqsModel(
    id: json["id"],
    title: json["title"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
  };
}
