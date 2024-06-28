import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wireframe/constants/util.dart';
import 'package:wireframe/models/query_list_model.dart';
import 'package:wireframe/models/query_reason_list_model.dart';
import 'package:wireframe/service/api_logs.dart';
import 'package:wireframe/service/api_service.dart';

class QueryController extends GetxController implements GetxService {
  TextEditingController message = TextEditingController();
  var queryReasonList = <QueryReasonListModel>[];
  var queryList = <QueryListModel>[];
  bool isLoading = false;
  var selectedReason;

  Future<void> queryReasonListGet() async {
    message.text="";
    selectedReason=null;
    queryReasonList.clear();
    try {
      isLoading = true;
      var result = await ApiService.queryReasonList();
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        isLoading = false;
        queryReasonList = List<QueryReasonListModel>.from(json["data"].map((i) => QueryReasonListModel.fromJson(i))).toList();
      } else {
        isLoading = false;
        errorToast(json["message"].toString());
      }
    } catch (e) {
      isLoading = false;
      Log.console(e.toString());
    }
    update();
  }

  Future<void> submitQuery(String leadId) async {
    try {
      showProgress();
      var result = await ApiService.querySubmit(leadId, message.text, selectedReason.id.toString());
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        closeProgress();
        Get.back();
        queryListGet(leadId);
        successToast(json["message"].toString());
      } else {
        closeProgress();
        errorToast(json["message"].toString());
      }
    } catch (e) {
      closeProgress();
      Log.console(e.toString());
    }
    update();
  }
  Future<void> queryListGet(String leadId) async {
    try {
      isLoading = true;
      var result = await ApiService.queryList(leadId);
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        isLoading = false;
       queryList = List<QueryListModel>.from(json["data"].map((i) => QueryListModel.fromJson(i))).toList();
      } else {
        isLoading = false;
        errorToast(json["message"].toString());
      }
    } catch (e) {
      isLoading = false;
      Log.console(e.toString());
    }
    update();
  }
}
