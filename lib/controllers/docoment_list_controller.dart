import 'dart:convert';

import 'package:get/get.dart';
import 'package:wireframe/constants/util.dart';
import 'package:wireframe/models/about_us_model.dart';
import 'package:wireframe/models/document_list_model.dart';
import 'package:wireframe/models/faqs_model.dart';
import 'package:wireframe/service/api_logs.dart';
import 'package:wireframe/service/api_service.dart';

class FaqsController extends GetxController implements GetxService {
  var documentList = <DocumentListModel>[];
  bool isLoading = false;

  Future<void> documentsList() async {
    isLoading = true;
    try {
      var result = await ApiService.documentsList();
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        isLoading = false;
        documentList = List<DocumentListModel>.from(json['data'].map((i) => DocumentListModel.fromJson(i))).toList(growable: true);
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
