
class BankOffers {
  int? id;
  String? title;
  int? bank;
  int? loanType;
  int? loanSubType;
  String? image;
  String? description;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  BankData? bankData;
  LoanTypeData? loanTypeData;
  LoanTypeData? loanSubTypeData;

  BankOffers({
    this.id,
    this.title,
    this.bank,
    this.loanType,
    this.loanSubType,
    this.image,
    this.description,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.bankData,
    this.loanTypeData,
    this.loanSubTypeData,
  });

  factory BankOffers.fromJson(Map<String, dynamic> json) => BankOffers(
    id: json["id"],
    title: json["title"],
    bank: json["bank"],
    loanType: json["loan_type"],
    loanSubType: json["loan_sub_type"],
    image: json["image"],
    description: json["description"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    bankData: json["bank_data"] == null ? null : BankData.fromJson(json["bank_data"]),
    loanTypeData: json["loan_type_data"] == null ? null : LoanTypeData.fromJson(json["loan_type_data"]),
    loanSubTypeData: json["loan_sub_type_data"] == null ? null : LoanTypeData.fromJson(json["loan_sub_type_data"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "bank": bank,
    "loan_type": loanType,
    "loan_sub_type": loanSubType,
    "image": image,
    "description": description,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "deleted_at": deletedAt,
    "bank_data": bankData?.toJson(),
    "loan_type_data": loanTypeData?.toJson(),
    "loan_sub_type_data": loanSubTypeData?.toJson(),
  };
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
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  BankData({
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

  factory BankData.fromJson(Map<String, dynamic> json) => BankData(
    id: json["id"],
    name: json["name"],
    address: json["address"],
    state: json["state"],
    stateCode: json["state_code"],
    gstinNumber: json["gstin_number"],
    panNumber: json["pan_number"],
    foir: json["foir"],
    image: json["image"],
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

class LoanTypeData {
  int? id;
  String? name;
  String? type;
  int? status;
  String? image;
  int? bank;
  int? parentId;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  LoanTypeData({
    this.id,
    this.name,
    this.type,
    this.status,
    this.image,
    this.bank,
    this.parentId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory LoanTypeData.fromJson(Map<String, dynamic> json) => LoanTypeData(
    id: json["id"],
    name: json["name"],
    type: json["type"],
    status: json["status"],
    image: json["image"],
    bank: json["bank"],
    parentId: json["parent_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "type": type,
    "status": status,
    "image": image,
    "bank": bank,
    "parent_id": parentId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "deleted_at": deletedAt,
  };
}
