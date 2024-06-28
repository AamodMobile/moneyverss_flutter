class BankListModel {
  bool? status;
  String? message;
  List<BankData>? data;

  BankListModel({this.status, this.message, this.data});

  BankListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <BankData>[];
      json['data'].forEach((v) {
        data!.add(new BankData.fromJson(v));
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

class BankData {
  int? id;
  String? name;
  String? address;
  String? state;
  String? stateCode;
  String? gstinNumber;
  String? panNumber;
  String? foir;
  String? image;
  dynamic status;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  BankData(
      {this.id,
        this.name,
        this.address,
        this.state,
        this.stateCode,
        this.gstinNumber,
        this.panNumber,
        this.foir,
        this.image,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  BankData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    state = json['state'];
    stateCode = json['state_code'];
    gstinNumber = json['gstin_number'];
    panNumber = json['pan_number'];
    foir = json['foir'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['state'] = this.state;
    data['state_code'] = this.stateCode;
    data['gstin_number'] = this.gstinNumber;
    data['pan_number'] = this.panNumber;
    data['foir'] = this.foir;
    data['image'] = this.image;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
