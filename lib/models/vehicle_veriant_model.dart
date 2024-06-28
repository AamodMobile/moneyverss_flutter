class VehicleVariantModel {
  int? id;
  dynamic vehicleId;
  dynamic modelId;
  String? title;
  dynamic status;

  VehicleVariantModel({
    this.id,
    this.vehicleId,
    this.modelId,
    this.title,
    this.status,
  });

  factory VehicleVariantModel.fromJson(Map<String, dynamic> json) => VehicleVariantModel(
    id: json["id"],
    vehicleId: json["vehicle_id"],
    modelId: json["model_id"],
    title: json["title"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "vehicle_id": vehicleId,
    "model_id": modelId,
    "title": title,
    "status": status,
  };
}
