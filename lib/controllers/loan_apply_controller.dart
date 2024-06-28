import 'dart:convert';
import 'package:get/get.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/constants/util.dart';
import 'package:wireframe/models/annual_income_list_model.dart';
import 'package:wireframe/models/bank_list_model.dart';
import 'package:wireframe/models/business_typelist_model.dart';
import 'package:wireframe/models/business_year_model.dart';
import 'package:wireframe/models/city_list_model.dart';
import 'package:wireframe/models/employment_list_model.dart';
import 'package:wireframe/models/gold_list_model.dart';
import 'package:wireframe/models/loan_amt_range_model.dart';
import 'package:wireframe/models/loan_subtypelist_model.dart';
import 'package:wireframe/models/product_type_model.dart';
import 'package:wireframe/models/residence_type_model.dart';
import 'package:wireframe/models/state_list_model.dart';
import 'package:wireframe/models/vehicle_company_model.dart';
import 'package:wireframe/models/vehicle_model_list_model.dart';
import 'package:wireframe/models/vehicle_veriant_model.dart';
import 'package:wireframe/models/year_range_model.dart';
import 'package:wireframe/service/api_logs.dart';
import 'package:wireframe/service/api_service.dart';

class LoanApplyController extends GetxController implements GetxService {
  var loanSubTypeList = <LoanSubTypeData>[];
  var employmentList = <EmploymentData>[];
  var annualIncomeList = <AnnualIncomeData>[];
  var goldWeightList = <GoldWeightListModel>[].obs;
  var pastLoanList = <GoldWeightListModel>[].obs;
  var residenceTypeList = <ResidenceTypeModel>[].obs;
  var bankList = <BankData>[];
  var cityList = <CityData>[];
  var stateList = <StateListModel>[];
  var loanAmountRangeList = <LoanAmtRangData>[];
  var companyTypeList = <LoanAmtRangData>[];
  var businessTypeList = <BusinessData>[];
  var yearRangeList = <YearRangeModel>[].obs;
  var businessYearList = <BusinessYearModel>[].obs;
  List<Map<String, String>> selectCompanyTypeList = [];
  bool loading = false;
  var loanSubTypeId = "".obs;
  var employmentId = "".obs;
  var employmentTittle = "".obs;
  var annualIncomeId = "".obs;
  var annualTurnoverId = "".obs;
  var annualTrunId = "".obs;
  var selectedBusinessYear = "".obs;
  var bankId = "".obs;
  var cityId = "".obs;
  var stateId = "".obs;
  var propertyLocation = "".obs;
  var yearRangeId = "".obs;
  var yearRangeName = "".obs;
  var age = "".obs;
  var loanAmountRangeName = "".obs;
  var loanAmountRangeId = "".obs;
  var requireAmountType = "".obs;
  var goldValue = "".obs;
  var pastLoanTimeValue = "".obs;
  var selectedCurrentResidence = "".obs;
  BusinessData? selectCompanyType;
  TextEditingController companyName = TextEditingController();
  TextEditingController annualTurnoverText = TextEditingController();
  TextEditingController topupAmount = TextEditingController();
  var vehicleCompanyList = <VehicleCompanyModel>[].obs;
  var vehicleCompanyModel;
  var vehicleModelList = <VehicleModelModel>[].obs;
  var vehicleMModel;
  var vehicleVariantList = <VehicleVariantModel>[].obs;
  var vehicleVariantModel;
  var productTypeList = <ProductTypeModel>[].obs;
  var productTypeModel;
  var vehicleId = "".obs;
  var modelId = "".obs;
  var variantId = "".obs;
  var productTypeId = "".obs;
  TextEditingController yearOfManufacture = TextEditingController();

