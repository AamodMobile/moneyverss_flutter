class GoldWeightListModel {
  int? value;
  String? title;

  GoldWeightListModel({
    this.value,
    this.title,
  });

  factory GoldWeightListModel.fromJson(Map<String, dynamic> json) => GoldWeightListModel(
    value: json["value"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "title": title,
  };
}
