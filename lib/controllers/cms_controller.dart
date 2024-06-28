import 'dart:convert';

import 'package:get/get.dart';
import 'package:wireframe/constants/util.dart';
import 'package:wireframe/models/about_us_model.dart';
import 'package:wireframe/service/api_logs.dart';
import 'package:wireframe/service/api_service.dart';

class CMSController extends GetxController implements GetxService {
  var aboutUs = AboutUs().obs;
  bool isLoading = false;
  var contant ="";
  Future<void> cmsGet(String type) async {
    isLoading = true;
    try {
      var result = await ApiService.cmsPages(type);
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        isLoading = false;
        if(type=="about_us"){
          AboutUs aboutModel = AboutUs.fromJson(json['data']);
          aboutUs.value = aboutModel;
        }else{
          contant=json["data"]["privacy_policy"].toString();
        }

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
  Future<void> companyPolicy() async {
    isLoading = true;
    try {
      var result = await ApiService.companyPolicy();
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        isLoading = false;
        AboutUs aboutModel = AboutUs.fromJson(json['data']);
        aboutUs.value = aboutModel;
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
