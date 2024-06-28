class BusinessYearModel {
  int? value;
  String? title;
  BusinessYearModel({
    this.value,
    this.title,
  });

  factory BusinessYearModel.fromJson(Map<String, dynamic> json) => BusinessYearModel(
  value: json["value"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "title": title,
  };
}