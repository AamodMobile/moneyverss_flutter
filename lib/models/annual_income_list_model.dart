class AnnualIncomeListModel {
  bool? status;
  String? message;
  List<AnnualIncomeData>? data;

  AnnualIncomeListModel({this.status, this.message, this.data});

  AnnualIncomeListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <AnnualIncomeData>[];
      json['data'].forEach((v) {
        data!.add(AnnualIncomeData.fromJson(v));
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

class AnnualIncomeData {
  int? id;
  dynamic? loanTypeId;
  dynamic? applicantTypeId;
  dynamic? employmentTypeId;
  String? income;
  String? tittle;
  dynamic? status;

  AnnualIncomeData({
    this.id,
    this.loanTypeId,
    this.applicantTypeId,
    this.employmentTypeId,
    this.income,
    this.tittle,
    this.status,
  });

  AnnualIncomeData.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    loanTypeId = json['loan_type_id'] ?? 0;
    applicantTypeId = json['applicant_type_id'] ?? 0;
    employmentTypeId = json['employment_type_id'] ?? 0;
    income = json['income'] ?? "";
    tittle = json['title'] ?? "";
    status = json['status'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['applicant_type_id'] = applicantTypeId;
    data['loan_type_id'] = loanTypeId;
    data['employment_type_id'] = employmentTypeId;
    data['income'] = income;
    data['title'] = tittle;
    data['status'] = status;
    return data;
  }
}