  void reset() {
    topupAmount.text="";
    requireAmountType.value="";
    loanSubTypeList.clear();
    employmentList.clear();
    annualIncomeList.clear();
    stateList.clear();
    bankList.clear();
    cityList.clear();
    loanAmountRangeList.clear();
    businessTypeList.clear();
    yearRangeList.clear();
    selectCompanyTypeList.clear();
    loading = false;
    loanSubTypeId.value = "";
    selectedBusinessYear.value = "";
    annualIncomeId.value = "";
    annualTurnoverId.value = "";
    bankId.value = "";
    cityId.value = "";
    propertyLocation.value = "";
    yearRangeId.value = "";
    yearRangeName.value = "";
    age.value = "";
    loanAmountRangeName.value = "";
    loanAmountRangeId.value = "";
    selectCompanyType = null;
    vehicleCompanyModel = null;
    vehicleMModel = null;
    vehicleVariantModel = null;
    productTypeModel = null;
    vehicleId.value = "";
    modelId.value = "";
    variantId.value = "";
    productTypeId.value = "";
    yearOfManufacture.text = "";
    requireAmountType.value = "";
    goldValue.value = "";
    pastLoanTimeValue.value = "";
    selectedCurrentResidence.value = "";
  }

  Future<void> getLoanSubTypeList(String loanTypeId) async {
    try {
      loading = true;
      var result = await ApiService.loanSubTypeListApi(loanTypeId);
      var json = jsonDecode(result.body);
      final apiResponse = LoanSubTypeListModel.fromJson(json);
      if (apiResponse.status == true) {
        closeProgress();
        loanSubTypeList.clear();
        loanSubTypeList.addAll(apiResponse.data!);
      } else {
        closeProgress();
        errorToast(apiResponse.message.toString());
      }
      loading = false;
    } catch (e) {
      loading = false;
      Log.console(e.toString());
    }
    update();
  }

  Future<void> getEmploymentList(String loanTypeId) async {
    try {
      loading = true;
      var result = await ApiService.employmentListApi(loanTypeId);
      var json = jsonDecode(result.body);
      final apiResponse = EmploymentListModel.fromJson(json);
      if (apiResponse.status == true) {
        closeProgress();
        employmentList.clear();
        employmentList.addAll(apiResponse.data!);
      } else {
        closeProgress();
        errorToast(apiResponse.message.toString());
      }
      loading = false;
    } catch (e) {
      loading = false;
      Log.console(e.toString());
    }
    update();
  }

  Future<void> getAnnualIncomeList(String loanTypeId, String employmentTypeId) async {
    try {
      loading = true;
      annualIncomeList.clear();
      var result = await ApiService.annualIncomeListApi(loanTypeId, employmentTypeId);
      var json = jsonDecode(result.body);
      final apiResponse = AnnualIncomeListModel.fromJson(json);
      if (apiResponse.status == true) {
        closeProgress();
        annualIncomeList.clear();
        annualIncomeList.addAll(apiResponse.data!);
      } else {
        closeProgress();
        errorToast(apiResponse.message.toString());
      }
      loading = false;
    } catch (e) {
      loading = false;
      Log.console(e.toString());
    }
    update();
  }

  Future<void> getAnnualTurnoverList(String loanTypeId, String employmentTypeId) async {
    try {
      loading = true;
      annualIncomeList.clear();
      var result = await ApiService.annualTurnoverList(loanTypeId, employmentTypeId);
      var json = jsonDecode(result.body);
      final apiResponse = AnnualIncomeListModel.fromJson(json);
      if (apiResponse.status == true) {
        closeProgress();
        annualIncomeList.clear();
        annualIncomeList.addAll(apiResponse.data!);
      } else {
        closeProgress();
        errorToast(apiResponse.message.toString());
      }
      loading = false;
    } catch (e) {
      loading = false;
      Log.console(e.toString());
    }
    update();
  }

  Future<void> getBankList() async {
    try {
      loading = true;
      var result = await ApiService.bankListApi();
      var json = jsonDecode(result.body);
      final apiResponse = BankListModel.fromJson(json);
      if (apiResponse.status == true) {
        closeProgress();
        bankList.clear();
        bankList.addAll(apiResponse.data!);
      } else {
        closeProgress();
        errorToast(apiResponse.message.toString());
      }
      loading = false;
    } catch (e) {
      loading = false;
      Log.console(e.toString());
    }
    update();
  }

