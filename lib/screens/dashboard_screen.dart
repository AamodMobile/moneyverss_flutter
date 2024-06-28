import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/controllers/dashboard_controller.dart';
import 'package:wireframe/controllers/user_controller.dart';
import 'package:wireframe/screens/account_screen.dart';
import 'package:wireframe/screens/credit_score_screen.dart';
import 'package:wireframe/screens/drawer_screen.dart';
import 'package:wireframe/screens/home_screen.dart';
import 'package:wireframe/screens/notification_screen.dart';
import 'package:wireframe/screens/offers_screens.dart';
import 'package:wireframe/widget/my_button.dart';

import '../constants/get_device_type.dart';

class DashBoardScreen extends StatefulWidget {
  final int currentScreen;

  const DashBoardScreen({super.key, required this.currentScreen});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int _selectedIndex = 0;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  static List<Widget> widgetOptions = [
    const HomeScreen(),
    const CreditScoreScreen(),
    const OffersScreen(),
    const AccountScreen(),
  ];
  int timeIndex = -1;
  final List time = [
    "10 Am -11 Am",
    "11 Am -12 Pm",
    "12 Pm -1 Pm",
    "2 Pm -3 Pm",
  ];
  int selectedRating = 0;
  UserController userController = Get.put(UserController());
  DashboardController dashboardController = Get.put(DashboardController());

