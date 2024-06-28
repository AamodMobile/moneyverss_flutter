class LoanSubTypeListModel {
  bool? status;
  String? message;
  List<LoanSubTypeData>? data;

  LoanSubTypeListModel({this.status, this.message, this.data});

  LoanSubTypeListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <LoanSubTypeData>[];
      json['data'].forEach((v) {
        data!.add(new LoanSubTypeData.fromJson(v));
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

class LoanSubTypeData {
  int? id;
  String? name;
  String? type;
  int? status;
  String? image;
  int? bank;
  int? parentId;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  LoanSubTypeData(
      {this.id,
        this.name,
        this.type,
        this.status,
        this.image,
        this.bank,
        this.parentId,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  LoanSubTypeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    status = json['status'];
    image = json['image'];
    bank = json['bank'];
    parentId = json['parent_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['status'] = this.status;
    data['image'] = this.image;
    data['bank'] = this.bank;
    data['parent_id'] = this.parentId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}