import 'package:get/get.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/controllers/login_controller.dart';
import 'package:wireframe/screens/login_screen.dart';
import 'package:wireframe/widget/text_filled_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: screenBgCl,
      resizeToAvoidBottomInset: false,
      body: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  loginTop,
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 25),
                    child: Image.asset(
                      fiinzyLogo,
                      height: 21,
                      width: 50,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 27),
            RichText(
              text: const TextSpan(
                text: "Sign ",
                style: TextStyle(
                  color: secondary2Cl,
                  fontFamily: bold,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  fontSize: 21,
                ),
                children: [
                  TextSpan(
                    text: "Up",
                    style: TextStyle(color: primaryClNew),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 6),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFf2f4fa), // #F2F4FA
                    Color(0xFF106FFD), // #106FFD
                    Color(0xFFf2f4fa), // #F2F4FA
                  ],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                ),
              ),
              child: const Text(
                "Welcome To moneyverss",
                style: TextStyle(
                  color: whiteColor,
                  fontFamily: regular,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 22),
                child: Text(
                  "Full Name",
                  style: TextStyle(
                    color: textColorSec,
                    fontFamily: medium,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: MyTextFormField(
                controller: controller.name,
                hint: 'Enter Full Name',
                obscureText: false,
                readOnly: false,
                border: borderNewCl,
                validator: (v) {
                  if (v!.isEmpty) {
                    return "Enter Name";
                  }
                  return null;
                },
                fillColor: whiteColor,
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Material(
                    child: Image.asset(
                      userIc,
                      height: 18,
                      width: 18,
                      color: primaryClNew,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 22),
                child: Text(
                  "Mobile",
                  style: TextStyle(
                    color: textColorSec,
                    fontFamily: medium,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: MyTextFormField(
                controller: controller.mobile,
                counterText: "",
                hint: 'Enter mobile number',
                obscureText: false,
                readOnly: false,
                border: borderNewCl,
                fillColor: whiteColor,
                validator: (v) {
                  if (v!.isEmpty) {
                    return "Enter Mobile No.";
                  } else if (v.length < 10) {
                    return "Enter valid No most be 10 digit ";
                  }
                  return null;
                },
                maxLength: 10,
                keyboardType: TextInputType.number,
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Material(
                    child: Image.asset(
                      telephoneIc,
                      height: 18,
                      width: 18,
                      color: primaryClNew,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 22),
                child: Text(
                  "Email Address",
                  style: TextStyle(
                    color: textColorSec,
                    fontFamily: medium,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: MyTextFormField(
                controller: controller.email,
                counterText: "",
                hint: 'Enter email address',
                obscureText: false,
                readOnly: false,
                border: borderNewCl,
                fillColor: whiteColor,
                keyboardType: TextInputType.emailAddress,
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Material(
                    child: Image.asset(
                      emailI,
                      height: 18,
                      width: 18,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 60),
            GestureDetector(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  controller.signUP();
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF189DFF),
                      Color(0xFF0070C1),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                width: 200,
                height: 60,
                child: const Center(
                  child: Text(
                    "Send OPT",
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
            const SizedBox(height: 123),
            InkWell(
              onTap: () {
                Get.to(() => const LoginScreen());
              },
              child: RichText(
                text: const TextSpan(
                  text: "Already have account ? ",
                  style: TextStyle(
                    color: secondary2Cl,
                    fontFamily: regular,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 11,
                  ),
                  children: [
                    TextSpan(
                      text: "Login",
                      style: TextStyle(
                        color: secondaryCl,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        fontFamily: bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
