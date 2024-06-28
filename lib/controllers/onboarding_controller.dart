
import 'package:get/get.dart';
import 'package:wireframe/constants/constants.dart';

class OnBoardingController extends GetxController implements GetxService {
  var currentPage = 0.obs;
  final totalPages = 4.obs;

  var images = [sliderOneImg, sliderTwoImg, sliderThreeImg,sliderFourImg].obs;
  //var tittle = ["Unlock Your Financial Potential with us", "Make Information and best decision with us",].obs;
}