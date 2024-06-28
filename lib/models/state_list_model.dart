class StateListModel {
  dynamic stateId;
  String name;
  String countryCode;


  StateListModel({
    required this.stateId,
    required this.name,
    required this.countryCode,

  });

  factory StateListModel.fromJson(Map<String, dynamic> json) => StateListModel(
    stateId: json["state_id"],
    name: json["name"],
    countryCode: json["country_code"],

  );

  Map<String, dynamic> toJson() => {
    "state_id": stateId,
    "name": name,
    "country_code": countryCode,
  };
}
