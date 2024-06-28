class VerifyOtpModel {
  bool? status;
  Data? data;
  String? accessToken;
  String? tokenType;
  String? message;

  VerifyOtpModel({this.status, this.data, this.accessToken, this.tokenType, this.message});

  VerifyOtpModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    data['message'] = message;
    return data;
  }
}

class Data {
  int? id;
  String? customerName;
  dynamic age;
  dynamic dateOfBirth;
  dynamic stateId;
  dynamic cityId;
  dynamic pincode;
  dynamic maritialStatus;
  dynamic password;
  dynamic spouseName;
  dynamic motherName;
  dynamic fatherName;
  dynamic noOfDependent;
  dynamic mobileNo;
  dynamic emailAddress;
  dynamic residenceSince;
  dynamic residenceAddCu;
  dynamic residenceAddP;
  dynamic officeAddCu;
  dynamic propertyAddress;
  dynamic noOfProperty;
  dynamic propertyType;
  dynamic noOfYearsInBusiness;
  dynamic caseType;
  dynamic panCartNo;
  dynamic apiToken;
  int? aadharCardNo;
  dynamic refrenceNaAddMo;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic status;
  dynamic verifyOtp;
  dynamic referenceLeadId;
  dynamic deletedAt;

  Data(
      {this.id,
        this.customerName,
        this.age,
        this.dateOfBirth,
        this.stateId,
        this.cityId,
        this.pincode,
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
        this.panCartNo,
        this.apiToken,
        this.aadharCardNo,
        this.refrenceNaAddMo,
        this.createdAt,
        this.updatedAt,
        this.status,
        this.verifyOtp,
        this.referenceLeadId,
        this.deletedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerName = json['customer_name'];
    age = json['age'];
    dateOfBirth = json['date_of_birth'];
    stateId = json['state_id'];
    cityId = json['city_id'];
    pincode = json['pincode'];
    maritialStatus = json['maritial_status'];
    password = json['password'];
    spouseName = json['spouse_name'];
    motherName = json['mother_name'];
    fatherName = json['father_name'];
    noOfDependent = json['no_of_dependent'];
    mobileNo = json['mobile_no'];
    emailAddress = json['email_address']??"";
    residenceSince = json['residence_since'];
    residenceAddCu = json['residence_add_cu'];
    residenceAddP = json['residence_add_p'];
    officeAddCu = json['office_add_cu'];
    propertyAddress = json['property_address'];
    noOfProperty = json['no_of_property'];
    propertyType = json['property_type'];
    noOfYearsInBusiness = json['no_of__years_in_business'];
    caseType = json['case_type'];
    panCartNo = json['pan_cart_no'];
    apiToken = json['api_token'];
    aadharCardNo = json['aadhar_card_no'];
    refrenceNaAddMo = json['refrence_na_add_mo'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
    verifyOtp = json['verify_otp'];
    referenceLeadId = json['reference_lead_id'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['customer_name'] = customerName;
    data['age'] = age;
    data['date_of_birth'] = dateOfBirth;
    data['state_id'] = stateId;
    data['city_id'] = cityId;
    data['pincode'] = pincode;
    data['maritial_status'] = maritialStatus;
    data['password'] = password;
    data['spouse_name'] = spouseName;
    data['mother_name'] = motherName;
    data['father_name'] = fatherName;
    data['no_of_dependent'] = noOfDependent;
    data['mobile_no'] = mobileNo;
    data['email_address'] = emailAddress;
    data['residence_since'] = residenceSince;
    data['residence_add_cu'] = residenceAddCu;
    data['residence_add_p'] = residenceAddP;
    data['office_add_cu'] = officeAddCu;
    data['property_address'] = propertyAddress;
    data['no_of_property'] = noOfProperty;
    data['property_type'] = propertyType;
    data['no_of__years_in_business'] = noOfYearsInBusiness;
    data['case_type'] = caseType;
    data['pan_cart_no'] = panCartNo;
    data['api_token'] = apiToken;
    data['aadhar_card_no'] = aadharCardNo;
    data['refrence_na_add_mo'] = refrenceNaAddMo;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['status'] = status;
    data['verify_otp'] = verifyOtp;
    data['reference_lead_id'] = referenceLeadId;
    data['deleted_at'] = deletedAt;
    return data;
  }
}