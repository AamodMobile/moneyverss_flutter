class OtherDocModel {
  int index;
  String? name;
  String? id;
  String? number;
  String? image;

  OtherDocModel({
     required this.index,
    this.name,
    this.number,
    this.image,
    this.id,
  });
  factory OtherDocModel.fromJson(Map<String, dynamic> json,int index) => OtherDocModel(
    name: json["name"],
    number: json["number"],
    image: json["image"],
    id: json["_id"],
    index:index,
  );
  Map<String, dynamic> toJson() {
    return {
      'vaccinationName': name,
      'vaccinationDate': number,
      'image': image,
      '_id':id
    };
  }
}