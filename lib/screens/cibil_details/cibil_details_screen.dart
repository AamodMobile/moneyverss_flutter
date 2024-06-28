import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/screens/cibil_details/account_details_screen.dart';
import 'package:wireframe/screens/cibil_details/payment_history_screen.dart';

class CibilDetailsScreen extends StatefulWidget {
  const CibilDetailsScreen({super.key});

  @override
  State<CibilDetailsScreen> createState() => _CibilDetailsScreenState();
}

class _CibilDetailsScreenState extends State<CibilDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: homeBgCl,
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 60),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16,),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: whiteColor,
            border: Border.fromBorderSide(BorderSide(color: Color(0xFFB6D3FF)))),
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
                  "Cibill Details",
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
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                decoration: BoxDecoration(color: whiteColor, boxShadow: [BoxShadow(offset: const Offset(0, 4), blurRadius: 4, spreadRadius: 0, color: Colors.black.withOpacity(0.15))]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Your Credit Score In",
                          style: TextStyle(
                            color: draKText,
                            fontFamily: medium,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 4),
                        GestureDetector(
                          onTap: () {
                            CibilBottomSheet.show(context: context);
                          },
                          child: Row(
                            children: [
                              const Text(
                                "Good",
                                style: TextStyle(
                                  color: greenSec,
                                  fontFamily: semiBold,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Image.asset(infoIc, height: 10, width: 10)
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      "814",
                      style: TextStyle(
                        color: draKText,
                        fontFamily: bold,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        fontSize: 26,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: const BoxDecoration(color: whiteColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width),
                    const Text(
                      "See What Changed",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: medium,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "See the factors affecting your score",
                      style: TextStyle(
                        color: borderNew,
                        fontFamily: regular,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 26),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const PaymentHistoryScreen(
                              tittle: 'Payment History',
                            ));
                      },
                      child: cont(
                        "Payment History",
                        paymentHistoryIc,
                        "impact - High",
                        "100%",
                        "Excellent",
                      ),
                    ),
                    const SizedBox(height: 14),
                    InkWell(
                      onTap: () {
                        Get.to(() => const PaymentHistoryScreen(
                              tittle: 'Cr. Card utilization',
                            ));
                      },
                      child: cont(
                        "Cr. Card utilization",
                        cardUtillizationIc,
                        "impact - High",
                        "50%",
                        "Good",
                      ),
                    ),
                    const SizedBox(height: 14),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const PaymentHistoryScreen(
                              tittle: 'Credit Age',
                            ));
                      },
                      child: cont(
                        "Credit Age",
                        creditAgeIc,
                        "impact - Medium",
                        "1 Year +",
                        "Average",
                      ),
                    ),
                    const SizedBox(height: 14),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const PaymentHistoryScreen(
                              tittle: 'Total Account',
                            ));
                      },
                      child: cont(
                        "Total Account",
                        totalAccount,
                        "impact - High",
                        "5",
                        "Good",
                      ),
                    ),
                    const SizedBox(height: 14),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const PaymentHistoryScreen(
                              tittle: 'Enquiries',
                            ));
                      },
                      child: cont(
                        "Enquiries",
                        paymentHistoryIc,
                        "impact - Low",
                        "0",
                        "Low",
                      ),
                    ),
                    const SizedBox(height: 14),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 8),
                decoration: const BoxDecoration(color: whiteColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width),
                    const Text(
                      "Your Account",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: medium,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 26),
                    MediaQuery.removePadding(
                      removeTop: true,
                      removeBottom: true,
                      removeLeft: true,
                      removeRight: true,
                      context: context,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 3,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: (){
                              Get.to(()=>const AccountDetailsScreen());
                            },
                            child: SizedBox(
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        bankIcNew,
                                        height: 40,
                                        width: 40,
                                      ),
                                      const SizedBox(width: 19),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "YES BANK",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: medium,
                                              fontWeight: FontWeight.w500,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 16,
                                            ),
                                          ),
                                          const Text(
                                            "Credit Card: ***** 1230",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: regular,
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 12,
                                            ),
                                          ),
                                          RichText(
                                            text: const TextSpan(
                                              text: "Status: ",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: regular,
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 12,
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: "Active",
                                                  style: TextStyle(
                                                    color: greenSec,
                                                    fontFamily: regular,
                                                    fontWeight: FontWeight.w400,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 12,
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                  Divider(
                                    color: primaryClNew.withOpacity(0.43),
                                  ),
                                  const SizedBox(height: 14),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Found an error in your Report",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: medium,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "inconsistent information? you can get it rectified by reporting it to the bureau.",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: regular,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 10),
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: primaryClNew, width: 1),
                          ),
                          child: const Center(
                            child: Text(
                              "Found an error",
                              style: TextStyle(
                                color: primaryClNew,
                                fontFamily: medium,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget cont(String tittle, String icon, String subTittle, String perValue, String type) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 11),
          decoration: BoxDecoration(
            image: const DecorationImage(image: AssetImage(subtract), fit: BoxFit.fill),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 1),
                blurRadius: 6,
                spreadRadius: 0,
                color: Colors.black.withOpacity(0.18),
              )
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                icon,
                height: 26,
                width: 26,
              ),
              const SizedBox(width: 14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    tittle,
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: medium,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    subTittle,
                    style: const TextStyle(
                      color: borderNew,
                      fontFamily: regular,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    perValue,
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: medium,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    type,
                    style: const TextStyle(
                      color: greenSec,
                      fontFamily: regular,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
        Positioned(
          right: -10,
          top: 0,
          bottom: 0,
          child: Image.asset(
            arrowRoundIc,
            height: 24,
            width: 24,
          ),
        ),
      ],
    );
  }
}

