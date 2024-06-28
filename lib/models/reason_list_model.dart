class ReasonListModel {
  int? id;
  String? reason;

  ReasonListModel({
    this.id,
    this.reason,
  });

  factory ReasonListModel.fromJson(Map<String, dynamic> json) => ReasonListModel(
        id: json["id"],
        reason: json["reason"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": reason,
      };
}
