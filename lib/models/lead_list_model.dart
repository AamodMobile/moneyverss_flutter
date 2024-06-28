class LeadListModel {
  bool? status;
  String? message;
  List<LeadData>? data;

  LeadListModel({this.status, this.message, this.data});

  LeadListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <LeadData>[];
      json['data'].forEach((v) {
        data!.add(LeadData.fromJson(v));
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

class LeadData {
  int? id;
  dynamic? customerId;
  String? referenceLeadId;
  String? uniqueId;
  String? customerName;
  dynamic? applicantTypeId;
  String? customerAge;
  dynamic? cityId;
  String? loanTypeId;
  String? annualIncomeId;
  String? bankId;
  String? loanSubTypeId;
  String? loanAmountId;
  dynamic? status;
  String? createdAt;
  String? updatedAt;
  String? loanAmount;
  String? leadStatus;
  dynamic? stateId;
  String? applicantType;
  String? loanType;
  String? loanAmountRange;
  String? stateName;
  String? cityName;
  String? documentStatus;

  LeadData({
    this.id,
    this.customerId,
    this.referenceLeadId,
    this.uniqueId,
    this.customerName,
    this.applicantTypeId,
    this.customerAge,
    this.cityId,
    this.loanTypeId,
    this.annualIncomeId,
    this.bankId,
    this.loanSubTypeId,
    this.loanAmountId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.leadStatus,
    this.loanAmount,
    this.cityName,
    this.stateId,
    this.applicantType,
    this.stateName,
    this.loanType,
    this.loanAmountRange,
    this.documentStatus,
  });

  LeadData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    referenceLeadId = json['reference_lead_id'];
    uniqueId = json['unique_id'];
    customerName = json['customer_name'];
    applicantTypeId = json['applicant_type_id'];
    customerAge = json['customer_age'];
    cityId = json['city_id'];
    loanTypeId = json['loan_type_id'];
    annualIncomeId = json['annual_income_id'];
    bankId = json['bank_id'];
    loanSubTypeId = json['loan_sub_type_id'];
    loanAmountId = json['loan_amount_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    leadStatus = json['lead_status'];
    loanAmount = json["loan_amount"]??"";
    leadStatus = json["lead_status"];
    stateId = json["state_id"];
    stateName = json["state_name"];
    cityName = json["city_name"];
    documentStatus = json["document_status"];
    applicantType = json["applicant_type"];
    loanType = json["loan_type"];
    loanAmountRange = json["loan_amount_range"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['customer_id'] = customerId;
    data['reference_lead_id'] = referenceLeadId;
    data['unique_id'] = uniqueId;
    data['customer_name'] = customerName;
    data['applicant_type_id'] = applicantTypeId;
    data['customer_age'] = customerAge;
    data['city_id'] = cityId;
    data['loan_type_id'] = loanTypeId;
    data['annual_income_id'] = annualIncomeId;
    data['bank_id'] = bankId;
    data['loan_sub_type_id'] = loanSubTypeId;
    data['loan_amount_id'] = loanAmountId;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;

    data['loan_amount'] = loanAmount;
    data['lead_status'] = leadStatus;
    data['state_id'] = stateId;
    data['applicant_type'] = applicantType;
    data['loan_type'] = loanType;
    data['loan_amount_range'] = loanAmountRange;
    data['state_name'] = stateName;
    data['city_name'] = cityName;
    data['document_status'] = documentStatus;
    return data;
  }
}

class LoanTypes {
  int? id;
  String? name;

  LoanTypes({this.id, this.name});

  LoanTypes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class LeadStatus {
  int? id;
  String? title;

  LeadStatus({this.id, this.title});

  LeadStatus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    return data;
  }
}
