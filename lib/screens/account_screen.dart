import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/controllers/user_controller.dart';
import 'package:wireframe/screens/cms_screen.dart';
import 'package:wireframe/screens/delete_account/delete_account_screen.dart';
import 'package:wireframe/screens/feedback_screen.dart';
import 'package:wireframe/screens/my_application_screen.dart';
import 'package:wireframe/screens/my_appointment/my_appointment_list.dart';
import 'package:wireframe/screens/new_support_screen.dart';
import 'package:wireframe/screens/profile_view_screen.dart';

import '../constants/get_device_type.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  UserController userController = Get.put(UserController());
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: Get.find<UserController>(),
        initState: (state) {
          Get.find<UserController>().userProfileGet();
        },
        builder: (contextCtr) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: GetDeviceType().getDeviceType(context) ? 40 : 20),
                        Container(
                          clipBehavior: Clip.none,
                          margin: const EdgeInsets.symmetric(horizontal: 18),
                          padding: EdgeInsets.symmetric(horizontal: GetDeviceType().getDeviceType(context) ? 20 : 10, vertical: GetDeviceType().getDeviceType(context) ? 35 : 25),
                          decoration: BoxDecoration(
                            color: Color(0xFFF1F9FF),
                            border: Border.all(color: Color(0xFFD4E6FF)),
                            borderRadius: BorderRadius.circular(GetDeviceType().getDeviceType(context) ? 15 : 10),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(GetDeviceType().getDeviceType(context) ? 4 : 2),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: whiteColor,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(GetDeviceType().getDeviceType(context) ? 40 : 30),
                                  child: userController.user.value.image != ""
                                      ? CachedNetworkImage(
                                          errorWidget: (context, url, error) => Image.asset(
                                            defult,
                                            fit: BoxFit.fill,
                                          ),
                                          fit: BoxFit.fill,
                                          height: GetDeviceType().getDeviceType(context) ? 40 : 30,
                                          width: GetDeviceType().getDeviceType(context) ? 40 : 30,
                                          imageUrl: userController.user.value.image.toString(),
                                          placeholder: (a, b) => const Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        )
                                      : Image.asset(
                                          defult,
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ),
                              SizedBox(width: GetDeviceType().getDeviceType(context) ? 10 : 6),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      contextCtr.user.value.customerName ?? "",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: medium,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: GetDeviceType().getDeviceType(context) ? 18 : 14,
                                      ),
                                    ),
                                    Text(
                                      "+91 ${contextCtr.user.value.mobileNo ?? ""}",
                                      style: TextStyle(
                                        color: borderNew,
                                        fontFamily: regular,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: GetDeviceType().getDeviceType(context) ? 16 : 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => const ProfileViewScreen());
                                },
                                child: Container(
                                  width: GetDeviceType().getDeviceType(context) ? 120 : 80,
                                  padding: EdgeInsets.symmetric(horizontal: GetDeviceType().getDeviceType(context) ? 15 : 10, vertical: GetDeviceType().getDeviceType(context) ? 11 : 6),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(color: primaryClNew),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Edit Profile",
                                      style: TextStyle(
                                        color: primaryClNew,
                                        fontFamily: regular,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: GetDeviceType().getDeviceType(context) ? 14 : 10,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 14),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: (){
                                    Get.to(() => const MyApplicationScreen());
                                  },
                                  child: Container(
                                    clipBehavior: Clip.none,
                                    padding: EdgeInsets.symmetric(horizontal: GetDeviceType().getDeviceType(context) ? 50 : 30, vertical: GetDeviceType().getDeviceType(context) ? 12 : 8),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFBF0EB),
                                      border: Border.all(color: Color(0xFFEBD4CA)),
                                      borderRadius: BorderRadius.circular(GetDeviceType().getDeviceType(context) ? 15 : 10),
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: GetDeviceType().getDeviceType(context) ? 44 : 32,
                                          width: GetDeviceType().getDeviceType(context) ? 44 : 32,
                                          padding: EdgeInsets.all(GetDeviceType().getDeviceType(context) ? 10 : 6),
                                          decoration: BoxDecoration(
                                            color: whiteColor,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                            fromIc,
                                            height: GetDeviceType().getDeviceType(context) ? 30 : 20,
                                            width: GetDeviceType().getDeviceType(context) ? 30 : 20,
                                            color: draKText,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          "My Application",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: semiBold,
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.normal,
                                            fontSize: GetDeviceType().getDeviceType(context) ? 16 : 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: GetDeviceType().getDeviceType(context) ? 20 : 16),
                              Expanded(
                                child: GestureDetector(
                                  onTap: (){
                                    Get.to(() => const MyAppointmentList());
                                  },
                                  child: Container(
                                    clipBehavior: Clip.none,
                                    padding: EdgeInsets.symmetric(horizontal: GetDeviceType().getDeviceType(context) ? 50 : 25, vertical: GetDeviceType().getDeviceType(context) ? 12 : 8),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFDFBEC),
                                      border: Border.all(color: Color(0xFFDED7A5)),
                                      borderRadius: BorderRadius.circular(GetDeviceType().getDeviceType(context) ? 15 : 10),
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: GetDeviceType().getDeviceType(context) ? 44 : 32,
                                          width: GetDeviceType().getDeviceType(context) ? 44 : 32,
                                          padding: EdgeInsets.all(GetDeviceType().getDeviceType(context) ? 10 : 6),
                                          decoration: BoxDecoration(
                                            color: whiteColor,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                            callIcNew,
                                            height: GetDeviceType().getDeviceType(context) ? 30 : 20,
                                            width: GetDeviceType().getDeviceType(context) ? 30 : 20,
                                            color: draKText,
                                          ),
                                        ),
                                        SizedBox(
                                          height: GetDeviceType().getDeviceType(context) ? 8 : 4,
                                        ),
                                        Text(
                                          "My Appointment",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: semiBold,
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.normal,
                                            fontSize: GetDeviceType().getDeviceType(context) ? 16 : 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: GetDeviceType().getDeviceType(context) ? 20 : 14),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: Text(
                            "OTHER INFORMATION",
                            style: TextStyle(
                              color: greyNew,
                              fontFamily: semiBold,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontSize: GetDeviceType().getDeviceType(context) ? 16 : 12,
                            ),
                          ),
                        ),
                        SizedBox(height: GetDeviceType().getDeviceType(context) ? 20 : 14),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: InkWell(
                            onTap: () {
                              shareApp();
                            },
                            child: SizedBox(
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all( GetDeviceType().getDeviceType(context) ? 10 : 6),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF0F0F0),
                                      borderRadius: BorderRadius.circular(6)
                                    ),
                                    child: Image.asset(
                                      shareIcNew,
                                      height: GetDeviceType().getDeviceType(context) ? 30 : 20,
                                      width: GetDeviceType().getDeviceType(context) ? 30 : 20,
                                      color: draKText,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: GetDeviceType().getDeviceType(context) ? 22 : 18, vertical: GetDeviceType().getDeviceType(context) ? 15 : 10),
                                    child: Text(
                                      "Share App",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: semiBold,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: GetDeviceType().getDeviceType(context) ? 18 : 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: GetDeviceType().getDeviceType(context) ? 22 : 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: InkWell(
                            onTap: () {
                              Get.to(() => const FeedBackScreen());
                            },
                            child: SizedBox(
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all( GetDeviceType().getDeviceType(context) ? 10 : 6),
                                    decoration: BoxDecoration(
                                        color: Color(0xFFF0F0F0),
                                        borderRadius: BorderRadius.circular(6)
                                    ),
                                    child: Image.asset(
                                      feedbackIc,
                                      height: GetDeviceType().getDeviceType(context) ? 30 : 20,
                                      width: GetDeviceType().getDeviceType(context) ? 30 : 20,
                                      color: draKText,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: GetDeviceType().getDeviceType(context) ? 22 : 18, vertical: GetDeviceType().getDeviceType(context) ? 15 : 10),
                                    child: Text(
                                      "FeedBack",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: semiBold,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: GetDeviceType().getDeviceType(context) ? 18 : 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: GetDeviceType().getDeviceType(context) ? 22 : 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: InkWell(
                            onTap: () {
                              openStore();
                            },
                            child: SizedBox(
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all( GetDeviceType().getDeviceType(context) ? 10 : 6),
                                    decoration: BoxDecoration(
                                        color: const Color(0xFFF0F0F0),
                                        borderRadius: BorderRadius.circular(6)
                                    ),
                                    child: Image.asset(
                                      rateIc,
                                      height: GetDeviceType().getDeviceType(context) ? 30 : 20,
                                      width: GetDeviceType().getDeviceType(context) ? 30 : 20,
                                      color: draKText,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: GetDeviceType().getDeviceType(context) ? 22 : 18, vertical: GetDeviceType().getDeviceType(context) ? 15 : 10),
                                    child: Text(
                                      "Rate Us",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: semiBold,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: GetDeviceType().getDeviceType(context) ? 18 : 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: GetDeviceType().getDeviceType(context) ? 22 : 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: InkWell(
                            onTap: () {
                              Get.to(() => const NewSupportScreen());
                            },
                            child: SizedBox(
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all( GetDeviceType().getDeviceType(context) ? 10 : 6),
                                    decoration: BoxDecoration(
                                        color: Color(0xFFF0F0F0),
                                        borderRadius: BorderRadius.circular(6)
                                    ),
                                    child: Image.asset(
                                      supIc,
                                      height: GetDeviceType().getDeviceType(context) ? 30 : 20,
                                      width: GetDeviceType().getDeviceType(context) ? 30 : 20,
                                      color: draKText,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: GetDeviceType().getDeviceType(context) ? 22 : 18, vertical: GetDeviceType().getDeviceType(context) ? 15 : 10),
                                    child: Text(
                                      "Support",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: semiBold,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: GetDeviceType().getDeviceType(context) ? 18 : 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: GetDeviceType().getDeviceType(context) ? 22 : 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: InkWell(
                            onTap: () {
                              Get.to(() => const CMSScreen(tittle: "About Us"));
                            },
                            child: SizedBox(
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all( GetDeviceType().getDeviceType(context) ? 10 : 6),
                                    decoration: BoxDecoration(
                                        color: Color(0xFFF0F0F0),
                                        borderRadius: BorderRadius.circular(6)
                                    ),
                                    child: Image.asset(
                                      fromIc,
                                      height: GetDeviceType().getDeviceType(context) ? 30 : 20,
                                      width: GetDeviceType().getDeviceType(context) ? 30 : 20,
                                      color: draKText,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: GetDeviceType().getDeviceType(context) ? 22 : 18, vertical: GetDeviceType().getDeviceType(context) ? 15 : 10),
                                    child: Text(
                                      "About Us",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: semiBold,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: GetDeviceType().getDeviceType(context) ? 18 : 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: GetDeviceType().getDeviceType(context) ? 22 : 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: InkWell(
                            onTap: () {
                              Get.to(() => const CMSScreen(tittle: "Privacy policy"));
                            },
                            child: SizedBox(
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all( GetDeviceType().getDeviceType(context) ? 10 : 6),
                                    decoration: BoxDecoration(
                                        color: Color(0xFFF0F0F0),
                                        borderRadius: BorderRadius.circular(6)
                                    ),
                                    child: Image.asset(
                                      fromIc,
                                      height: GetDeviceType().getDeviceType(context) ? 30 : 20,
                                      width: GetDeviceType().getDeviceType(context) ? 30 : 20,
                                      color: draKText,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: GetDeviceType().getDeviceType(context) ? 22 : 18, vertical: GetDeviceType().getDeviceType(context) ? 15 : 10),
                                    child: Text(
                                      "Privacy Policy",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: semiBold,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: GetDeviceType().getDeviceType(context) ? 18 : 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: GetDeviceType().getDeviceType(context) ? 22 : 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: InkWell(
                            onTap: () {
                              Get.to(() => const CMSScreen(tittle: "Term and conditions"));
                            },
                            child: SizedBox(
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all( GetDeviceType().getDeviceType(context) ? 10 : 6),
                                    decoration: BoxDecoration(
                                        color: Color(0xFFF0F0F0),
                                        borderRadius: BorderRadius.circular(6)
                                    ),
                                    child: Image.asset(
                                      fromIc,
                                      height: GetDeviceType().getDeviceType(context) ? 30 : 20,
                                      width: GetDeviceType().getDeviceType(context) ? 30 : 20,
                                      color: draKText,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: GetDeviceType().getDeviceType(context) ? 22 : 18, vertical: GetDeviceType().getDeviceType(context) ? 15 : 10),
                                    child: Text(
                                      "Terms And Conditions",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: semiBold,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: GetDeviceType().getDeviceType(context) ? 18 : 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: GetDeviceType().getDeviceType(context) ? 22 : 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: InkWell(
                            onTap: () {
                              Get.to(()=>DeleteAccountScreen());
                             // deleteAccount();
                            },
                            child: SizedBox(
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all( GetDeviceType().getDeviceType(context) ? 10 : 6),
                                    decoration: BoxDecoration(
                                        color: Color(0xFFF0F0F0),
                                        borderRadius: BorderRadius.circular(6)
                                    ),
                                    child: Image.asset(
                                      deleteIcNew,
                                      height: GetDeviceType().getDeviceType(context) ? 30 : 20,
                                      width: GetDeviceType().getDeviceType(context) ? 30 : 20,
                                      color: draKText,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: GetDeviceType().getDeviceType(context) ? 22 : 18, vertical: GetDeviceType().getDeviceType(context) ? 15 : 10),
                                    child: Text(
                                      "Delete Account",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: semiBold,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: GetDeviceType().getDeviceType(context) ? 18 : 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: GetDeviceType().getDeviceType(context) ? 22 : 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: InkWell(
                            onTap: () {
                             logoutDialog();
                            },
                            child: SizedBox(
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all( GetDeviceType().getDeviceType(context) ? 10 : 6),
                                    decoration: BoxDecoration(
                                        color: Color(0xFFF0F0F0),
                                        borderRadius: BorderRadius.circular(6)
                                    ),
                                    child: Image.asset(
                                      logoutIc,
                                      height: GetDeviceType().getDeviceType(context) ? 30 : 20,
                                      width: GetDeviceType().getDeviceType(context) ? 30 : 20,
                                      color: draKText,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: GetDeviceType().getDeviceType(context) ? 22 : 18, vertical: GetDeviceType().getDeviceType(context) ? 15 : 10),
                                    child: Text(
                                      "Logout",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: semiBold,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: GetDeviceType().getDeviceType(context) ? 18 : 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: GetDeviceType().getDeviceType(context) ? 50 : 30),
                       /* Padding(
                          padding: EdgeInsets.symmetric(horizontal: GetDeviceType().getDeviceType(context) ? 27 : 17),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                           *//*   *//**//*Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Credit Report update on",
                                        style: TextStyle(
                                          color: draKText,
                                          fontFamily: medium,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          fontSize: GetDeviceType().getDeviceType(context)? 16 : 12,
                                        ),
                                      ),
                                      const SizedBox(height: 7),
                                      Row(
                                        children: [
                                          Image.asset(
                                            whatsAppOutline,
                                            height: 12,
                                            width: 12,
                                          ),
                                          const SizedBox(width: 9),
                                          Text(
                                            "Whatsapp",
                                            style: TextStyle(
                                              color: greenCl,
                                              fontFamily: medium,
                                              fontWeight: FontWeight.w500,
                                              fontStyle: FontStyle.normal,
                                              fontSize: GetDeviceType().getDeviceType(context)? 14 : 10,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  CupertinoSwitch(
                                    value: switchValue,
                                    onChanged: (bool value) {
                                      setState(() {
                                        switchValue = value;
                                      });
                                    },
                                    activeColor: const Color(0xFFD1E4FF),
                                    thumbColor: primaryClNew,
                                  )
                                ],
                              ),
                              SizedBox(height: GetDeviceType().getDeviceType(context)? 15 : 10),
                              const Divider(color: appBarClNew1),*//**//*
                              InkWell(
                                onTap: () {
                                  Get.to(() => const MyApplicationScreen());
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        fromIc,
                                        height: GetDeviceType().getDeviceType(context) ? 30 : 20,
                                        width: GetDeviceType().getDeviceType(context) ? 30 : 20,
                                        color: primaryClNew,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: GetDeviceType().getDeviceType(context) ? 15 : 10, vertical: GetDeviceType().getDeviceType(context) ? 15 : 10),
                                        child: Text(
                                          "My Application",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: medium,
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.normal,
                                            fontSize: GetDeviceType().getDeviceType(context) ? 16 : 12,
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      Image.asset(
                                        arrowRoundIc,
                                        height: GetDeviceType().getDeviceType(context) ? 26 : 16,
                                        width: GetDeviceType().getDeviceType(context) ? 26 : 16,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const Divider(color: appBarClNew1),
                              *//**//* InkWell(
                                onTap: () {
                                  Get.to(() => const MyQueryScreen());
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        mingcuteQuestionIc,
                                        height: GetDeviceType().getDeviceType(context) ? 30 : 20,
                                        width: GetDeviceType().getDeviceType(context) ? 30 : 20,
                                        color: primaryClNew,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: GetDeviceType().getDeviceType(context) ? 15 : 10, vertical: GetDeviceType().getDeviceType(context) ? 15 : 10),
                                        child: Text(
                                          "My Query",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: medium,
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.normal,
                                            fontSize: GetDeviceType().getDeviceType(context) ? 16 : 12,
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      Image.asset(
                                        arrowRoundIc,
                                        height: GetDeviceType().getDeviceType(context) ? 26 : 16,
                                        width: GetDeviceType().getDeviceType(context) ? 26 : 16,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const Divider(color: appBarClNew1),*//**//*
                              InkWell(
                                onTap: () {
                                  Get.to(() => const MyAppointmentList());
                                },
                                child: SizedBox(
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        callIcNew,
                                        height: GetDeviceType().getDeviceType(context) ? 30 : 20,
                                        width: GetDeviceType().getDeviceType(context) ? 30 : 20,
                                        color: primaryClNew,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: GetDeviceType().getDeviceType(context) ? 15 : 10, vertical: GetDeviceType().getDeviceType(context) ? 15 : 10),
                                        child: Text(
                                          "My Appointment",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: medium,
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.normal,
                                            fontSize: GetDeviceType().getDeviceType(context) ? 16 : 12,
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      Image.asset(
                                        arrowRoundIc,
                                        height: GetDeviceType().getDeviceType(context) ? 26 : 16,
                                        width: GetDeviceType().getDeviceType(context) ? 26 : 16,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const Divider(color: appBarClNew1),*//*
                              InkWell(
                                onTap: () {
                                  shareApp();
                                },
                                child: SizedBox(
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        shareIcNew,
                                        height: GetDeviceType().getDeviceType(context) ? 30 : 20,
                                        width: GetDeviceType().getDeviceType(context) ? 30 : 20,
                                        color: primaryClNew,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: GetDeviceType().getDeviceType(context) ? 15 : 10, vertical: GetDeviceType().getDeviceType(context) ? 15 : 10),
                                        child: Text(
                                          "Share",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: medium,
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.normal,
                                            fontSize: GetDeviceType().getDeviceType(context) ? 16 : 12,
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      Image.asset(
                                        arrowRoundIc,
                                        height: GetDeviceType().getDeviceType(context) ? 26 : 16,
                                        width: GetDeviceType().getDeviceType(context) ? 26 : 16,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const Divider(color: appBarClNew1),
                              InkWell(
                                onTap: () {
                                  Get.to(() => const FeedBackScreen());
                                },
                                child: SizedBox(
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        feedbackIc,
                                        height: GetDeviceType().getDeviceType(context) ? 30 : 20,
                                        width: GetDeviceType().getDeviceType(context) ? 30 : 20,
                                        color: primaryClNew,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: GetDeviceType().getDeviceType(context) ? 15 : 10, vertical: GetDeviceType().getDeviceType(context) ? 15 : 10),
                                        child: Text(
                                          "FeedBack",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: medium,
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.normal,
                                            fontSize: GetDeviceType().getDeviceType(context) ? 16 : 12,
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      Image.asset(
                                        arrowRoundIc,
                                        height: GetDeviceType().getDeviceType(context) ? 26 : 16,
                                        width: GetDeviceType().getDeviceType(context) ? 26 : 16,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const Divider(color: appBarClNew1),
                              InkWell(
                                onTap: () {
                                  openStore();
                                },
                                child: SizedBox(
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        rateIc,
                                        height: GetDeviceType().getDeviceType(context) ? 30 : 20,
                                        width: GetDeviceType().getDeviceType(context) ? 30 : 20,
                                        color: primaryClNew,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: GetDeviceType().getDeviceType(context) ? 15 : 10, vertical: GetDeviceType().getDeviceType(context) ? 15 : 10),
                                        child: Text(
                                          "Rate Us",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: medium,
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.normal,
                                            fontSize: GetDeviceType().getDeviceType(context) ? 16 : 12,
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      Image.asset(
                                        arrowRoundIc,
                                        height: GetDeviceType().getDeviceType(context) ? 26 : 16,
                                        width: GetDeviceType().getDeviceType(context) ? 26 : 16,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const Divider(color: appBarClNew1),
                              InkWell(
                                onTap: () {
                                  Get.to(() => const NewSupportScreen());
                                },
                                child: SizedBox(
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        supIc,
                                        height: GetDeviceType().getDeviceType(context) ? 30 : 20,
                                        width: GetDeviceType().getDeviceType(context) ? 30 : 20,
                                        color: primaryClNew,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: GetDeviceType().getDeviceType(context) ? 15 : 10, vertical: GetDeviceType().getDeviceType(context) ? 15 : 10),
                                        child: Text(
                                          "Support",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: medium,
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.normal,
                                            fontSize: GetDeviceType().getDeviceType(context) ? 16 : 12,
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      Image.asset(
                                        arrowRoundIc,
                                        height: GetDeviceType().getDeviceType(context) ? 26 : 16,
                                        width: GetDeviceType().getDeviceType(context) ? 26 : 16,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const Divider(color: appBarClNew1),
                              InkWell(
                                onTap: () {
                                  Get.to(() => const CMSScreen(tittle: "About Us"));
                                },
                                child: SizedBox(
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        fromIc,
                                        height: GetDeviceType().getDeviceType(context) ? 30 : 20,
                                        width: GetDeviceType().getDeviceType(context) ? 30 : 20,
                                        color: primaryClNew,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: GetDeviceType().getDeviceType(context) ? 15 : 10, vertical: GetDeviceType().getDeviceType(context) ? 15 : 10),
                                        child: Text(
                                          "About Us",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: medium,
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.normal,
                                            fontSize: GetDeviceType().getDeviceType(context) ? 16 : 12,
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      Image.asset(
                                        arrowRoundIc,
                                        height: GetDeviceType().getDeviceType(context) ? 26 : 16,
                                        width: GetDeviceType().getDeviceType(context) ? 26 : 16,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const Divider(color: appBarClNew1),
                              InkWell(
                                onTap: () {
                                  Get.to(() => const CMSScreen(tittle: "Privacy policy"));
                                },
                                child: SizedBox(
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        fromIc,
                                        height: GetDeviceType().getDeviceType(context) ? 30 : 20,
                                        width: GetDeviceType().getDeviceType(context) ? 30 : 20,
                                        color: primaryClNew,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: GetDeviceType().getDeviceType(context) ? 15 : 10, vertical: GetDeviceType().getDeviceType(context) ? 15 : 10),
                                        child: Text(
                                          "Privacy Policy",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: medium,
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.normal,
                                            fontSize: GetDeviceType().getDeviceType(context) ? 16 : 12,
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      Image.asset(
                                        arrowRoundIc,
                                        height: GetDeviceType().getDeviceType(context) ? 26 : 16,
                                        width: GetDeviceType().getDeviceType(context) ? 26 : 16,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const Divider(color: appBarClNew1),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => const CMSScreen(tittle: "Term and conditions"));
                                },
                                child: SizedBox(
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        fromIc,
                                        height: GetDeviceType().getDeviceType(context) ? 30 : 20,
                                        width: GetDeviceType().getDeviceType(context) ? 30 : 20,
                                        color: primaryClNew,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: GetDeviceType().getDeviceType(context) ? 15 : 10, vertical: GetDeviceType().getDeviceType(context) ? 15 : 10),
                                        child: Text(
                                          "Terms And Conditions",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: medium,
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.normal,
                                            fontSize: GetDeviceType().getDeviceType(context) ? 16 : 12,
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      Image.asset(
                                        arrowRoundIc,
                                        height: GetDeviceType().getDeviceType(context) ? 26 : 16,
                                        width: GetDeviceType().getDeviceType(context) ? 26 : 16,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const Divider(color: appBarClNew1),

                              *//* GestureDetector(
                               onTap: () {

                               },
                               child: SizedBox(
                                 child: Row(
                                   children: [
                                     Image.asset(
                                       logoutIcNew,
                                       height: 20,
                                       width: 20,
                                     ),
                                     const SizedBox(width: 10),
                                     const Text(
                                       "Logout",
                                       style: TextStyle(
                                         color: Colors.black,
                                         fontFamily: medium,
                                         fontWeight: FontWeight.w500,
                                         fontStyle: FontStyle.normal,
                                         fontSize: 12,
                                       ),
                                     ),
                                     const Spacer(),
                                     Image.asset(arrowRoundIc,height: 16,width: 16,)
                                   ],
                                 ),
                               ),
                             ),*//*
                              *//*   const SizedBox(height: 10),
                             const Divider(color: appBarClNew1),
                             const SizedBox(height: 10),*//*
                              GestureDetector(
                                onTap: () {
                                  deleteAccount();
                                },
                                child: SizedBox(
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        deleteIcNew,
                                        height: GetDeviceType().getDeviceType(context) ? 30 : 20,
                                        width: GetDeviceType().getDeviceType(context) ? 30 : 20,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: GetDeviceType().getDeviceType(context) ? 15 : 10, vertical: GetDeviceType().getDeviceType(context) ? 15 : 10),
                                        child: Text(
                                          "Delete Account",
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontFamily: medium,
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.normal,
                                            fontSize: GetDeviceType().getDeviceType(context) ? 16 : 12,
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      Image.asset(
                                        arrowRoundIc,
                                        height: GetDeviceType().getDeviceType(context) ? 26 : 16,
                                        width: GetDeviceType().getDeviceType(context) ? 26 : 16,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const Divider(color: appBarClNew1),
                              SizedBox(height: GetDeviceType().getDeviceType(context) ? 25 : 20),
                              GestureDetector(
                                onTap: () {
                                  logoutDialog();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      gradient: const LinearGradient(colors: [
                                        Color(0xFF189DFF),
                                        Color(0xFF0070C1),
                                      ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
                                  width: GetDeviceType().getDeviceType(context) ? 184 : 154,
                                  height: GetDeviceType().getDeviceType(context) ? 56 : 46,
                                  child: Center(
                                    child: Text(
                                      'Logout',
                                      style: TextStyle(
                                        color: whiteColor,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: semiBold,
                                        fontSize: GetDeviceType().getDeviceType(context) ? 22 : 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: GetDeviceType().getDeviceType(context) ? 40 : 30,
                              ),
                            ],
                          ),
                        )*/
                      ],
                    ),
                    /* Positioned(
                      top: 35,
                      left: 0,
                      right: 0,
                      child: Container(
                          width: 70,
                          clipBehavior: Clip.none,
                          margin: const EdgeInsets.symmetric(horizontal: 130),
                          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 10),
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6), border: Border.all(color: homeBgCl)),
                          child: Image.asset(
                            fiinzyLogo,
                            height: GetDeviceType().getDeviceType(context) ? 35 : 15,
                          )),
                    ),*/
                  ],
                ),
              ),
           /*   bottomSheet: Container(
                height: 20,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(color: Colors.white),
                child: Center(
                  child: Text(
                    "App version=0.01",
                    style: TextStyle(
                      color: textGeryCl,
                      fontFamily: medium,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: GetDeviceType().getDeviceType(context) ? 16 : 12,
                    ),
                  ),
                ),
              ),*/
            ),
          );
        });
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
                      onPressed: () {
                        userController.logout();
                      },
                    ),
                    const SizedBox(height: 30),
                    GestureDetector(
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

  void deleteAccount() {
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
                      deleteIcNew,
                      height: 158,
                      width: 158,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Are You Sure you want To Delete Account ?",
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
                        backgroundColor: Colors.red,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(6),
                          ),
                        ),
                      ),
                      child: const Text(
                        "Yes, Delete",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: regular,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      onPressed: () {
                        userController.deleteAccountApi();
                      },
                    ),
                    const SizedBox(height: 30),
                    GestureDetector(
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

  Future<void> shareApp() async {
    String packageName = 'com.aamod.moneyverss';
    String appStoreUrl = 'https://apps.apple.com/app/$packageName';
    String playStoreUrl = 'https://play.google.com/store/apps/details?id=$packageName';
    if (!Platform.isAndroid) {
      await Share.share('moneyverss  App Download From App Store:-'
          '\n $appStoreUrl"');
    } else if (Platform.isAndroid) {
      await Share.share('moneyverss  App Download From Play Store:-'
          '\n $playStoreUrl"');
    } else {
      throw 'Could not launch store';
    }
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
