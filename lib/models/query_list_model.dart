
class QueryListModel {
  int? id;
  int? leadId;
  int? userId;
  String? message;
  String? status;
  int? reasonId;
  int? parentId;
  String? createdAt;
  DateTime? updatedAt;
  String? reasonName;
  String? adminReply;

  QueryListModel({
    this.id,
    this.leadId,
    this.userId,
    this.message,
    this.status,
    this.reasonId,
    this.parentId,
    this.createdAt,
    this.updatedAt,
    this.reasonName,
    this.adminReply,
  });

  factory QueryListModel.fromJson(Map<String, dynamic> json) => QueryListModel(
    id: json["id"],
    leadId: json["lead_id"],
    userId: json["user_id"],
    message: json["message"],
    status: json["status"],
    reasonId: json["reason_id"],
    parentId: json["parent_id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    reasonName: json["reason_name"],
    adminReply: json["admin_reply"]??"",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "lead_id": leadId,
    "user_id": userId,
    "message": message,
    "status": status,
    "reason_id": reasonId,
    "parent_id": parentId,
    "created_at": createdAt,
    "updated_at": updatedAt?.toIso8601String(),
    "reason_name": reasonName,
    "admin_reply": adminReply,
  };
}
