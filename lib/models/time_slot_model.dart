
class TimeSlotModel {
int? id;
String? date;
String? startTime;
String? endTime;
TimeSlotModel({
this.id,
this.date,
this.startTime,
this.endTime,
});

factory TimeSlotModel.fromJson(Map<String, dynamic> json) => TimeSlotModel(
id: json["id"],
date: json["date"]??"",
startTime: json["start_time"],
endTime: json["end_time"],

);

Map<String, dynamic> toJson() => {
"id": id,
"date": date,
"start_time": startTime,
"end_time": endTime,
};
}
