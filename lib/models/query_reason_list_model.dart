class QueryReasonListModel {
  int? id;
  String? reason;

  QueryReasonListModel({
    this.id,
    this.reason,
  });

  factory QueryReasonListModel.fromJson(Map<String, dynamic> json) => QueryReasonListModel(
    id: json["id"],
    reason: json["reason"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "reason": reason,
  };
}
