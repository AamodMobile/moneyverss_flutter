import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wireframe/constants/util.dart';
import 'package:wireframe/service/api_logs.dart';
import 'package:wireframe/service/api_service.dart';

class AddFeedBackController extends GetxController implements GetxService {
  TextEditingController message = TextEditingController();
  var rating = "".obs;

  Future<void> addFeedBackApi() async {
    showProgress();
    try {
      var result = await ApiService.addFeedBack(message.text, rating.value);
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        closeProgress();
        message.text = "";
        rating.value = "";
        Get.back();
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
}
