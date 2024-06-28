import 'dart:convert';

import 'package:get/get.dart';
import 'package:wireframe/constants/util.dart';
import 'package:wireframe/models/notification_model.dart';
import 'package:wireframe/service/api_logs.dart';
import 'package:wireframe/service/api_service.dart';

class NotificationListController extends GetxController implements GetxService {
  bool isLoading = false;
  var notificationList = <NotificationModel>[];

  Future<void> notificationsGet() async {
    isLoading = true;
    notificationList.clear();
    try {
      var result = await ApiService.notificationsList();
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        isLoading = false;
        notificationList = List<NotificationModel>.from(json['data'].map((i) => NotificationModel.fromJson(i))).toList(growable: true);
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

  Future<void> deleteNotification() async {
    try {
      showProgress();
      var result = await ApiService.deleteNotification();
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        closeProgress();
        notificationList.clear();
        notificationsGet();
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