  @override
  void initState() {
    _selectedIndex = widget.currentScreen;
    dashboardController.getContNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvoked: (didPop) async {
          if (didPop) {
            return;
          }
          final navigator = Navigator.of(context);
          bool willLeave = false;
          if (_selectedIndex != 0) {
            _onItemTapped(0);
          } else {
            await showDialog(
              context: context,
              builder: (_) => AlertDialog(
                backgroundColor: screenBgCl,
                title: const Text(
                  'Are you sure you want to exit?',
                  style: TextStyle(
                    color: primaryClNew,
                    fontFamily: semiBold,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                  ),
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      willLeave = true;
                      if (Platform.isAndroid) {
                        SystemNavigator.pop();
                      } else if (Platform.isIOS) {
                        exit(0);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryClNew,
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: const Text(
                      'Yes',
                      style: TextStyle(
                        color: whiteColor,
                        fontFamily: semiBold,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text(
                      'No',
                      style: TextStyle(
                        color: primaryClNew,
                        fontFamily: semiBold,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          if (willLeave) {
            navigator.pop();
          }
        },
        child: GetBuilder(
            init: Get.find<UserController>(),
            initState: (state) {
              Get.find<UserController>().userProfileGet();
            },
            builder: (contextCtr) {
              return SafeArea(
                child: Scaffold(
                  key: scaffoldKey,
                  //drawer: const DrawerScreen(),
                  backgroundColor: _selectedIndex == 3 ? whiteColor : homeBgCl,
                  appBar: _selectedIndex == 3
                      ? null
                      : PreferredSize(
                          preferredSize: Size(MediaQuery.of(context).size.width,
                              GetDeviceType().getDeviceType(context) ? 75 : 65),
                          child: Container(
                            height: GetDeviceType().getDeviceType(context) ? 75 : 65,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 0),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  border: Border.fromBorderSide(
                                      BorderSide(color: Color(0xFFB6D3FF)))),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Visibility(
                                        visible: false,
                                        child: SizedBox(
                                          width: GetDeviceType().getDeviceType(context) ? 160 : 80,
                                          child: Text(
                                            "Hi ${contextCtr.user.value.customerName ?? ""}",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: TextStyle(
                                              color: primaryClNew,
                                              fontFamily: semiBold,
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.normal,
                                              fontSize: GetDeviceType()
                                                      .getDeviceType(context)
                                                  ? 14
                                                  : 11,
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          FocusScope.of(context).requestFocus(FocusNode());
                                          dashboardController.markAsRead();
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const NotificationScreen()));
                                        },
                                        child: Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            Container(
                                              height: GetDeviceType()
                                                      .getDeviceType(context)
                                                  ? 40
                                                  : 30,
                                              width: GetDeviceType()
                                                      .getDeviceType(context)
                                                  ? 40
                                                  : 30,
                                              padding: EdgeInsets.all(
                                                  GetDeviceType().getDeviceType(
                                                          context)
                                                      ? 10
                                                      : 6),
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: whiteColor,
                                              ),
                                              child: Image.asset(
                                                notificationIc,
                                                fit: BoxFit.contain,
                                                color: primaryClNew,
                                              ),
                                            ),
                                            Positioned(
                                              top: GetDeviceType()
                                                      .getDeviceType(context)
                                                  ? -4
                                                  : -3,
                                              right: GetDeviceType()
                                                      .getDeviceType(context)
                                                  ? -4
                                                  : -3,
                                              child: Obx(
                                                () => Container(
                                                  height: GetDeviceType()
                                                          .getDeviceType(
                                                              context)
                                                      ? 18
                                                      : 15,
                                                  width: GetDeviceType()
                                                          .getDeviceType(
                                                              context)
                                                      ? 18
                                                      : 15,
                                                  decoration:
                                                      const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: primaryClNew,
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      dashboardController
                                                          .notificationCont
                                                          .value,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                        color: whiteColor,
                                                        fontFamily: semiBold,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: GetDeviceType()
                                                                .getDeviceType(
                                                                    context)
                                                            ? 10
                                                            : 8,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Positioned.fill(
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Image.asset(
                                          fiinzyLogo,
                                          height:
                                          GetDeviceType().getDeviceType(context)
                                              ? 45
                                              : 25,
                                        ),
                                    ),
                                  ),
                                ],
                              )
                              /*Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            child: Row(
                              children: [
                                */ /*GestureDetector(
                                  onTap: () {
                                    _onItemTapped(3);
                                  },
                                  child: Container(
                                    height: GetDeviceType().getDeviceType(context)? 45 : 35,
                                    width: GetDeviceType().getDeviceType(context)? 45 : 35,
                                    padding: const EdgeInsets.all(2),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: whiteColor,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: userController.user.value.image != ""
                                          ? CachedNetworkImage(
                                        errorWidget: (context, url, error) =>
                                            Image.asset(
                                              bannerImg,
                                              fit: BoxFit.fill,
                                            ),
                                        fit: BoxFit.fill,
                                        imageUrl: userController.user.value.image.toString(),
                                        placeholder: (a, b) =>
                                        const Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      )
                                          : Image.asset(
                                        defult,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: GetDeviceType().getDeviceType(context)?15 : 5),*/ /*
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Text(
                                          "Hi ${contextCtr.user.value.customerName ?? ""}",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                            color: primaryClNew,
                                            fontFamily: semiBold,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                            fontSize: GetDeviceType().getDeviceType(context)? 14 : 11,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Image.asset(
                                  fiinzyLogo,
                                  height: GetDeviceType().getDeviceType(context)?35 : 25,
                                  width: GetDeviceType().getDeviceType(context)? 150 : 150,
                                ),
                              ],
                            ),
                          ),

                          const Spacer(),
                          InkWell(
                            onTap: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                              dashboardController.markAsRead();
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationScreen()));
                            },
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  height: GetDeviceType().getDeviceType(context)? 40 : 30,
                                  width: GetDeviceType().getDeviceType(context)? 40 : 30,
                                  padding: EdgeInsets.all(GetDeviceType().getDeviceType(context)? 10 : 6),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: whiteColor,
                                  ),
                                  child: Image.asset(
                                    notificationIc,
                                    fit: BoxFit.contain,
                                    color: primaryClNew,
                                  ),
                                ),
                                Positioned(
                                  top: GetDeviceType().getDeviceType(context)? -4 : -3,
                                  right: GetDeviceType().getDeviceType(context)? -4 : -3,
                                  child: Obx(
                                        () =>
                                        Container(
                                          height: GetDeviceType().getDeviceType(context)? 18 : 15,
                                          width: GetDeviceType().getDeviceType(context)? 18 : 15,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: primaryClNew,
                                          ),
                                          child: Center(
                                            child: Text(
                                              dashboardController.notificationCont.value,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: TextStyle(
                                                color: whiteColor,
                                                fontFamily: semiBold,
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.normal,
                                                fontSize: GetDeviceType().getDeviceType(context)? 10 : 8,
                                              ),
                                            ),
                                          ),
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),*/
                              ),
                        ),
                  body: Column(
                    children: [
                      Expanded(
                        child: widgetOptions.elementAt(_selectedIndex),
                      )
                    ],
                  ),
                  bottomNavigationBar: Container(
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          offset: const Offset(0, 1),
                          blurRadius: 10,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: BottomNavigationBar(
                      selectedFontSize: 10,
                      unselectedFontSize: 10,
                      backgroundColor: Colors.white,
                      type: BottomNavigationBarType.fixed,
                      iconSize: 22,
                      showSelectedLabels: true,
                      showUnselectedLabels: true,
                      selectedItemColor: primaryClNew,
                      unselectedItemColor: primaryCl,
                      selectedLabelStyle: const TextStyle(
                        color: primaryClNew,
                        fontStyle: FontStyle.normal,
                        fontFamily: semiBold,
                        fontWeight: FontWeight.w600,
                      ),
                      unselectedLabelStyle: const TextStyle(
                        color: primaryCl,
                        fontStyle: FontStyle.normal,
                        fontFamily: medium,
                        fontWeight: FontWeight.w500,
                      ),
                      currentIndex: _selectedIndex,
                      onTap: _onItemTapped,
                      items: [
                        const BottomNavigationBarItem(
                          icon: ImageIcon(
                            AssetImage(
                              homeIc,
                            ),
                            size: 22,
                          ),
                          label: 'Home',
                        ),
                        BottomNavigationBarItem(
                          icon: const ImageIcon(
                            AssetImage(creditScoreIc),
                            size: 22,
                          ),
                          activeIcon: Image.asset(
                            creditScoreAcIc,
                            height: 22,
                            width: 22,
                          ),
                          label: 'Credit Score',
                        ),
                        BottomNavigationBarItem(
                          icon: const ImageIcon(AssetImage(offersIc), size: 22),
                          activeIcon: Image.asset(
                            offersIc,
                            height: 22,
                            width: 22,
                            color: primaryClNew,
                          ),
                          label: 'Eligibility Report',
                        ),
                        BottomNavigationBarItem(
                          icon:
                              const ImageIcon(AssetImage(userSecIc), size: 22),
                          activeIcon: Image.asset(
                            accountActiveIc,
                            height: 22,
                            width: 22,
                          ),
                          label: 'Account',
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  bottomSheet() {
    return showModalBottomSheet(
        isScrollControlled: true,
        useRootNavigator: true,
        backgroundColor: whiteColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(12), topLeft: Radius.circular(12)),
        ),
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (BuildContext context, setState) {
            return Wrap(children: [
              Column(
                children: [
                  const SizedBox(height: 14),
                  const Text(
                    "Filter",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontFamily: semiBold,
                        color: secondaryCl),
                  ),
                  const SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        "Select Rating",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: medium,
                            color: secondaryCl),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Container(
                    height: 30,
                    margin: const EdgeInsets.only(left: 15),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedRating = 1;
                            });
                          },
                          child: Container(
                            height: 36,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: selectedRating == 1
                                  ? secondaryCl
                                  : whiteColor,
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(0, 1),
                                    blurRadius: 4,
                                    spreadRadius: 0,
                                    color: const Color(0xFF000000)
                                        .withOpacity(0.15))
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  selectedRating == 1 ? starWhiteIc : starPrIc,
                                  height: 20,
                                  width: 20,
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  "1-3",
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: selectedRating == 1
                                          ? whiteColor
                                          : primaryCl,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: medium),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedRating = 2;
                            });
                          },
                          child: Container(
                            height: 36,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: selectedRating == 2
                                  ? secondaryCl
                                  : whiteColor,
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(0, 1),
                                    blurRadius: 4,
                                    spreadRadius: 0,
                                    color: const Color(0xFF000000)
                                        .withOpacity(0.15))
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  selectedRating == 2 ? starWhiteIc : starPrIc,
                                  height: 20,
                                  width: 20,
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  "4",
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: selectedRating == 2
                                          ? whiteColor
                                          : primaryCl,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: medium),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedRating = 3;
                            });
                          },
                          child: Container(
                            height: 36,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: selectedRating == 3
                                  ? secondaryCl
                                  : whiteColor,
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(0, 1),
                                    blurRadius: 4,
                                    spreadRadius: 0,
                                    color: const Color(0xFF000000)
                                        .withOpacity(0.15))
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  selectedRating == 3 ? starWhiteIc : starPrIc,
                                  height: 20,
                                  width: 20,
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  "5",
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: selectedRating == 3
                                          ? whiteColor
                                          : primaryCl,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: medium),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        "Select Availability",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: medium,
                            color: secondaryCl),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Container(
                    height: 30,
                    color: Colors.white,
                    margin: const EdgeInsets.only(left: 15),
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: time.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                timeIndex = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 2, vertical: 2),
                              height: 29,
                              width: 91,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: timeIndex == index
                                      ? secondaryCl
                                      : whiteColor,
                                  boxShadow: [
                                    BoxShadow(
                                        offset: const Offset(0, 0),
                                        blurRadius: 4,
                                        spreadRadius: 0,
                                        color: const Color(0xFF000000)
                                            .withOpacity(0.15))
                                  ]),
                              child: Center(
                                child: Text(
                                  time[index],
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: timeIndex == index
                                          ? whiteColor
                                          : primaryCl,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: medium),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  const SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        "Experience",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: medium,
                            color: secondaryCl),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  const SizedBox(
                    child: MyStatefulWidget(),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const SizedBox(
                        width: 18,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          width: 100,
                          child: MyButton(
                              onPressed: () {},
                              color: otherCl,
                              child: const Text(
                                "Clear All",
                                style: TextStyle(
                                    color: textGeryCl,
                                    fontFamily: semiBold,
                                    fontSize: 18),
                              )),
                        ),
                      ),
                      const SizedBox(
                        width: 18,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          width: 100,
                          child: MyButton(
                              onPressed: () {},
                              color: secondaryCl,
                              child: const Text(
                                "Apply",
                                style: TextStyle(
                                    color: whiteColor,
                                    fontFamily: semiBold,
                                    fontSize: 18),
                              )),
                        ),
                      ),
                      const SizedBox(
                        width: 18,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20)
                ],
              )
            ]);
          });
        });
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  double _currentSliderValue = 02;
  final double min = 1;
  final double max = 20;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "${_currentSliderValue.toInt()}Exp.",
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: regular,
              color: textColorSec),
        ),
        SizedBox(
            width: double.infinity,
            height: 30,
            child: Expanded(
              child: Slider(
                thumbColor: secondaryCl,
                activeColor: secondaryCl,
                inactiveColor: Colors.white,
                value: _currentSliderValue,
                max: max,
                divisions: 20,
                min: min,
                label: _currentSliderValue.toString(),
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                  });
                },
              ),
            )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$min Year",
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    fontFamily: regular,
                    color: textColorSec),
              ),
              Text(
                "$max Year",
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    fontFamily: regular,
                    color: textColorSec),
              ),
            ],
          ),
        )
      ],
    );
  }
}