  Future<void> getCityList(String id) async {
    try {
      loading = true;
      cityList.clear();
      cityId.value = "";
      propertyLocation.value = "";
      var result = await ApiService.cityListApi(id);
      var json = jsonDecode(result.body);
      final apiResponse = CityListModel.fromJson(json);
      if (apiResponse.status == true) {
        closeProgress();

        cityList.addAll(apiResponse.data!);
      } else {
        closeProgress();
        errorToast(apiResponse.message.toString());
      }
      loading = false;
    } catch (e) {
      loading = false;
      Log.console(e.toString());
    }
    update();
  }

  Future<void> getStateList() async {
    try {
      loading = true;
      stateList.clear();
      var result = await ApiService.stateListApi();
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        loading = false;
        stateList = List<StateListModel>.from(json['data'].map((i) => StateListModel.fromJson(i))).toList(growable: true);
      } else {
        loading = false;
        errorToast(json["message"].toString());
      }
    } catch (e) {
      loading = false;
      Log.console(e.toString());
    }
    update();
  }

  Future<void> getLoanAmountRangeList(String loanTypeId, String employementTypeId) async {
    try {
      loading = true;
      loanAmountRangeList.clear();
      var result = await ApiService.loanAmountRangeListApi(loanTypeId, employementTypeId);
      var json = jsonDecode(result.body);
      final apiResponse = LoadAmtRangeModel.fromJson(json);
      if (apiResponse.status == true) {
        closeProgress();
        loanAmountRangeList.clear();
        loanAmountRangeList.addAll(apiResponse.data!);
      } else {
        closeProgress();
        errorToast(apiResponse.message.toString());
      }
      loading = false;
    } catch (e) {
      loading = false;
      Log.console(e.toString());
    }
    update();
  }

  Future<void> getCompanyTypeList() async {
    try {
      loading = true;
      var result = await ApiService.companyTypeApi();
      var json = jsonDecode(result.body);
      final apiResponse = LoadAmtRangeModel.fromJson(json);
      if (apiResponse.status == true) {
        closeProgress();
        companyTypeList.clear();
        companyTypeList.addAll(apiResponse.data!);
      } else {
        closeProgress();
        errorToast(apiResponse.message.toString());
      }
      loading = false;
    } catch (e) {
      loading = false;
      Log.console(e.toString());
    }
    update();
  }

  Future<void> getBusinessTypeList() async {
    try {
      loading = true;
      var result = await ApiService.businessTypeListApi();
      var json = jsonDecode(result.body);
      final apiResponse = BusinessTypelistModel.fromJson(json);
      if (apiResponse.status == true) {
        closeProgress();
        businessTypeList.clear();
        businessTypeList.addAll(apiResponse.data!);
      } else {
        closeProgress();
        errorToast(apiResponse.message.toString());
      }
      loading = false;
    } catch (e) {
      loading = false;
      Log.console(e.toString());
    }
    update();
  }

  Future<void> getYearsRangeGetList(String loanTypeId, String employementTypeId) async {
    try {
      loading = true;
      yearRangeList.clear();
      var result = await ApiService.yearsRangeGet(loanTypeId, employementTypeId);
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        closeProgress();
        yearRangeList.value = List<YearRangeModel>.from(json['data'].map((i) => YearRangeModel.fromJson(i))).toList(growable: true);
      } else {
        closeProgress();
        errorToast(json["message"].toString());
      }
      loading = false;
    } catch (e) {
      loading = false;
      Log.console(e.toString());
    }
    update();
  }

  Future<void> businessYearsGetList(String loanTypeId) async {
    try {
      loading = true;
      businessYearList.clear();
      var result = await ApiService.businessYearsGet(loanTypeId);
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        closeProgress();
        businessYearList.value = List<BusinessYearModel>.from(json['data'].map((i) => BusinessYearModel.fromJson(i))).toList(growable: true);
      } else {
        closeProgress();
        errorToast(json["message"].toString());
      }
      loading = false;
    } catch (e) {
      loading = false;
      Log.console(e.toString());
    }
    update();
  }

  Future<void> goldWeightListGet() async {
    try {
      loading = true;
      goldWeightList.clear();
      var result = await ApiService.goldWeight();
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        closeProgress();
        goldWeightList.value = List<GoldWeightListModel>.from(json['data'].map((i) => GoldWeightListModel.fromJson(i))).toList(growable: true);
      } else {
        closeProgress();
        errorToast(json["message"].toString());
      }
      loading = false;
    } catch (e) {
      loading = false;
      Log.console(e.toString());
    }
    update();
  }

  Future<void> pastLoanTimeGet() async {
    try {
      loading = true;
      pastLoanList.clear();
      var result = await ApiService.pastLoanTime();
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        closeProgress();
        pastLoanList.value = List<GoldWeightListModel>.from(json['data'].map((i) => GoldWeightListModel.fromJson(i))).toList(growable: true);
      } else {
        closeProgress();
        errorToast(json["message"].toString());
      }
      loading = false;
    } catch (e) {
      loading = false;
      Log.console(e.toString());
    }
    update();
  }

  Future<void> residenceTypeGet() async {
    try {
      loading = true;
      residenceTypeList.clear();
      var result = await ApiService.residenceType();
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        closeProgress();
        residenceTypeList.value = List<ResidenceTypeModel>.from(json['data'].map((i) => ResidenceTypeModel.fromJson(i))).toList(growable: true);
      } else {
        closeProgress();
        errorToast(json["message"].toString());
      }
      loading = false;
    } catch (e) {
      loading = false;
      Log.console(e.toString());
    }
    update();
  }

  Future<void> vehicleCompanyGet() async {
    try {
      loading = true;
      vehicleCompanyList.clear();
      var result = await ApiService.vehicleCompany();
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        closeProgress();
        vehicleCompanyList.value = List<VehicleCompanyModel>.from(json['data'].map((i) => VehicleCompanyModel.fromJson(i))).toList(growable: true);
      } else {
        closeProgress();
        errorToast(json["message"].toString());
      }
      loading = false;
    } catch (e) {
      loading = false;
      Log.console(e.toString());
    }
    update();
  }

  Future<void> vehicleModelGet(String vehicleId) async {
    try {
      vehicleModelList.clear();
      var result = await ApiService.vehicleModel(vehicleId);
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        closeProgress();
        vehicleModelList.value = List<VehicleModelModel>.from(json['data'].map((i) => VehicleModelModel.fromJson(i))).toList(growable: true);
      } else {
        closeProgress();
        errorToast(json["message"].toString());
      }
      loading = false;
    } catch (e) {
      loading = false;
      Log.console(e.toString());
    }
    update();
  }

  Future<void> vehicleVariantGet(String vehicleId, String modelID) async {
    try {
      vehicleVariantList.clear();
      var result = await ApiService.vehicleVariant(vehicleId, modelID);
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        closeProgress();
        vehicleVariantList.value = List<VehicleVariantModel>.from(json['data'].map((i) => VehicleVariantModel.fromJson(i))).toList(growable: true);
      } else {
        closeProgress();
        errorToast(json["message"].toString());
      }
      loading = false;
    } catch (e) {
      loading = false;
      Log.console(e.toString());
    }
    update();
  }

  Future<void> productTypeGet() async {
    try {
      productTypeList.clear();
      var result = await ApiService.productType();
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        closeProgress();
        productTypeList.value = List<ProductTypeModel>.from(json['data'].map((i) => ProductTypeModel.fromJson(i))).toList(growable: true);
      } else {
        closeProgress();
        errorToast(json["message"].toString());
      }
      loading = false;
    } catch (e) {
      loading = false;
      Log.console(e.toString());
    }
    update();
  }
}
