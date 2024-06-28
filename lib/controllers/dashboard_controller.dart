import 'dart:convert';

import 'package:get/get.dart';
import 'package:wireframe/constants/util.dart';
import 'package:wireframe/models/blog_details_model.dart';
import 'package:wireframe/models/blog_list_model.dart';
import 'package:wireframe/models/dashboard_model.dart';
import 'package:wireframe/service/api_logs.dart';
import 'package:wireframe/service/api_service.dart';

class DashboardController extends GetxController implements GetxService {
  var bannerList = <Banner>[];
  var loanTypeList = <Loantype>[];
  var loanMainTypeList = <Loantype>[];
  var testimonialList = <Testimonial>[];
  bool loading = false;
  var blogList = <BlogListModel>[];
  BlogDetailsModel? blogDetailsModel;
  var notificationCont = "".obs;

  Future<void> markAsRead() async {
    try {
      var result = await ApiService.markAsRead();
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        getContNotification();
      } else {
        errorToast(json["message"].toString());
      }
    } catch (e) {
      Log.console(e.toString());
    }
    update();
  }

  Future<void> getContNotification() async {
    try {
      var result = await ApiService.dashboardApi();
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        notificationCont.value = json["notification_count"].toString();
      } else {}
    } catch (e) {
      Log.console(e.toString());
    }
    update();
  }

  Future<void> dashboard() async {
    try {
      loading = true;
      bannerList.clear();
      loanTypeList.clear();
      loanMainTypeList.clear();
      testimonialList.clear();
      var result = await ApiService.dashboardApi();
      var json = jsonDecode(result.body);
      final apiResponse = DashboardModel.fromJson(json);
      if (apiResponse.status == true) {
        loading = false;
        bannerList.addAll(apiResponse.banner!);
        loanTypeList.addAll(apiResponse.loanShorttype!);
        loanMainTypeList.addAll(apiResponse.loantype!);
        testimonialList.addAll(apiResponse.testimonial!);
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

  Future<void> blogListGet() async {
    try {
      loading = true;
      blogList.clear();
      var result = await ApiService.blogsListGet();
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        loading = false;
        blogList = List<BlogListModel>.from(json['data'].map((i) => BlogListModel.fromJson(i))).toList(growable: true);
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

  Future<void> blogDetailsGet(String id) async {
    try {
      loading = true;
      var result = await ApiService.blogDetailsGet(id);
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        loading = false;
        blogDetailsModel = BlogDetailsModel.fromJson(json["data"]);
      } else {
        loading = false;
        errorToast(json["message"].toString());
      }
    } catch (e) {
      loading = false;
    }
    update();
  }
}
