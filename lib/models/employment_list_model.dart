class EmploymentListModel {
  bool? status;
  String? message;
  List<EmploymentData>? data;

  EmploymentListModel({this.status, this.message, this.data});

  EmploymentListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <EmploymentData>[];
      json['data'].forEach((v) {
        data!.add(new EmploymentData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EmploymentData {
  int? id;
  String? name;
  String? description;
  dynamic? status;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  EmploymentData(
      {this.id,
        this.name,
        this.description,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  EmploymentData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}