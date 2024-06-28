class AppointmentDetailsModel {
  int? id;
  int? customerId;
  String? date;
  dynamic time;
  String? timeSlot;
  String? message;
  String? voiceMessage;
  String? status;
  int? reasonId;
  String? adminMessage;
  dynamic updatedBy;
  String? reasonsTitle;

  AppointmentDetailsModel({
    this.id,
    this.customerId,
    this.date,
    this.time,
    this.timeSlot,
    this.message,
    this.voiceMessage,
    this.status,
    this.reasonId,
    this.adminMessage,
    this.updatedBy,
    this.reasonsTitle,
  });

  factory AppointmentDetailsModel.fromJson(Map<String, dynamic> json) => AppointmentDetailsModel(
    id: json["id"],
    customerId: json["customer_id"],
    date: json["date"],
    time: json["time"],
    timeSlot: json["time_slot"],
    message: json["message"],
    voiceMessage: json["voice_message"]??"",
    status: json["status"],
    reasonId: json["reason_id"],
    adminMessage: json["admin_message"]??"",
    updatedBy: json["updated_by"],
    reasonsTitle: json["reasons_title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "customer_id": customerId,
    "date": date,
    "time": time,
    "time_slot": timeSlot,
    "message": message,
    "voice_message": voiceMessage,
    "status": status,
    "reason_id": reasonId,
    "admin_message": adminMessage,
    "updated_by": updatedBy,
    "reasons_title": reasonsTitle,
  };
}
