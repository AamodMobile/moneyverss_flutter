import 'dart:convert';

import 'package:get/get.dart';
import 'package:wireframe/constants/util.dart';
import 'package:wireframe/models/appointment_details_model.dart';
import 'package:wireframe/models/appointment_list_model.dart';
import 'package:wireframe/models/reason_list_model.dart';
import 'package:wireframe/models/time_slot_model.dart';
import 'package:wireframe/screens/dashboard_screen.dart';
import 'package:wireframe/service/api_logs.dart';
import 'package:wireframe/service/api_service.dart';

class AppointmentController extends GetxController implements GetxService {
  bool isLoading = false;
  bool noData = false;
  var appointmentList = <AppointmentListModel>[];
  var timeSlots = <TimeSlotModel>[].obs;
  var timeSlotModel;
  var reasonList = <ReasonListModel>[].obs;
  var reasonListModel;
  var appointmentDetails = AppointmentDetailsModel();

  Future<void> createAppointmentApi(String appointmentDate, String appointmentTime, String message, var voiceFile, String reasonId) async {
    showProgress();
    try {
      var result = await ApiService.createAppointment(appointmentDate, appointmentTime, message, voiceFile, reasonId);
      if (result["status"] == true) {
        closeProgress();
        Get.offAll(() => const DashBoardScreen(currentScreen: 0));
        appointments();
        successToast(result["message"].toString());
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

  Future<void> appointments() async {
    isLoading = true;
    try {
      var result = await ApiService.appointments();
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        isLoading = false;
        appointmentList = List<AppointmentListModel>.from(json['data'].map((i) => AppointmentListModel.fromJson(i))).toList(growable: true);
      } else {
        isLoading = false;
        // errorToast(json["message"].toString());
      }
    } catch (e) {
      isLoading = false;
      Log.console(e.toString());
    }
    update();
  }

  Future<void> timeSlotsGet(String date) async {
    isLoading = true;
    try {
      timeSlotModel = null;
      timeSlots.clear();
      var result = await ApiService.timeSlots(date);
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        isLoading = false;
        timeSlots.value = List<TimeSlotModel>.from(json['data'].map((i) => TimeSlotModel.fromJson(i))).toList(growable: true);
      } else {
        isLoading = false;
        //errorToast(json["message"].toString());
      }
    } catch (e) {
      isLoading = false;
      Log.console(e.toString());
    }
    update();
  }

  Future<void> reasonListGet() async {
    isLoading = true;
    try {
      reasonListModel = null;
      reasonList.clear();
      var result = await ApiService.reasonList();
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        isLoading = false;
        reasonList.value = List<ReasonListModel>.from(json['data'].map((i) => ReasonListModel.fromJson(i))).toList(growable: true);
      } else {
        isLoading = false;
        //errorToast(json["message"].toString());
      }
    } catch (e) {
      isLoading = false;
      Log.console(e.toString());
    }
    update();
  }

  Future<void> cancelAppointment(String id) async {
    showProgress();
    try {
      var result = await ApiService.cancelAppointment(id);
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        closeProgress();
        successToast(json["message"].toString());
        appointments();
      } else {
        closeProgress();
        //errorToast(json["message"].toString());
      }
    } catch (e) {
      closeProgress();
      Log.console(e.toString());
    }
    update();
  }

  Future<void> rescheduleAppointment(String id, String appointmentDate, String appointmentTime, String message, var voiceFile, String reasonId) async {
    showProgress();
    try {
      var result = await ApiService.rescheduleAppointment(id, appointmentDate, appointmentTime, message, voiceFile, reasonId);
      if (result["status"] == true) {
        closeProgress();
        Get.back();
        successToast(result["message"].toString());
        appointments();
      } else {
        closeProgress();
        //errorToast(json["message"].toString());
      }
    } catch (e) {
      closeProgress();
      Log.console(e.toString());
    }
    update();
  }

  Future<void> appointmentsDetailsGet(String id) async {
    try {
      isLoading = true;
      var result = await ApiService.appointmentsDetails(id);
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        isLoading = false;
        noData = false;
        appointmentDetails = AppointmentDetailsModel.fromJson(json["data"]);
        successToast(json["message"].toString());
      } else {
        isLoading = false;
        noData = true;
        errorToast(json["message"].toString());
      }
    } catch (e) {
      isLoading = false;
      noData = true;
      Log.console(e.toString());
    }
    update();
  }
}
