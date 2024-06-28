import 'dart:convert';
import 'dart:io';

import 'package:get/get_connect/connect.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/service/api_client.dart';
import 'package:wireframe/service/api_logs.dart';
import 'package:wireframe/service/api_url.dart';

class ApiService extends GetConnect {
  static var client = http.Client();

  //Login api
  static Future<http.Response> loginApi(String name, String mobile) async {
    http.Response response;
    var result = await ApiClient.postData(ApiUrl.login, body: {'name': name, 'mobile': mobile});
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  //sign up api
  static Future<http.Response> signUpApi(String name, String mobile, String email) async {
    http.Response response;
    var result = await ApiClient.postData(ApiUrl.login, body: {'name': name, 'mobile': mobile, "email": email});
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  //VerifyOtp api
  static Future<http.Response> verifyOtpApi(String name, String mobile, String otp) async {
    http.Response response;
    var result = await ApiClient.postData(ApiUrl.verifyOtp, body: {'name': name, 'mobile': mobile, 'otp': otp});
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  //Dashboard api
  static Future<http.Response> dashboardApi() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(
      ApiUrl.dashboard,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  //loanSubTypeList api
  static Future<http.Response> loanSubTypeListApi(String loanTypeId) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(
      ApiUrl.loanSubTypeList,
      body: {
        'loan_type_id': loanTypeId,
      },
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///employmentTypeList api
  static Future<http.Response> employmentListApi(String loanTypeId) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.getData(
      "${ApiUrl.employmentList}?loan_type_id=$loanTypeId",
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  //AnnualIncomeList api
  static Future<http.Response> annualIncomeListApi(String loanTypeId, String employmentTypeId) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(
      ApiUrl.annualIncomeList,
      body: {
        'loan_type_id': loanTypeId,
        'employement_type_id': employmentTypeId,
      },
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

//AnnualTurnoverList api
  static Future<http.Response> annualTurnoverList(String loanTypeId, String employmentTypeId) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(
      ApiUrl.annualTurnoverList,
      body: {
        'loan_type_id': loanTypeId,
        'employement_type_id': employmentTypeId,
      },
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  //BankList api
  static Future<http.Response> bankListApi() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(
      ApiUrl.bankList,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  //CityList api
  static Future<http.Response> cityListApi(String stateId) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(ApiUrl.cityList, headers: {
      'Authorization': 'Bearer $token',
    }, body: {
      "state_id": stateId
    });
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

//State List api
  static Future<http.Response> stateListApi() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(
      ApiUrl.stateList,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  //LoanAmountRangeList api
  static Future<http.Response> loanAmountRangeListApi(String loanTypeId, String employmentTypeId) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(
      ApiUrl.loanAmountRangeList,
      headers: {
        'Authorization': 'Bearer $token',
      },
      body: {
        'loan_type_id': loanTypeId,
        'employement_type_id': employmentTypeId,
      },
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///Company Type Api api
  static Future<http.Response> companyTypeApi() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(
      ApiUrl.companyType,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  //LoanOfferList
  static Future<http.Response> loanOfferListApi(String bankId, String loanTypeId, String loanSubTypeId, String loanAmountId) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(
      ApiUrl.loanOfferList,
      body: {'bank_id': bankId, 'loan_type_id': loanTypeId, 'loan_sub_type_id': loanSubTypeId, 'loan_amount_id': loanAmountId},
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  //CreateLeadList
  static Future<http.Response> createLeadApi(String loanTypeId,
      String loanSubTypeId,
      String employmentTypeId,
      String annualIncomeId,
      String bankId,
      String loanAmountId,
      String cityId,
      String loanOfferId,
      String stateId,
      String loanTenureId,
      String annualTurnoverId,
      String companyName,
      String companyTypeId,
      String businessYearId,
      String isAppointment,
      String pastLoanTime,
      String isTopup,
      String existingBank,
      String residenceType,
      String goldWeight,
      String vehicleCompany,
      String vehicleModel,
      String vehicleVariant,
      String productType,
      String yearOfManufacturer,
      String topupAmount,) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(
      ApiUrl.createLead,
      body: {
        'loan_type_id': loanTypeId,
        'loan_sub_type_id': loanSubTypeId,
        'employement_type_id': employmentTypeId,
        'annual_income_id': annualIncomeId,
        'bank_id': bankId,
        'loan_amount_id': loanAmountId,
        'city_id': cityId,
        'state_id': stateId,
        'loan_tenure': loanTenureId,
        'annual_turnover': annualTurnoverId,
        'company_name': companyName,
        'company_type': companyTypeId,
        'business_years': businessYearId,
        'loan_offer_id': loanOfferId,
        'is_appointment': isAppointment,
        'past_loan_time': pastLoanTime,
        'is_topup': isTopup,
        'existing_bank': existingBank,
        'residence_type': residenceType,
        'gold_weight': goldWeight,
        'vehicle_company': vehicleCompany,
        'vehicle_model': vehicleModel,
        'vehicle_variant': vehicleVariant,
        'product_type': productType,
        'year_of_manufacturer': yearOfManufacturer,
        'topup_amount': topupAmount,
      },
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  //LoanOfferList
  static Future<http.Response> leadListApi() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(
      ApiUrl.leadList,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  /// BusinessTypeList api
  static Future<http.Response> businessTypeListApi() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(
      ApiUrl.businessTypeList,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  /// BankOfferList
  static Future<http.Response> bankOfferList() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(
      ApiUrl.bankOffers,
      headers: {'Authorization': 'Bearer $token'},
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  /// BankOfferList
  static Future<http.Response> yearsRangeGet(String loanTypeId, String employmentTypeId) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(
      ApiUrl.yearsRange,
      headers: {'Authorization': 'Bearer $token'},
      body: {
        "loan_type_id": loanTypeId,
        'employement_type_id': employmentTypeId,
      },
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  /// businessYearsList
  static Future<http.Response> businessYearsGet(String loanTypeId) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(
      ApiUrl.businessYears,
      headers: {'Authorization': 'Bearer $token'},
      body: {
        "loan_type_id": loanTypeId,
      },
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  /// BankOfferList
  static Future<http.Response> userProfileGet() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(
      ApiUrl.getUserProfile,
      headers: {'Authorization': 'Bearer $token'},
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///Update Profile
  static Future<dynamic> updateProfile(String name,
      String mobile,
      String email,
      String image,) async {
    var result;
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    try {
      http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse(ApiUrl.updateProfile));
      request.headers.addAll({
        'Authorization': 'Bearer $token',
      });
      request.fields['name'] = name;
      request.fields['mobile_no'] = mobile;
      request.fields['email_address'] = email;
      if (image.isNotEmpty) {
        http.MultipartFile file = await http.MultipartFile.fromPath('profile_image', image);
        request.files.add(file);
      }
      response = await http.Response.fromStream(await request.send());
      if (response.body != null) {
        if (response.statusCode == 200) {
          result = jsonDecode(response.body);
        } else if (response.statusCode == 404) {
          result = {'status_code': 400, 'message': '404'};
        } else if (response.statusCode == 401) {
          result = jsonDecode(response.body);
        }
      } else {
        result = {'status_code': 404, 'message': 'Unable to Connect to Server!'};
      }
    } catch (e) {
      result = http.Response(
        jsonEncode({e.toString()}),
        204,
        headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'},
      );
    }
    return result;
  }

  /// blog list api
  static Future<http.Response> blogsListGet() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(
      ApiUrl.blogsList,
      headers: {'Authorization': 'Bearer $token'},
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  /// Blog Details
  static Future<http.Response> blogDetailsGet(String id) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(ApiUrl.blogDetails, headers: {'Authorization': 'Bearer $token'}, body: {"blog_id": id});
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  /// logout
  static Future<http.Response> logout() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(
      ApiUrl.logout,
      headers: {'Authorization': 'Bearer $token'},
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  /// aboutUs
  static Future<http.Response> cmsPages(String type) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(ApiUrl.cmsPages, headers: {'Authorization': 'Bearer $token'}, body: {"type": type});
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  /// faqs
  static Future<http.Response> faqs() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(
      ApiUrl.faqs,
      headers: {'Authorization': 'Bearer $token'},
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  /// companyPolicy
  static Future<http.Response> companyPolicy() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(
      ApiUrl.companyPolicy,
      headers: {'Authorization': 'Bearer $token'},
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  /// loanStatusHistory
  static Future<http.Response> loanStatusHistory(String id) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(ApiUrl.loanStatusHistory, headers: {'Authorization': 'Bearer $token'}, body: {"lead_id": id});
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  /// Documents List
  static Future<http.Response> documentsList() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(ApiUrl.documentsList, headers: {'Authorization': 'Bearer $token'});
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  /// uploadDocument
  static Future<dynamic> uploadDocument(var documentId, var document, String id) async {
    var result;
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    try {
      http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse(ApiUrl.uploadDocument));
      request.headers.addAll({
        'Authorization': 'Bearer $token',
      });
      request.fields['lead_id'] = id;
      if (documentId.isNotEmpty) {
        for (int i = 0; i < documentId.length; i++) {
          request.fields['document_id[]'] = documentId[i];
        }
      }
      if (document != null && document.isNotEmpty) {
        for (int i = 0; i < document.length; i++) {
          if (document[i] is String) {} else if (document[i] is File) {
            final File file = File(document[i].path);
            http.MultipartFile file2 = await http.MultipartFile.fromPath("document[]", file.path.toString());
            request.files.add(file2);
          }
        }
      }
      response = await http.Response.fromStream(await request.send());
      if (response.body != null) {
        if (response.statusCode == 200) {
          result = jsonDecode(response.body);
        } else if (response.statusCode == 404) {
          result = {'status_code': 400, 'message': '404'};
        } else if (response.statusCode == 401) {
          result = jsonDecode(response.body);
        }
      } else {
        result = {'status_code': 404, 'message': 'Unable to Connect to Server!'};
      }
    } catch (e) {
      result = http.Response(jsonEncode({e.toString()}), 204, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    }
    return result;
  }

  /// delete Account
  static Future<http.Response> deleteAccount() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(
      ApiUrl.deleteAccount,
      headers: {'Authorization': 'Bearer $token'},
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///uploadCustomerDocs
  static Future<dynamic> uploadCustomerDocs(String aadhaarNo,
      String panNo,
      String licenceNo,
      String accountNo,
      String ifscNo,
      String other,
      String panCard,
      String aadhaarCard,
      String aadhaarCardBack,
      String drivingLicence,
      String bankName,
      var bankDetails,
      var otherDocuments,
      var otherDocumentsName,
      var otherDocumentsNo,) async {
    var result;
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    try {
      http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse(ApiUrl.uploadCustomerDocs));
      request.headers.addAll({
        'Authorization': 'Bearer $token',
      });
      request.fields['aadhar_no'] = aadhaarNo;
      request.fields['pan_no'] = panNo;
      request.fields['licence_no'] = licenceNo;
      request.fields['account_no'] = accountNo;
      request.fields['ifsc_no'] = ifscNo;
      request.fields['other'] = other;
      request.fields['bank_name'] = bankName;
      if (otherDocumentsName != null && otherDocumentsName.isNotEmpty) {
        for (int i = 0; i < otherDocumentsName.length; i++) {
          request.fields['other_documents_name[]'] = otherDocumentsName[i] ?? "";
        }
      }
      if (otherDocumentsNo != null && otherDocumentsNo.isNotEmpty) {
        for (int i = 0; i < otherDocumentsNo.length; i++) {
          request.fields['other_documents_no[]'] = otherDocumentsNo[i] ?? "";
        }
      }
      if (panCard.isNotEmpty) {
        http.MultipartFile file = await http.MultipartFile.fromPath('pan_card', panCard);
        request.files.add(file);
      }
      if (aadhaarCard.isNotEmpty) {
        http.MultipartFile file = await http.MultipartFile.fromPath('aadhar_card', aadhaarCard);
        request.files.add(file);
      }
      if (aadhaarCardBack.isNotEmpty) {
        http.MultipartFile file = await http.MultipartFile.fromPath('aadhar_card_back', aadhaarCardBack);
        request.files.add(file);
      }
      if (drivingLicence.isNotEmpty) {
        http.MultipartFile file = await http.MultipartFile.fromPath('driving_licence', drivingLicence);
        request.files.add(file);
      }
      if (bankDetails.isNotEmpty) {
        for (int i = 0; i < bankDetails.length; i++) {
          if (bankDetails[i].toString() != "upload") {
            if (!GetUtils.isURL(bankDetails[i].toString())) {
              final File file = File(bankDetails[i].path);
              http.MultipartFile file2 = await http.MultipartFile.fromPath("bank_details[]", file.path.toString());
              request.files.add(file2);
            }
          }
        }
      }
      if (otherDocuments != null && otherDocuments.isNotEmpty) {
        for (int i = 0; i < otherDocuments.length; i++) {
          if (otherDocuments[i] is String) {
            http.MultipartFile file2 = await http.MultipartFile.fromPath("other_documents[]", otherDocuments[i]);
            request.files.add(file2);
          }
        }
      }

      response = await http.Response.fromStream(await request.send());
      if (response.body != null) {
        if (response.statusCode == 200) {
          result = jsonDecode(response.body);
        } else if (response.statusCode == 404) {
          result = {'status_code': 400, 'message': '404'};
        } else if (response.statusCode == 401) {
          result = jsonDecode(response.body);
        }
      } else {
        result = {'status_code': 404, 'message': 'Unable to Connect to Server!'};
      }
    } catch (e) {
      result = http.Response(
        jsonEncode({e.toString()}),
        204,
        headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'},
      );
    }
    return result;
  }

  /// notificationsList
  static Future<http.Response> notificationsList() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(ApiUrl.notificationsList, headers: {'Authorization': 'Bearer $token'});
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  /// markAsRead
  static Future<http.Response> markAsRead() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(ApiUrl.markAsRead, headers: {'Authorization': 'Bearer $token'});
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  /// deleteNotification
  static Future<http.Response> deleteNotification() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(ApiUrl.deleteNotification, headers: {'Authorization': 'Bearer $token'});
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  /// contactUs
  static Future<http.Response> contactUs() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(ApiUrl.contactUs, headers: {'Authorization': 'Bearer $token'});
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  /// createAppointment
  static Future<dynamic> createAppointment(String appointmentDate, String appointmentTime, String message, var voiceMassage,String reasonId,) async {
    var result;
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    try {
      http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse(ApiUrl.createAppointment));
      request.headers.addAll({
        'Authorization': 'Bearer $token',
      });
      request.fields['appointment_date'] = appointmentDate;
      request.fields['time_slot'] = appointmentTime;
      request.fields['message'] = message;
      request.fields['reason_id'] = reasonId;
    if (voiceMassage != null && voiceMassage.isNotEmpty) {
    http.MultipartFile file = await http.MultipartFile.fromPath('voice_message', voiceMassage);
    request.files.add(file);
    }
    response = await http.Response.fromStream(await request.send());
    if (response.body != null) {
    if (response.statusCode == 200) {
    result = jsonDecode(response.body);
    } else if (response.statusCode == 404) {
    result = {'status_code': 400, 'message': '404'};
    } else if (response.statusCode == 401) {
    result = jsonDecode(response.body);
    }
    } else {
    result = {'status_code': 404, 'message': 'Unable to Connect to Server!'};
    }
    } catch (e) {
    result = http.Response(
    jsonEncode({e.toString()}),
    204,
    headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'},
    );
    }
    return
    result;
  }

  /// appointments
  static Future<http.Response> appointments() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(
      ApiUrl.appointments,
      headers: {'Authorization': 'Bearer $token'},
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  /// timeSlots
  static Future<http.Response> timeSlots(String date) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(
      ApiUrl.timeSlots,
      headers: {'Authorization': 'Bearer $token'},
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  /// cancelAppointment
  static Future<http.Response> cancelAppointment(String id) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(ApiUrl.cancelAppointment, headers: {'Authorization': 'Bearer $token'}, body: {"appointment_id": id});
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  /// reschedule Appointment
  static Future<dynamic> rescheduleAppointment(String id, String appointmentDate, String appointmentTime, String message, var voiceMassage,String reasonId) async {
    var result;
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    try {
      http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse(ApiUrl.createAppointment));
      request.headers.addAll({
        'Authorization': 'Bearer $token',
      });
      request.fields['appointment_date'] = appointmentDate;
      request.fields['time_slot'] = appointmentTime;
      request.fields['message'] = message;
      request.fields['appointment_id'] = id;
      request.fields['reason_id'] = reasonId;
      if (voiceMassage != null && voiceMassage.isNotEmpty) {
        http.MultipartFile file = await http.MultipartFile.fromPath('voice_message', voiceMassage);
        request.files.add(file);
      }
      response = await http.Response.fromStream(await request.send());
      if (response.body != null) {
        if (response.statusCode == 200) {
          result = jsonDecode(response.body);
        } else if (response.statusCode == 404) {
          result = {'status_code': 400, 'message': '404'};
        } else if (response.statusCode == 401) {
          result = jsonDecode(response.body);
        }
      } else {
        result = {'status_code': 404, 'message': 'Unable to Connect to Server!'};
      }
    } catch (e) {
      result = http.Response(
        jsonEncode({e.toString()}),
        204,
        headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'},
      );
    }
    return
      result;
  }


  /// pastLeads
  static Future<http.Response> pastLeads() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(
      ApiUrl.pastLeads,
      headers: {'Authorization': 'Bearer $token'},
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  /// goldWeight
  static Future<http.Response> goldWeight() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(
      ApiUrl.goldWeight,
      headers: {'Authorization': 'Bearer $token'},
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  /// pastLoanTime
  static Future<http.Response> pastLoanTime() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(
      ApiUrl.pastLoanTime,
      headers: {'Authorization': 'Bearer $token'},
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  /// residenceType
  static Future<http.Response> residenceType() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(
      ApiUrl.residenceType,
      headers: {'Authorization': 'Bearer $token'},
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  /// vehicleCompany
  static Future<http.Response> vehicleCompany() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(
      ApiUrl.vehicleCompany,
      headers: {'Authorization': 'Bearer $token'},
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  /// vehicleModel
  static Future<http.Response> vehicleModel(String vehicleId) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(ApiUrl.vehicleModel, headers: {'Authorization': 'Bearer $token'}, body: {"vehicle_id": vehicleId});
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  /// vehicleVariant
  static Future<http.Response> vehicleVariant(String vehicleId, String modelId) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(ApiUrl.vehicleVariant, headers: {'Authorization': 'Bearer $token'}, body: {"vehicle_id": vehicleId, "model_id": modelId});
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  /// productType
  static Future<http.Response> productType() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(
      ApiUrl.productType,
      headers: {'Authorization': 'Bearer $token'},
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  /// addFeedBack
  static Future<http.Response> addFeedBack(String message, String rating) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(
      ApiUrl.addFeedBack,
      headers: {'Authorization': 'Bearer $token'},
      body: {
        "description": message,
        "rating": rating,
      },
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  /// queryReasonList
  static Future<http.Response> queryReasonList() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(
      ApiUrl.queryReasonList,
      headers: {'Authorization': 'Bearer $token'},
      body: {
        "reason_type": "query"
      },
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  /// querySubmit
  static Future<http.Response> querySubmit(String leadId,
      String message,
      String reasonId,) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(
      ApiUrl.querySubmit,
      headers: {'Authorization': 'Bearer $token'},
      body: {
        "lead_id": leadId,
        "message": message,
        "reason_id": reasonId,
      },
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  /// queryList
  static Future<http.Response> queryList(String leadId) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(
      ApiUrl.queryList,
      headers: {'Authorization': 'Bearer $token'},
      body: {
        "lead_id": leadId,
      },
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  /// leadDocumentList
  static Future<http.Response> leadDocumentList(String leadId) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(
      ApiUrl.leadDocumentList,
      headers: {'Authorization': 'Bearer $token'},
      body: {
        "lead_id": leadId,
      },
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  /// reasonList
  static Future<http.Response> reasonList() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(
      ApiUrl.reasonList,
      headers: {'Authorization': 'Bearer $token'},
      body: {
        "reason_type": "appointment"
      },
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }
  /// appointmentsDetails
  static Future<http.Response> appointmentsDetails(String appointmentId) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(
      ApiUrl.appointmentsDetails,
      headers: {'Authorization': 'Bearer $token'},
      body: {
        "appointment_id": appointmentId
      },
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }
  /// leadDocumentDelete
  static Future<http.Response> leadDocumentDelete(String documentId) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(
      ApiUrl.leadDocumentDelete,
      headers: {'Authorization': 'Bearer $token'},
      body: {
        "document_id": documentId
      },
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

}
