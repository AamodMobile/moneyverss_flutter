class LoanOfferListModel {
  bool? status;
  String? message;
  List<LoanOfferData>? data;

  LoanOfferListModel({this.status, this.message, this.data});

  LoanOfferListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <LoanOfferData>[];
      json['data'].forEach((v) {
        data!.add(new LoanOfferData.fromJson(v));
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

class LoanOfferData {
  int? id;
  dynamic loanTypeId;
  dynamic loanSubTypeId;
  dynamic bankId;
  dynamic loanAmountRangeId;
  String? maxLoanAmount;
  String? interestRate;
  String? processingFees;
  String? emi;
  dynamic image;
  DateTime? createdAt;
  DateTime? updatedAt;
  Bank? bank;

  LoanOfferData({
    this.id,
    this.loanTypeId,
    this.loanSubTypeId,
    this.bankId,
    this.loanAmountRangeId,
    this.maxLoanAmount,
    this.interestRate,
    this.processingFees,
    this.emi,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.bank,
  });

  factory LoanOfferData.fromJson(Map<String, dynamic> json) => LoanOfferData(
    id: json["id"],
    loanTypeId: json["loan_type_id"],
    loanSubTypeId: json["loan_sub_type_id"],
    bankId: json["bank_id"],
    loanAmountRangeId: json["loan_amount_range_id"],
    maxLoanAmount: json["max_loan_amount"],
    interestRate: json["interest_rate"],
    processingFees: json["processing_fees"],
    emi: json["emi"],
    image: json["image"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    bank: json["bank"] == null ? null : Bank.fromJson(json["bank"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "loan_type_id": loanTypeId,
    "loan_sub_type_id": loanSubTypeId,
    "bank_id": bankId,
    "loan_amount_range_id": loanAmountRangeId,
    "max_loan_amount": maxLoanAmount,
    "interest_rate": interestRate,
    "processing_fees": processingFees,
    "emi": emi,
    "image": image,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "bank": bank?.toJson(),
  };
}

class Bank {
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
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  Bank({
    this.id,
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
    this.deletedAt,
  });

  factory Bank.fromJson(Map<String, dynamic> json) => Bank(
    id: json["id"],
    name: json["name"],
    address: json["address"],
    state: json["state"],
    stateCode: json["state_code"],
    gstinNumber: json["gstin_number"],
    panNumber: json["pan_number"],
    foir: json["foir"],
    image: json["image"]??"",
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "address": address,
    "state": state,
    "state_code": stateCode,
    "gstin_number": gstinNumber,
    "pan_number": panNumber,
    "foir": foir,
    "image": image,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "deleted_at": deletedAt,
  };
}