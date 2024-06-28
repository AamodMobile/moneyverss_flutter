

class AppointmentListModel {
  int? id;
  dynamic customerId;
  String? date;
  String? time;
  String? message;
  String? reasonsTitle;
  String? status;

  AppointmentListModel({
    this.id,
    this.customerId,
    this.date,
    this.time,
    this.message,
    this.reasonsTitle,
    this.status,
  });

  factory AppointmentListModel.fromJson(Map<String, dynamic> json) => AppointmentListModel(
    id: json["id"],
    customerId: json["customer_id"],
    date: json["date"],
    time: json["time_slot"],
    message: json["message"]??"",
    reasonsTitle: json["reasons_title"]??"",
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "customer_id": customerId,
    "date": date,
    "time_slot": time,
    "message": message,
    "reasons_title": reasonsTitle,
    "status": status,
  };
}
