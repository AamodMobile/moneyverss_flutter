

class VehicleModelModel {
  int? id;
  dynamic vehicleId;
  String? title;
  dynamic status;

  VehicleModelModel({
    this.id,
    this.vehicleId,
    this.title,
    this.status,
  });

  factory VehicleModelModel.fromJson(Map<String, dynamic> json) => VehicleModelModel(
    id: json["id"],
    vehicleId: json["vehicle_id"],
    title: json["title"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "vehicle_id": vehicleId,
    "title": title,
    "status": status,
  };
}
