

class BlogListModel {
  int id;
  String title;
  String image;
  String shortDes;
  String createdAt;

  BlogListModel({
    required this.id,
    required this.title,
    required this.image,
    required this.shortDes,
    required this.createdAt,
  });

  factory BlogListModel.fromJson(Map<String, dynamic> json) => BlogListModel(
    id: json["id"],
    title: json["title"],
    image: json["image"]??"",
    shortDes: json["short_des"],
    createdAt:json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "image": image,
    "short_des": shortDes,
    "created_at": createdAt,
  };
}
