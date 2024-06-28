import 'package:get/get.dart';
import 'package:wireframe/constants/constants.dart';

successToast(String msg) {
  Get.closeAllSnackbars();
  Get.snackbar(
    duration: const Duration(seconds: 2),
    '',
    msg,
    titleText: const SizedBox.shrink(),
    snackPosition: SnackPosition.TOP,
    backgroundColor: success,
    colorText: Colors.white,
    margin: const EdgeInsets.all(10),
  );
}

errorToast(String msg) {
  Get.closeAllSnackbars();
  Get.snackbar(
    duration: const Duration(seconds: 2),
    '',
    msg,
    titleText: const SizedBox.shrink(),
    snackPosition: SnackPosition.TOP,
    backgroundColor: redCl,
    colorText: Colors.white,
    margin: const EdgeInsets.all(10),
  );
}

showProgress() {
  Get.dialog(
      WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Image.asset(loadingGif),
              ),
            ),
          ],
        ),
      ),
      barrierDismissible: false);
}

closeProgress() {
  if (Get.isDialogOpen ?? false) {
    Get.back();
  }
}
