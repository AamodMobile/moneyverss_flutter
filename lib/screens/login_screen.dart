import 'package:get/get.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/constants/util.dart';
import 'package:wireframe/controllers/login_controller.dart';
import 'package:wireframe/screens/cms_screen.dart';
import 'package:wireframe/screens/sign_up_screen.dart';
import 'package:wireframe/widget/text_filled_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  LoginController controller = Get.put(LoginController());
  bool isCheck = false;

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
                text: "Login/Sign ",
                style: TextStyle(
                  color: secondary2Cl,
                  fontFamily: bold,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  fontSize: 21,
                ),
                children: [
                  TextSpan(
                    text: "up",
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
                    Color(0xFFF2F4FA), // #F2F4FA
                    Color(0xFF0C98FF), // #106FFD
                    Color(0xFFF2F4FA), // #F2F4FA
                  ],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                ),
              ),
              child: const Text(
                "Welcome Back To Login",
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
                onChanged: (v) {
                  setState(() {
                    controller.nameV = v;
                  });
                },
                fillColor: whiteColor,
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Material(
                    child: Image.asset(
                      userIc,
                      height: 18,
                      width: 18,
                      color: borderNew,
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
            SizedBox(height:  MediaQuery.of(context).size.height * 0.01),
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
                onChanged: (v) {
                  setState(() {
                    controller.mobileV = v;
                  });
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
                      color: borderNew,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height:  MediaQuery.of(context).size.height * 0.03),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                children: [
                  LabeledCheckbox(
                    label: '',
                    value: isCheck,
                    onChanged: (v) {
                      setState(() {
                        isCheck = v;
                      });
                    },
                  ),
                  const SizedBox(width: 10),
                  Expanded(child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text: 'By proceeding. you agree to the  ',
                      style: Theme.of(context).textTheme.bodySmall,
                      children: <InlineSpan>[
                        WidgetSpan(
                            alignment: PlaceholderAlignment.baseline,
                            baseline: TextBaseline.alphabetic,
                            child: InkWell(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const CMSScreen(tittle: "Term and conditions"),
                                    ));
                              },
                              child: const Text(
                                "Terms & Conditions",
                                style: TextStyle(
                                    color: primaryClNew,
                                    fontFamily: regular,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    decoration: TextDecoration.underline
                                ),
                              ),
                            )
                        ),
                        TextSpan(
                          text: ' and ',
                        ),
                        WidgetSpan(
                            alignment: PlaceholderAlignment.baseline,
                            baseline: TextBaseline.alphabetic,
                            child: InkWell(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const CMSScreen(tittle: "Privacy policy"),
                                    ));
                              },
                              child: const Text(
                                "Privacy Policy",
                                style: TextStyle(
                                    color: primaryClNew,
                                    fontFamily: regular,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    decoration: TextDecoration.underline
                                ),
                              ),
                            )
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
            SizedBox(height:  MediaQuery.of(context).size.height * 0.06),
            GestureDetector(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  if (isCheck) {
                    controller.login();
                  } else {
                    errorToast("Please Check Term & Condition and Privacy Policy");
                  }
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF189DFF),
                      Color(0xFF0070C1),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
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
    ));
  }
}

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final bool value;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!value);
      },
      child: Container(
        height: 18,
        width: 18,
        decoration: BoxDecoration(
          color: value ? primaryClNew : Colors.white,
          border: Border.all(color: primaryClNew),
          borderRadius: BorderRadius.circular(2),
        ),
        child: value
            ? const Center(
                child: Icon(
                  Icons.done,
                  size: 14,
                  color: Colors.white,
                ),
              )
            : const Opacity(
                opacity: 0.0,
                child: Icon(
                  Icons.account_circle,
                  size: 14,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}
