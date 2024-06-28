import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/constants/util.dart';
import 'package:wireframe/controllers/user_controller.dart';
import 'package:wireframe/models/other_doc_model.dart';
import 'package:wireframe/models/user_model.dart';
import 'package:wireframe/service/api_logs.dart';
import 'package:wireframe/service/api_service.dart';

class DGLockerController extends GetxController implements GetxService {
  Rx<File> panCard = File("").obs;
  Rx<File> aadhaarCard = File("").obs;
  Rx<File> drivingLicence = File("").obs;
  //Rx<File> otherDocuments = File("").obs;
  Rx<File> aadhaarCardBack = File("").obs;
  UserController user = Get.put(UserController());
  TextEditingController aadhaarNo = TextEditingController();
  TextEditingController panCardNo = TextEditingController();
  TextEditingController drivingNo = TextEditingController();
  TextEditingController bankAcNo = TextEditingController();
  TextEditingController ifscCode = TextEditingController();
  TextEditingController bankName = TextEditingController();
  //TextEditingController docName = TextEditingController();
  //TextEditingController docNo = TextEditingController();
  var bankDetails = [].obs;
  final ImagePicker imagePicker = ImagePicker();
  List<OtherDocModel> otherDocList = [];
  List<String> docName = [];
  List<String> docNo = [];
  List<String> otherDocuments = [];
  List<String> updateImages = List<String>.empty(growable: true);

  bool validateIFSC(String ifsc) {
    String pattern = r'^[A-Za-z]{4}0[A-Za-z0-9]{6}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(ifsc);
  }

  bool validatePAN(String pan) {
    String pattern = r'^[A-Z]{5}[0-9]{4}[A-Z]$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(pan);
  }

  bool validateDrivingLicense(String license) {
    String pattern = r'^[A-Z]{2}[0-9]{2}[0-9]{4}[0-9A-Z]{7}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(license);
  }

  bool validateAadhaar(String str) {
    String regex = r'^[2-9]{1}[0-9]{3}\s[0-9]{4}\s[0-9]{4}$';

    final p = RegExp(regex);
    if (str == null) {
      return false;
    }

    final m = p.hasMatch(str);
    return m;
  }

  /*bool validateAadhaar(String aadhaar) {
    // Define the regular expression pattern for Aadhaar number validation
    String pattern = r'^\d{12}$';
    // Create a regular expression object
    RegExp regExp = RegExp(pattern);

    // Check if the input matches the regular expression
    if (!regExp.hasMatch(aadhaar)) {
      return false;
    }

    // Verhoeff Algorithm tables
    final List<List<int>> d = [
      [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 0, 6, 7, 8, 9, 5],
      [2, 3, 4, 0, 1, 7, 8, 9, 5, 6],
      [3, 4, 0, 1, 2, 8, 9, 5, 6, 7],
      [4, 0, 1, 2, 3, 9, 5, 6, 7, 8],
      [5, 9, 8, 7, 6, 0, 4, 3, 2, 1],
      [6, 5, 9, 8, 7, 1, 0, 4, 3, 2],
      [7, 6, 5, 9, 8, 2, 1, 0, 4, 3],
      [8, 7, 6, 5, 9, 3, 2, 1, 0, 4],
      [9, 8, 7, 6, 5, 4, 3, 2, 1, 0]
    ];

    final List<List<int>> p = [
      [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 5, 7, 6, 2, 8, 3, 0, 9, 4],
      [2, 8, 0, 7, 6, 1, 9, 4, 5, 3],
      [3, 9, 1, 0, 8, 6, 4, 2, 7, 5],
      [4, 3, 2, 8, 0, 9, 1, 7, 6, 5],
      [5, 4, 8, 9, 7, 0, 2, 6, 3, 1],
      [6, 2, 9, 1, 3, 4, 0, 5, 8, 7],
      [7, 6, 3, 2, 1, 5, 8, 9, 0, 4],
      [8, 7, 4, 3, 5, 2, 6, 1, 0, 9],
      [9, 0, 6, 4, 1, 3, 7, 8, 5, 2]
    ];

    final List<int> inv = [0, 4, 3, 2, 1, 5, 6, 7, 8, 9];

    // Verhoeff Algorithm implementation
    int c = 0;
    int len = aadhaar.length;
    for (int i = 0; i < len; i++) {
      c = d[c][p[(i % 8)][int.parse(aadhaar[len - i - 1])]];
    }

    return c == 0;
  }*/

  void addOtherDocList() {
    otherDocList.add(OtherDocModel(index: otherDocList.length));
    update();
  }

  Future<void> remoBikeImageFromDb(int index) async {
    int currentIndex = 1;
    int imageId = 0;
    if (index > 0) {
      currentIndex = index - 1;
    }
    List<BankDetailsImg> updateImages = List<BankDetailsImg>.empty(growable: true);
    if (updateImages.isNotEmpty) {
      imageId = updateImages[currentIndex].id!;
    }

    if (imageId != 0) {
      // var response = await ApiServices.deleteBikeImage(imageId.toString());
    }
    if (bankDetails.isNotEmpty) {
      bankDetails.removeAt(index);
    }
    update();
  }

  Future<void> removeImages(int index) async {
    if (bankDetails.isNotEmpty) {
      bankDetails.removeAt(index);
    }
    update();
  }

  Future<void> selectImages() async {
    final List<XFile> selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages.length > 3) {
      errorToast("Max ScreenShot Image limit is 3");
    } else {
      if (selectedImages.isNotEmpty) {
        if (selectedImages.length + bankDetails.length > 4) {
          errorToast("Max ScreenShot Image limit is 3");
        } else {
          bankDetails.addAll(selectedImages);
        }
      }
    }
    update();
  }

  Future<void> uploadCustomerDocs() async {
    try {
      showProgress();
      var response = await ApiService.uploadCustomerDocs(
          aadhaarNo.text,
          panCardNo.text,
          drivingNo.text,
          bankAcNo.text,
          ifscCode.text,
          "",
          panCard != null ? panCard.value.path : "",
          aadhaarCard != null ? aadhaarCard.value.path : "",
          aadhaarCardBack != null ? aadhaarCardBack.value.path : "",
          drivingLicence != null ? drivingLicence.value.path : "",
          bankName.text,
          bankDetails,
          otherDocuments,
          docName,
          docNo);
      if (response['status'] == true) {
        panCard.value = File("");
        aadhaarCard.value = File("");
        aadhaarCardBack.value = File("");
        drivingLicence.value = File("");
        bankDetails.clear();
        otherDocuments.clear();
        aadhaarNo.text = "";
        panCardNo.text = "";
        drivingNo.text = "";
        bankAcNo.text = "";
        ifscCode.text = "";
        bankName.text = "";
        docName.clear();
        docNo.clear();
        user.userProfileGet();
        closeProgress();
        Get.back();
        successToast(response['message'].toString());
      } else {
        closeProgress();
        errorToast(response['message'].toString());
      }
    } catch (e) {
      Log.console(e.toString());
      closeProgress();
    }
  }
}
