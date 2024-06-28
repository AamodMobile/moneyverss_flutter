class LoadAmtRangeModel {
  bool? status;
  String? message;
  List<LoanAmtRangData>? data;

  LoadAmtRangeModel({this.status, this.message, this.data});

  LoadAmtRangeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <LoanAmtRangData>[];
      json['data'].forEach((v) {
        data!.add(new LoanAmtRangData.fromJson(v));
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

class LoanAmtRangData {
  int? id;
  dynamic loanTypeId;
  String? title;
  dynamic status;
  String? createdAt;
  String? updatedAt;
  dynamic createdBy;

  LoanAmtRangData(
      {this.id,
        this.loanTypeId,
        this.title,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.createdBy});

  LoanAmtRangData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    loanTypeId = json['loan_type_id'];
    title = json['title'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdBy = json['created_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['loan_type_id'] = this.loanTypeId;
    data['title'] = this.title;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['created_by'] = this.createdBy;
    return data;
  }
}