class CibilBottomSheet {
  static show({
    required BuildContext context,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (builder) => Wrap(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 7,
              ),
              GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Image.asset(cancelIc, height: 28, width: 28)),
              const SizedBox(
                height: 7,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 22),
                decoration: const BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Good Credit Score",
                      style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 16,
                        fontFamily: semiBold,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Divider(color: primaryClNew.withOpacity(0.43), height: 1),
                    const SizedBox(height: 14),
                    const Text(
                      "A Score Above 700 Will Help You Get The Best Offers On Loans And Credit Cards",
                      style: TextStyle(
                        color: textColorSec,
                        fontStyle: FontStyle.normal,
                        fontSize: 12,
                        fontFamily: regular,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Credit score Range*",
                        style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontSize: 16,
                          fontFamily: semiBold,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                              decoration: const BoxDecoration(
                                color: Color(0xFFD9EEFF),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  "Category",
                                  style: TextStyle(
                                    color: secondary2Cl,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14,
                                    fontFamily: semiBold,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                              decoration: const BoxDecoration(
                                color: Color(0xFFD9EEFF),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  "Range",
                                  style: TextStyle(
                                    color: secondary2Cl,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14,
                                    fontFamily: semiBold,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                              decoration: BoxDecoration(
                                color: const Color(0xFFD9EEFF),
                                border: Border.all(color: const Color(0xFFBCDAF3)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 12,
                                    width: 12,
                                    decoration: BoxDecoration(color: Colors.transparent, shape: BoxShape.circle, border: Border.all(color: const Color(0xFF00960F), width: 2)),
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    "Excellent",
                                    style: TextStyle(
                                      color: Color(0xFF00960F),
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14,
                                      fontFamily: medium,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                              decoration: BoxDecoration(
                                color: const Color(0xFFD9EEFF),
                                border: Border.all(color: const Color(0xFFBCDAF3)),
                              ),
                              child: const Center(
                                child: Text(
                                  "780-900",
                                  style: TextStyle(
                                    color: secondary2Cl,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14,
                                    fontFamily: medium,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                              decoration: BoxDecoration(
                                color: const Color(0xFFD9EEFF),
                                border: Border.all(color: const Color(0xFFBCDAF3)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 12,
                                    width: 12,
                                    decoration: BoxDecoration(color: Colors.transparent, shape: BoxShape.circle, border: Border.all(color: const Color(0xFFFFB800), width: 2)),
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    "Good",
                                    style: TextStyle(
                                      color: Color(0xFFFFB800),
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14,
                                      fontFamily: medium,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                              decoration: BoxDecoration(
                                color: const Color(0xFFD9EEFF),
                                border: Border.all(color: const Color(0xFFBCDAF3)),
                              ),
                              child: const Center(
                                child: Text(
                                  "706-779",
                                  style: TextStyle(
                                    color: secondary2Cl,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14,
                                    fontFamily: medium,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                              decoration: BoxDecoration(
                                color: const Color(0xFFD9EEFF),
                                border: Border.all(color: const Color(0xFFBCDAF3)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 12,
                                    width: 12,
                                    decoration: BoxDecoration(color: Colors.transparent, shape: BoxShape.circle, border: Border.all(color: const Color(0xFFFF6B00), width: 2)),
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    "Average",
                                    style: TextStyle(
                                      color: Color(0xFFFF6B00),
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14,
                                      fontFamily: medium,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                              decoration: BoxDecoration(
                                color: const Color(0xFFD9EEFF),
                                border: Border.all(color: const Color(0xFFBCDAF3)),
                              ),
                              child: const Center(
                                child: Text(
                                  "631-705",
                                  style: TextStyle(
                                    color: secondary2Cl,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14,
                                    fontFamily: medium,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                              decoration: BoxDecoration(
                                color: const Color(0xFFD9EEFF),
                                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20)),
                                border: Border.all(color: const Color(0xFFBCDAF3)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 12,
                                    width: 12,
                                    decoration: BoxDecoration(color: Colors.transparent, shape: BoxShape.circle, border: Border.all(color: const Color(0xFFFF2727), width: 2)),
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    "Poor",
                                    style: TextStyle(
                                      color: Color(0xFFFF2727),
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14,
                                      fontFamily: medium,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                              decoration: BoxDecoration(
                                color: const Color(0xFFD9EEFF),
                                border: Border.all(color: const Color(0xFFBCDAF3)),
                                borderRadius: const BorderRadius.only(bottomRight: Radius.circular(20)),
                              ),
                              child: const Center(
                                child: Text(
                                  "631-705",
                                  style: TextStyle(
                                    color: secondary2Cl,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14,
                                    fontFamily: medium,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "*These Score Ranges Are Generally Accepted In Industry",
                        style: TextStyle(
                          color: textColorSec,
                          fontStyle: FontStyle.normal,
                          fontSize: 12,
                          fontFamily: regular,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: const LinearGradient(colors: [
                              Color(0xFF189DFF),
                              Color(0xFF0070C1),
                            ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
                        width: 300,
                        height: 42,
                        child: const Center(
                          child: Text(
                            "Okay, Go It.",
                            style: TextStyle(
                              color: whiteColor,
                              fontFamily: medium,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
