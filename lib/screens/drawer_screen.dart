import 'dart:io';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/screens/cms_screen.dart';
import 'package:wireframe/screens/dashboard_screen.dart';
import 'package:wireframe/screens/notification_screen.dart';
import 'login_screen.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  bool isLoan = false;
  bool isTool = false;
  bool isMore = false;
  bool isCustomerService = false;
  @override
  Widget build(BuildContext context) {
    return
      SafeArea(
      child: Drawer(
        width: MediaQuery.of(context).size.width * 0.85,
        backgroundColor: whiteColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                color: homeBgCl,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: whiteColor,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          userIc,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 25),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "User Name",
                            style: TextStyle(
                              color: draKText,
                              fontFamily: medium,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "+91 8420402001",
                            style: TextStyle(
                              color: borderNewCl,
                              fontFamily: regular,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DashBoardScreen(currentScreen: 0)),
                  );
                },
                child: Row(
                  children: [
                    const SizedBox(width: 30),
                    Image.asset(
                      homeNewIc,
                      height: 20,
                      width: 20,
                    ),
                    const SizedBox(width: 18),
                    const Text(
                      "Home",
                      style: TextStyle(
                        color: primaryClNew,
                        fontFamily: medium,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Divider(color: borderNewCl),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    Image.asset(
                      acoountCircle,
                      height: 20,
                      width: 20,
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    const Text(
                      "My Account",
                      style: TextStyle(
                        color: primaryClNew,
                        fontFamily: medium,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: borderNewCl,
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DashBoardScreen(currentScreen: 2)),
                  );
                },
                child: Row(
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    Image.asset(
                      scoreIc,
                      height: 20,
                      width: 20,
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    const Text(
                      "Credit Score",
                      style: TextStyle(
                        color: primaryClNew,
                        fontFamily: medium,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: borderNewCl,
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isLoan = !isLoan;
                  });
                },
                child: Row(
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    Image.asset(
                      loanIc,
                      height: 20,
                      width: 20,
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    const Text(
                      "Loans",
                      style: TextStyle(
                        color: primaryClNew,
                        fontFamily: medium,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: 12,
                      ),
                    ),
                    const Spacer(),
                    Image.asset(
                      isLoan ? arrowUpIc : arrowDownIc,
                      height: 6,
                      width: 10,
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                  ],
                ),
              ),
              isLoan
                  ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                      width: MediaQuery.of(context).size.width,
                    ),
                    const Text(
                      "Home Loan",
                      style: TextStyle(
                        color: draKText,
                        fontFamily: medium,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Mortgage Loan",
                      style: TextStyle(
                        color: draKText,
                        fontFamily: medium,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Business Loan",
                      style: TextStyle(
                        color: draKText,
                        fontFamily: medium,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Personal Loan",
                      style: TextStyle(
                        color: draKText,
                        fontFamily: medium,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              )
                  : const SizedBox(),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: borderNewCl,
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isTool = !isTool;
                  });
                  //Get.to(() => const SettingScreen());
                },
                child: Row(
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    Image.asset(
                      settingNewIc,
                      height: 20,
                      width: 18,
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    const Text(
                      "Tools",
                      style: TextStyle(
                        color: primaryClNew,
                        fontFamily: medium,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: 12,
                      ),
                    ),
                    const Spacer(),
                    Image.asset(
                      isTool ? arrowUpIc : arrowDownIc,
                      height: 6,
                      width: 10,
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                  ],
                ),
              ),
              isTool
                  ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                      width: MediaQuery.of(context).size.width,
                    ),
                    const Text(
                      "EMI Calculator",
                      style: TextStyle(
                        color: draKText,
                        fontFamily: medium,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Digi Locker",
                      style: TextStyle(
                        color: draKText,
                        fontFamily: medium,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              )
                  : const SizedBox(),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: borderNewCl,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isMore = !isMore;
                  });
                  //Get.to(() => const SettingScreen());
                },
                child: Row(
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    Image.asset(
                      moreNewIc,
                      height: 20,
                      width: 18,
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    const Text(
                      "More",
                      style: TextStyle(
                        color: primaryClNew,
                        fontFamily: medium,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: 12,
                      ),
                    ),
                    const Spacer(),
                    Image.asset(
                      isMore ? arrowUpIc : arrowDownIc,
                      height: 6,
                      width: 10,
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                  ],
                ),
              ),
              isMore
                  ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                      width: MediaQuery.of(context).size.width,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "Rate Us",
                        style: TextStyle(
                          color: draKText,
                          fontFamily: medium,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () async {
                        await Share.share('moneyverss  App Download From Play Store:-'
                            '\n https://play.google.com/store/apps/details?id=com.aamod.moneyverss"');
                      },
                      child: const Text(
                        "Share",
                        style: TextStyle(
                          color: draKText,
                          fontFamily: medium,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const CMSScreen(tittle: "Privacy policy"));
                      },
                      child: const Text(
                        "Privacy Policy",
                        style: TextStyle(
                          color: draKText,
                          fontFamily: medium,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const NotificationScreen());
                      },
                      child: const Text(
                        "Notification",
                        style: TextStyle(
                          color: draKText,
                          fontFamily: medium,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const CMSScreen(tittle: "About Us"));
                      },
                      child: const Text(
                        "About",
                        style: TextStyle(
                          color: draKText,
                          fontFamily: medium,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              )
                  : const SizedBox(),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: borderNewCl,
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isCustomerService = !isCustomerService;
                  });
                  // Get.to(() => const SupportScreen());
                },
                child: Row(
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    Image.asset(
                      supportNewIc,
                      height: 20,
                      width: 18,
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    const Text(
                      "Customer Service",
                      style: TextStyle(
                        color: primaryClNew,
                        fontFamily: medium,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: 12,
                      ),
                    ),
                    const Spacer(),
                    Image.asset(
                      isCustomerService ? arrowUpIc : arrowDownIc,
                      height: 6,
                      width: 10,
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                  ],
                ),
              ),
              isCustomerService
                  ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                      width: MediaQuery.of(context).size.width,
                    ),
                    GestureDetector(
                      onTap: () {

                      },
                      child: const Text(
                        "Feedback",
                        style: TextStyle(
                          color: draKText,
                          fontFamily: medium,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: ()  {

                      },
                      child: const Text(
                        "Grievance Redressal officer",
                        style: TextStyle(
                          color: draKText,
                          fontFamily: medium,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: ()  {

                      },
                      child: const Text(
                        "Support",
                        style: TextStyle(
                          color: draKText,
                          fontFamily: medium,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              )
                  : const SizedBox(),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: borderNewCl,
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  logoutDialog();
                },
                child: Row(
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    Image.asset(
                      logoutNewIc,
                      height: 20,
                      width: 18,
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    const Text(
                      "Logout",
                      style: TextStyle(
                        color: primaryClNew,
                        fontFamily: medium,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "App version=0.01",
                style: TextStyle(
                  color: textGeryCl,
                  fontFamily: medium,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
  void logoutDialog() {
    showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          elevation: 0,
          insetPadding: const EdgeInsets.symmetric(horizontal: 10),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Image.asset(
                      offIc,
                      height: 158,
                      width: 158,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Are You Sure you want To Logout ?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: medium,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 50),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(278, 47),
                        backgroundColor: primaryClNew,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(6),
                          ),
                        ),
                      ),
                      child: const Text(
                        "Yes, Logout",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: regular,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      onPressed: () async {
                        SharedPreferences preferences = await SharedPreferences.getInstance();
                        await preferences.clear();
                        Get.offAll(() => const LoginScreen());
                      },
                    ),
                    const SizedBox(height: 30),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const SizedBox(
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            color: draKText,
                            fontSize: 14,
                            fontFamily: regular,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> openStore() async {
    String packageName = 'com.aamod.moneyverss';
    String appStoreUrl = 'https://apps.apple.com/app/$packageName';
    String playStoreUrl = 'https://play.google.com/store/apps/details?id=$packageName';
    if (await canLaunchUrl(Uri.parse(appStoreUrl)) && !Platform.isAndroid) {
      await launchUrl(Uri.parse(appStoreUrl));
    } else if (await canLaunchUrl(Uri.parse(playStoreUrl)) && Platform.isAndroid) {
      await launchUrl(Uri.parse(playStoreUrl));
    } else {
      throw 'Could not launch store';
    }
  }
}
