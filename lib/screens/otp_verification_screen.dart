import 'dart:async';

import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/constants/util.dart';
import 'package:wireframe/controllers/login_controller.dart';
import 'package:wireframe/service/api_logs.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  Timer? time;
  int sec = 60;
  LoginController controller = Get.put(LoginController());

  @override
  void initState() {
    start();
    super.initState();
  }

  @override
  void dispose() {
    time!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: screenBgCl,
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Image.asset(
                  loginTop,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.contain,
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                    child: Image.asset(
                      imgMoneyverssLogo,
                      height: 22,
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 29),
            RichText(
              text: const TextSpan(
                text: "OTP ",
                style: TextStyle(
                  color: primaryClNew,
                  fontFamily: bold,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  fontSize: 22,
                ),
                children: [
                  TextSpan(
                    text: "Verification",
                    style: TextStyle(color: secondary2Cl),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "Enter the -4 Digit Number That We send\n To (+91) ${controller.mobileV}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: textGeryCl,
                fontFamily: regular,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 53),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.70,
              height: 47,
              child: PinCodeTextField(
                cursorColor: primaryClNew,
                keyboardType: TextInputType.number,
                obscureText: false,
                obscuringCharacter: "*",
                textStyle: const TextStyle(
                  color: greyNew,
                  fontSize: 14,
                  fontFamily: medium,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                ),
                pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(10),
                    fieldHeight: 47,
                    fieldWidth: 53,
                    disabledColor: primaryClNew,
                    fieldOuterPadding: const EdgeInsets.symmetric(horizontal: 4),
                    selectedFillColor: whiteColor,
                    inactiveFillColor: whiteColor,
                    activeFillColor: whiteColor,
                    activeColor: primaryClNew,
                    inactiveColor: primaryClNew,
                    errorBorderColor: primaryClNew,
                    selectedColor: primaryClNew,
                    borderWidth: 0.5),
                appContext: context,
                length: 4,
                onChanged: (String value) {
                  controller.otpV = value;
                  Log.console(value);
                },
              ),
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: () {
                if (sec == 0) {
                } else {}
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 56.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    sec != 0 ? "00:$sec" : "Resend OTP",
                    style: const TextStyle(
                      color: secondaryCl,
                      fontFamily: medium,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 52),
            GestureDetector(
              onTap: () {
                if (controller.otpV.isEmpty) {
                  errorToast("Please Enter OTP");
                } else if (controller.otpV.length < 4) {
                  errorToast("Please Enter OTP Valid");
                } else {
                  controller.verifyOtp();
                }
                time?.cancel();
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: const LinearGradient(colors: [
                      Color(0xFF189DFF),
                      Color(0xFF0070C1),
                    ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
                width: 200,
                height: 46,
                child: const Center(
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      color: whiteColor,
                      fontFamily: medium,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void start() {
    sec = 60;
    time = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (sec == 0) {
        time?.cancel();
      } else {
        setState(() {
          sec--;
        });
      }
    });
  }
}
