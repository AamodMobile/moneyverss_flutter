class BlogDetailsModel {
  int id;
  String title;
  String shortDes;
  String description;
  String image;
  String bannerImage;
  dynamic status;
  String createdAt;
  DateTime updatedAt;
  dynamic deletedStatus;

  BlogDetailsModel({
    required this.id,
    required this.title,
    required this.shortDes,
    required this.description,
    required this.image,
    required this.bannerImage,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedStatus,
  });

  factory BlogDetailsModel.fromJson(Map<String, dynamic> json) => BlogDetailsModel(
    id: json["id"],
    title: json["title"],
    shortDes: json["short_des"],
    description: json["description"],
    image: json["image"],
    bannerImage: json["banner_image"],
    status: json["status"],
    createdAt: json["created_at"],
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedStatus: json["deleted_status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "short_des": shortDes,
    "description": description,
    "image": image,
    "banner_image": bannerImage,
    "status": status,
    "created_at": createdAt,
    "updated_at": updatedAt.toIso8601String(),
    "deleted_status": deletedStatus,
  };
}
