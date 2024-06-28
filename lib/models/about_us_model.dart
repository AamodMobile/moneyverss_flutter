class AboutUs {
  String? title;
  String? heading;
  String? type;
  String? image;
  String? vision;
  String? mission;
  String? valuesDesc;
  String? shortDes;
  String? fullDes;
  String? status;
  AboutUs({
    this.title,
    this.heading,
    this.type,
    this.image,
    this.vision,
    this.mission,
    this.valuesDesc,
    this.shortDes,
    this.fullDes,
    this.status,
  });

  factory AboutUs.fromJson(Map<String, dynamic> json) => AboutUs(
    title: json["title"],
    heading: json["heading"],
    type: json["type"],
    image: json["image"],
    vision: json["vision"],
    mission: json["mission"],
    valuesDesc: json["values_desc"],
    shortDes: json["short_des"],
    fullDes: json["full_des"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "heading": heading,
    "type": type,
    "image": image,
    "vision": vision,
    "mission": mission,
    "values_desc": valuesDesc,
    "short_des": shortDes,
    "full_des": fullDes,
    "status": status,
  };
}
