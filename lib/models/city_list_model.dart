class CityListModel {
  bool? status;
  String? message;
  List<CityData>? data;

  CityListModel({this.status, this.message, this.data});

  CityListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CityData>[];
      json['data'].forEach((v) {
        data!.add(CityData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CityData {
  dynamic cityCode;
  String? name;
  dynamic stateId;
  dynamic createdAt;
  dynamic updatedAt;

  CityData(
      {this.cityCode, this.name, this.stateId, this.createdAt, this.updatedAt});

  CityData.fromJson(Map<String, dynamic> json) {
    cityCode = json['city_code'];
    name = json['name'];
    stateId = json['state_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city_code'] = cityCode;
    data['name'] = name;
    data['state_id'] = stateId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}