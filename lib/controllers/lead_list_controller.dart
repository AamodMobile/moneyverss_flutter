import 'dart:convert';
import 'package:get/get.dart';
import 'package:wireframe/constants/util.dart';
import 'package:wireframe/models/document_list_new_model.dart';
import 'package:wireframe/models/lead_list_model.dart';
import 'package:wireframe/models/status_model.dart';
import 'package:wireframe/service/api_logs.dart';
import 'package:wireframe/service/api_service.dart';

class LeadListController extends GetxController implements GetxService {
  var leadDataList = <LeadData>[];
  var pastLeadList = <LeadData>[];
  bool isLoading = false;
  var statusList = <Status>[];
  var subStatusList = <Status>[];
  var documentsList = <DocumentsList>[];
  var leadDetails = LeadData().obs;
  var documentsNewList = <DocumentsNewList>[];
  Future<void> getLeadList() async {
    try {
      isLoading = true;
      leadDataList.clear();
      var result = await ApiService.leadListApi();
      var json = jsonDecode(result.body);
      final apiResponse = LeadListModel.fromJson(json);
      if (apiResponse.status == true) {
        isLoading = false;
        leadDataList.addAll(apiResponse.data!);
      } else {
        isLoading = false;
        errorToast(apiResponse.message.toString());
      }
    } catch (e) {
      isLoading = false;
      Log.console(e.toString());
    }
    update();
  }

  Future<void> getPastLeads() async {
    try {
      isLoading = true;
      pastLeadList.clear();
      var result = await ApiService.pastLeads();
      var json = jsonDecode(result.body);
      final apiResponse = LeadListModel.fromJson(json);
      if (apiResponse.status == true) {
        isLoading = false;
        pastLeadList.addAll(apiResponse.data!);
      } else {
        isLoading = false;
        errorToast(apiResponse.message.toString());
      }
    } catch (e) {
      isLoading = false;
      Log.console(e.toString());
    }
    update();
  }

  Future<void> getLoanStatusHistory(String id) async {
    isLoading = true;
    try {
      var result = await ApiService.loanStatusHistory(id);
      var json = jsonDecode(result.body);
      final apiResponse = StatusModel.fromJson(json);
      if (json["status"] == true) {
        isLoading = false;
        statusList = apiResponse.data!;
        documentsList = apiResponse.documentsList!;
        leadDetails.value = apiResponse.leadDetail!;
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

  Future<void> uploadDocuments(var id, var document,String idLead) async {
    try {
      showProgress();
      var result = await ApiService.uploadDocument(id, document,idLead);
      print(result.toString());
      if (result["status"] == true) {
        closeProgress();
        successToast(result["message"].toString());
        getLoanStatusHistory(idLead);
        leadDocumentList(idLead);
      } else {
        closeProgress();
        errorToast(result["message"].toString());
      }
    } catch (e) {
      closeProgress();
      Log.console(e.toString());
    }
    update();
  }
  Future<void> leadDocumentList(String id) async {
    isLoading = true;
    try {
      documentsNewList.clear();
      var result = await ApiService.leadDocumentList(id);
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        isLoading = false;
        documentsNewList = List<DocumentsNewList>.from(json['documents_list'].map((i) => DocumentsNewList.fromJson(i))).toList(growable: true);
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
  Future<void> leadDocumentDelete(String id,String idLead) async {
    showProgress();
    try {
      var result = await ApiService.leadDocumentDelete(id);
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        closeProgress();
        getLoanStatusHistory(idLead);
        leadDocumentList(idLead);
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
}
