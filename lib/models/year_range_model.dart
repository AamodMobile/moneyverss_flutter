class YearRangeModel {
  int? id;
  dynamic? loanTypeId;
  dynamic? status;
  String? title;
  YearRangeModel({
    this.id,
    this.loanTypeId,
    this.status,
    this.title,
  });

  factory YearRangeModel.fromJson(Map<String, dynamic> json) => YearRangeModel(
    id: json["id"],
    loanTypeId: json["loan_type_id"],
    status: json["status"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "loan_type_id": loanTypeId,
    "status": status,
    "title": title,
  };
}