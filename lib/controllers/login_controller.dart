import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/constants/util.dart';
import 'package:wireframe/models/login_model.dart';
import 'package:wireframe/models/verif_otp_model.dart';
import 'package:wireframe/screens/dashboard_screen.dart';
import 'package:wireframe/screens/otp_verification_screen.dart';
import 'package:wireframe/service/api_logs.dart';
import 'package:wireframe/service/api_service.dart';

class LoginController extends GetxController implements GetxService {
  TextEditingController name = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController otp = TextEditingController();
  TextEditingController email = TextEditingController();

  var nameV = "";
  var mobileV = "";
  var otpV = "";
  var emailV = "";

  Future<void> login() async {

    try {
      showProgress();
      var result = await ApiService.loginApi(nameV, mobileV);
      var json = jsonDecode(result.body);
      final apiResponse = LoginModel.fromJson(json);
      if (apiResponse.status == true) {
        closeProgress();
        successToast(apiResponse.message.toString());
        Get.to(() => const OTPVerificationScreen());
      } else {
        closeProgress();
        errorToast(apiResponse.message.toString());
      }
    } catch (e) {
      Log.console(e.toString());
    }
  }

  Future<void> signUP() async {
    try {
      showProgress();
      var result = await ApiService.signUpApi(nameV, mobileV, emailV);
      var json = jsonDecode(result.body);
      final apiResponse = LoginModel.fromJson(json);
      if (apiResponse.status == true) {
        closeProgress();
        successToast(apiResponse.message.toString());
        Get.to(() => const OTPVerificationScreen());
      } else {
        closeProgress();
        errorToast(apiResponse.message.toString());
      }
    } catch (e) {
      Log.console(e.toString());
    }
  }

  Future<void> verifyOtp() async {
    try {
      showProgress();
      var result = await ApiService.verifyOtpApi(nameV, mobileV, otpV);
      var json = jsonDecode(result.body);
      final apiResponse = VerifyOtpModel.fromJson(json);
      if (apiResponse.status == true) {
        closeProgress();
        var pref = await SharedPreferences.getInstance();
        await pref.setString(
          userProfile,
          jsonEncode(apiResponse.toJson()),
        );
        await pref.setString(accessToken, apiResponse.accessToken.toString());
        successToast(apiResponse.message.toString());
        Get.offAll(() => const DashBoardScreen(currentScreen: 0));
      } else {
        closeProgress();
        errorToast(apiResponse.message.toString());
      }
    } catch (e) {
      closeProgress();
      Log.console(e.toString());
    }
  }
}
