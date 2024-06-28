

class UserModel {
  int? id;
  String? customerName;
  dynamic age;
  String? image;
  dynamic signatureImage;
  dynamic dateOfBirth;
  dynamic stateId;
  dynamic cityId;
  dynamic pincode;
  dynamic address;
  String? maritialStatus;
  String? password;
  dynamic spouseName;
  dynamic motherName;
  dynamic fatherName;
  dynamic noOfDependent;
  String? mobileNo;
  String? emailAddress;
  dynamic residenceSince;
  dynamic residenceAddCu;
  dynamic residenceAddP;
  dynamic officeAddCu;
  dynamic propertyAddress;
  dynamic noOfProperty;
  dynamic propertyType;
  dynamic noOfYearsInBusiness;
  dynamic caseType;
  String? apiToken;
  dynamic refrenceNaAddMo;
  String? aadharCard;
  String? aadharCardBack;
  String? aadharNo;
  String? panNo;
  String? panCard;
  List<String>? bankDetails;
  String? accountNo;
  String? bankName;
  String? ifscNo;
  dynamic licenceNo;
  String? drivingLicence;
  List<String>? otherDocuments;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic status;
  dynamic verifyOtp;
  dynamic referenceLeadId;
  dynamic message;
  dynamic deletedAt;
  List<String>? otherDocumentsName;
  List<String>? otherDocumentNo;

  UserModel({
    this.id,
    this.customerName,
    this.age,
    this.image,
    this.signatureImage,
    this.dateOfBirth,
    this.stateId,
    this.cityId,
    this.pincode,
    this.address,
    this.maritialStatus,
    this.password,
    this.spouseName,
    this.motherName,
    this.fatherName,
    this.noOfDependent,
    this.mobileNo,
    this.emailAddress,
    this.residenceSince,
    this.residenceAddCu,
    this.residenceAddP,
    this.officeAddCu,
    this.propertyAddress,
    this.noOfProperty,
    this.propertyType,
    this.noOfYearsInBusiness,
    this.caseType,
    this.apiToken,
    this.refrenceNaAddMo,
    this.aadharCard,
    this.aadharCardBack,
    this.aadharNo,
    this.panNo,
    this.panCard,
    this.bankDetails,
    this.accountNo,
    this.ifscNo,
    this.licenceNo,
    this.drivingLicence,
    this.otherDocuments,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.verifyOtp,
    this.referenceLeadId,
    this.message,
    this.deletedAt,
    this.otherDocumentsName,
    this.otherDocumentNo,
    this.bankName
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    customerName: json["customer_name"],
    age: json["age"],
    image: json["image"],
    signatureImage: json["signature_image"],
    dateOfBirth: json["date_of_birth"],
    stateId: json["state_id"],
    cityId: json["city_id"],
    pincode: json["pincode"],
    address: json["address"],
    maritialStatus: json["maritial_status"],
    password: json["password"],
    spouseName: json["spouse_name"],
    motherName: json["mother_name"],
    fatherName: json["father_name"],
    noOfDependent: json["no_of_dependent"],
    mobileNo: json["mobile_no"],
    emailAddress: json["email_address"],
    residenceSince: json["residence_since"],
    residenceAddCu: json["residence_add_cu"],
    residenceAddP: json["residence_add_p"],
    officeAddCu: json["office_add_cu"],
    propertyAddress: json["property_address"],
    noOfProperty: json["no_of_property"],
    propertyType: json["property_type"],
    noOfYearsInBusiness: json["no_of__years_in_business"],
    caseType: json["case_type"],
    apiToken: json["api_token"],
    refrenceNaAddMo: json["refrence_na_add_mo"],
    aadharCard: json["aadhar_card"]??"",
    aadharCardBack: json["aadhar_card_back"]??"",
    aadharNo: json["aadhar_no"],
    panNo: json["pan_no"],
    panCard: json["pan_card"]??"",
    bankDetails: json["bank_details"] == null ? [] : List<String>.from(json["bank_details"]!.map((x) => x)),
    accountNo: json["account_no"],
    bankName: json["bank_name"],
    ifscNo: json["ifsc_no"],
    licenceNo: json["licence_no"],
    drivingLicence: json["driving_licence"]??"",
    otherDocuments: json["other_documents"] == null ? [] : List<String>.from(json["other_documents"]!.map((x) => x)),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    status: json["status"],
    verifyOtp: json["verify_otp"],
    referenceLeadId: json["reference_lead_id"],
    message: json["message"],
    deletedAt: json["deleted_at"],
    otherDocumentsName: json["other_documents_name"] == null ? [] : List<String>.from(json["other_documents_name"]!.map((x) => x)),
    otherDocumentNo: json["other_document_no"] == null ? [] : List<String>.from(json["other_document_no"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "customer_name": customerName,
    "age": age,
    "image": image,
    "signature_image": signatureImage,
    "date_of_birth": dateOfBirth,
    "state_id": stateId,
    "city_id": cityId,
    "pincode": pincode,
    "address": address,
    "maritial_status": maritialStatus,
    "password": password,
    "spouse_name": spouseName,
    "mother_name": motherName,
    "father_name": fatherName,
    "no_of_dependent": noOfDependent,
    "mobile_no": mobileNo,
    "email_address": emailAddress,
    "residence_since": residenceSince,
    "residence_add_cu": residenceAddCu,
    "residence_add_p": residenceAddP,
    "office_add_cu": officeAddCu,
    "property_address": propertyAddress,
    "no_of_property": noOfProperty,
    "property_type": propertyType,
    "no_of__years_in_business": noOfYearsInBusiness,
    "case_type": caseType,
    "api_token": apiToken,
    "refrence_na_add_mo": refrenceNaAddMo,
    "aadhar_card": aadharCard,
    "aadhar_card_back": aadharCardBack,
    "aadhar_no": aadharNo,
    "pan_no": panNo,
    "pan_card": panCard,
    "bank_details": bankDetails == null ? [] : List<BankDetailsImg>.from(bankDetails!.map((x) => x)),
    "account_no": accountNo,
    "bank_name": bankName,
    "ifsc_no": ifscNo,
    "licence_no": licenceNo,
    "driving_licence": drivingLicence,
    "other_documents": otherDocuments == null ? [] : List<BankDetailsImg>.from(otherDocuments!.map((x) => x)),
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "status": status,
    "verify_otp": verifyOtp,
    "reference_lead_id": referenceLeadId,
    "message": message,
    "deleted_at": deletedAt,
    "other_documents_name": otherDocumentsName == null ? [] : List<BankDetailsImg>.from(otherDocumentsName!.map((x) => x)),
    "other_document_no": otherDocumentNo == null ? [] : List<BankDetailsImg>.from(otherDocumentNo!.map((x) => x)),
  };
}


class BankDetailsImg {
  int? id;
  String? image;
  String? title;

  BankDetailsImg({this.id, this.image, this.title});

  BankDetailsImg.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'] ?? "";
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['title'] = title;
    return data;
  }
}
