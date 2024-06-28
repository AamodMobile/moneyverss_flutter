import 'dart:convert';
import 'package:get/get.dart';
import 'package:wireframe/constants/util.dart';
import 'package:wireframe/models/create_lead_model.dart';
import 'package:wireframe/models/loan_offer_list_model.dart';
import 'package:wireframe/screens/my_appointment/my_appointment.dart';
import 'package:wireframe/screens/thank_you_screen.dart';
import 'package:wireframe/service/api_logs.dart';
import 'package:wireframe/service/api_service.dart';

class LoanOfferController extends GetxController implements GetxService {
  var loanOfferDataList = <LoanOfferData>[];
  bool loading = false;

  Future<void> getLoanOfferList(
    String bankId,
    String loanTypeId,
    String loanSubTypeId,
    String loanAmountId,
  ) async {
    try {
      loanOfferDataList.clear();
      loading = true;
      var result = await ApiService.loanOfferListApi(bankId, loanTypeId, loanSubTypeId, loanAmountId);
      var json = jsonDecode(result.body);
      final apiResponse = LoanOfferListModel.fromJson(json);
      if (apiResponse.status == true) {
        loading = false;
        loanOfferDataList.clear();
        loanOfferDataList.addAll(apiResponse.data!);
      } else {
        loading = false;
        errorToast(apiResponse.message.toString());
      }
    } catch (e) {
      loading = false;
      Log.console(e.toString());
    }
    update();
  }

  Future<void> createLead(
    String loanTypeId,
    String loanSubTypeId,
    String employementTypeId,
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
    String topupAmount,
    bool bookNow,
  ) async {
    try {
      showProgress();
      var result = await ApiService.createLeadApi(
        loanTypeId,
        loanSubTypeId,
        employementTypeId,
        annualIncomeId,
        bankId,
        loanAmountId,
        cityId,
        loanOfferId,
        stateId,
        loanTenureId,
        annualTurnoverId,
        companyName,
        companyTypeId,
        businessYearId,
        isAppointment,
        pastLoanTime,
        isTopup,
        existingBank,
        residenceType,
        goldWeight,
        vehicleCompany,
        vehicleModel,
        vehicleVariant,
        productType,
        yearOfManufacturer,
        topupAmount,
      );
      var json = jsonDecode(result.body);
      final apiResponse = CreateLeadModel.fromJson(json);
      if (apiResponse.status == true) {
        closeProgress();
        if (bookNow) {
          Get.to(() => const MyAppointment(
                isNew: true,
                id: "",
              ));
        } else {
          Get.off(() => ThankYouScreen(
                referenceId: apiResponse.referenceId.toString(),
                msg: apiResponse.message.toString(),
              ));
        }
      } else {
        closeProgress();
        errorToast(apiResponse.message.toString());
      }
    } catch (e) {
      closeProgress();
      Log.console(e.toString());
    }
    update();
  }
}
