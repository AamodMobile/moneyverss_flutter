import 'dart:convert';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:wireframe/constants/util.dart';
import 'package:wireframe/models/bank_offers_model.dart';
import 'package:wireframe/models/employment_list_model.dart';
import 'package:wireframe/service/api_logs.dart';
import 'package:wireframe/service/api_service.dart';

import '../constants/constants.dart';

class BankOfferListController extends GetxController implements GetxService {
  var bankOfferList = <BankOffers>[];
  var employmentList = <EmploymentData>[];
  bool loading = false;
  TextEditingController monthlyIncome = TextEditingController();


  Future<void> getEmploymentList(String loanTypeId) async {
    employmentList.clear();
    try {
      loading = true;
      var result = await ApiService.employmentListApi(loanTypeId);
      var json = jsonDecode(result.body);
      final apiResponse = EmploymentListModel.fromJson(json);
      if (apiResponse.status == true) {
        closeProgress();
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
  Future<void> bankOfferListGet() async {
    try {
      loading = true;
      var result = await ApiService.bankOfferList();
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        loading = false;
        bankOfferList = List<BankOffers>.from(json['data'].map((i) => BankOffers.fromJson(i))).toList(growable: true);
      } else {
        loading = false;
        errorToast(json["message"].toString());
      }
    } catch (e) {
      loading = false;
      //Log(e.toString());
    }
    update();
  }
}
