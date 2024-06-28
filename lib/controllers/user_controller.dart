import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/constants/util.dart';
import 'package:wireframe/models/document_list_model.dart';
import 'package:wireframe/models/user_model.dart';
import 'package:wireframe/screens/login_screen.dart';
import 'package:wireframe/service/api_logs.dart';
import 'package:wireframe/service/api_service.dart';

class UserController extends GetxController implements GetxService {
  var user = UserModel().obs;
  Rx<File> image = File("").obs;
  bool loading = false;
  var documentsList = <DocumentListModel>[];

  Future<void> userProfileGet() async {
    try {
      var result = await ApiService.userProfileGet();
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        UserModel userModel = UserModel.fromJson(json['data']);
        user.value = userModel;
      } else {
        errorToast(json["message"].toString());
      }
    } catch (e) {
      Log.console(e.toString());
    }
    update();
  }

  Future<ImageSource?> imagePickerSheet(context) async {
    ImageSource? source = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(bottom: 16, top: 16),
            color: Colors.white,
            height: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context, ImageSource.camera);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Icon(
                          Icons.camera_rounded,
                          color: primaryClNew,
                          size: 40,
                        ),
                        Text(
                          'Camera',
                          style: TextStyle(color: primaryClNew),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context, ImageSource.gallery);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Icon(
                          Icons.photo_rounded,
                          color: primaryClNew,
                          size: 40,
                        ),
                        Text('Gallery', style: TextStyle(color: primaryClNew)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
    return source;
  }

  void pickImage(BuildContext context) async {
    var source = await imagePickerSheet(context);
    if (source != null) {
      // ignore: invalid_use_of_visible_for_testing_member
      var picker = ImagePicker.platform;
      // ignore: deprecated_member_use
      var file = await picker.pickImage(
        source: source,
        maxHeight: 1080,
        maxWidth: 1080,
        imageQuality: 90,
      );
      image.value = File(file!.path);
    }
  }

  Future<void> updateProfile(String name, String mobile, String email) async {
    try {
      showProgress();
      var response = await ApiService.updateProfile(
        name,
        mobile,
        email,
        image != null ? image.value.path : "",
      );
      if (response['status'] == true) {
        image.value = File("");
        closeProgress();
        userProfileGet();
        Get.back();
        successToast(response['message'].toString());
      } else {
        closeProgress();
        errorToast(response['message'].toString());
      }
    } catch (e) {
      Log.console(e.toString());
      closeProgress();
      errorToast(e.toString());
    }
  }

  Future<void> logout() async {
    try {
      showProgress();
      var response = await ApiService.logout();
      var json = jsonDecode(response.body);
      if (json['status'] == true) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        await preferences.clear();
        Get.offAll(() => const LoginScreen());
        closeProgress();
        successToast(json['message'].toString());
      } else {
        closeProgress();
        errorToast(json['message'].toString());
      }
    } catch (e) {
      Log.console(e.toString());
      closeProgress();
      errorToast(e.toString());
    }
  }

  Future<void> documentsListGet() async {
    loading = true;
    try {
      var result = await ApiService.documentsList();
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        loading = false;
        documentsList = List<DocumentListModel>.from(json['data'].map((i) => DocumentListModel.fromJson(i))).toList(growable: true);
      } else {
        loading = false;
        errorToast(json["message"].toString());
      }
    } catch (e) {
      loading = false;
      Log.console(e.toString());
    }
    update();
  }
  Future<void> deleteAccountApi() async {
    try {
      showProgress();
      var response = await ApiService.deleteAccount();
      var json = jsonDecode(response.body);
      if (json['status'] == true) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        await preferences.clear();
        Get.offAll(() => const LoginScreen());
        closeProgress();
        successToast(json['message'].toString());
      } else {
        closeProgress();
        errorToast(json['message'].toString());
      }
    } catch (e) {
      Log.console(e.toString());
      closeProgress();
      errorToast(e.toString());
    }
  }
}
