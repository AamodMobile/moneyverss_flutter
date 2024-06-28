import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/controllers/user_controller.dart';
import 'package:wireframe/widget/text_filled_widget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  UserController userController = Get.put(UserController());
  TextEditingController name = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  void initState() {
    userController.image.value = File("");
    name.text = userController.user.value.customerName.toString();
    email.text = userController.user.value.emailAddress ?? "";
    mobile.text = userController.user.value.mobileNo ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: homeBgCl,
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 60),
          child: Container(
            padding:
            const EdgeInsets.symmetric(horizontal: 16,),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: whiteColor,),
            child: Row(
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 8, bottom: 8, right: 8),
                      child: Image.asset(
                        icBack,
                        height: 24,
                        width: 24,
                      ),
                    )),
                SizedBox(width: 5,),
                const Text(
                  "Edit Profile",
                  style: TextStyle(
                    color: draKText,
                    fontFamily: medium,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 60,),
              Image.asset(imgCommonLogo, height: 25,),
              SizedBox(
                height: 160,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      right: 0,
                      left: 0,
                      bottom: -10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Obx(
                                () => InkWell(
                                  onTap: () {
                                    userController.pickImage(context);
                                  },
                                  child: Container(
                                    height: 145,
                                    width: 145,
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: primaryClNew)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(70),
                                      child: userController.image.value.path.isEmpty
                                          ? (userController.user.value.image != "")
                                              ? CachedNetworkImage(
                                                  errorWidget: (context, url, error) => Image.asset(
                                                    defult,
                                                    fit: BoxFit.fill,
                                                  ),
                                                  fit: BoxFit.fill,
                                                  height: 145,
                                                  width: 145,
                                                  imageUrl: userController.user.value.image.toString(),
                                                  placeholder: (a, b) => const Center(
                                                    child: CircularProgressIndicator(),
                                                  ),
                                                )
                                              : Image.asset(
                                                  defult,
                                                  fit: BoxFit.fill,
                                                  height: 145,
                                                  width: 145,
                                                )
                                          : Image.file(
                                              userController.image.value,
                                              fit: BoxFit.fill,
                                              height: 145,
                                              width: 145,
                                            ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: InkWell(
                                  onTap: () {
                                    userController.pickImage(context);
                                  },
                                  child: Image.asset(
                                    camraIc,
                                    height: 40,
                                    width: 40,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
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
                  controller: name,
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
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: MyTextFormField(
                  counterText: "",
                  controller: mobile,
                  hint: 'Enter mobile number',
                  obscureText: false,
                  readOnly: true,
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
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: MyTextFormField(
                  controller: email,
                  hint: 'Enter Email address',
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
              const SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  userController.updateProfile(name.text, mobile.text, email.text);
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      gradient: const LinearGradient(colors: [
                        Color(0xFF189DFF),
                        Color(0xFF0070C1),
                      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                  width: 230,
                  height: 54,
                  child: const Center(
                    child: Text(
                      "Update",
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
      ),
    );
  }
}
