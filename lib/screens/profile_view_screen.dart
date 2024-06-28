import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/controllers/user_controller.dart';
import 'package:wireframe/screens/edit_profile_screen.dart';

class ProfileViewScreen extends StatefulWidget {
  const ProfileViewScreen({super.key});

  @override
  State<ProfileViewScreen> createState() => _ProfileViewScreenState();
}

class _ProfileViewScreenState extends State<ProfileViewScreen> {
  UserController userController = Get.put(UserController());

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
                      "Profile",
                      style: TextStyle(
                        color: draKText,
                        fontFamily: medium,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: 16,
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Get.to(() => const EditProfileScreen());
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Image.asset(
                          editIc,
                          height: 20,
                          width: 20,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            body: Column(
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
                        bottom: -20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 145,
                              width: 145,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: primaryClNew)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(70),
                                child: userController.user.value.image != ""
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
                                      ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  userController.user.value.customerName.toString(),
                  style: const TextStyle(
                    color: draKText,
                    fontFamily: semiBold,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 41,
                  margin: const EdgeInsets.symmetric(horizontal: 17),
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      color: whiteColor,
                      border: Border.all(color: borderNewCl),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(8),
                        topLeft: Radius.circular(8),
                      )),
                  child: Row(
                    children: [
                      Image.asset(mobileI),
                      const SizedBox(
                        width: 14,
                      ),
                      Text(
                        userController.user.value.mobileNo.toString(),
                        style: const TextStyle(
                          color: draKText,
                          fontFamily: medium,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 41,
                  margin: const EdgeInsets.symmetric(horizontal: 17),
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      color: whiteColor,
                      border: Border.all(color: borderNewCl),
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                      )),
                  child: Row(
                    children: [
                      Image.asset(emailI),
                      const SizedBox(width: 14),
                      Text(
                        userController.user.value.emailAddress ?? "Email Address",
                        style:  TextStyle(
                          color: userController.user.value.emailAddress==""? greyNew:draKText,
                          fontFamily: medium,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ));
        });
  }
}
