class NotificationModel {
  int? id;
  dynamic? userId;
  dynamic? notificationId;
  String? title;
  String? description;
  String? date;


  NotificationModel({
    this.id,
    this.userId,
    this.notificationId,
    this.title,
    this.description,
    this.date,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    id: json["id"],
    userId: json["user_id"],
    notificationId: json["notification_id"],
    title: json["title"],
    description: json["description"],
    date: json["date"] ,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "notification_id": notificationId,
    "title": title,
    "description": description,
    "date": date,
  };
}
