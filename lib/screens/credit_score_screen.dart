import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/screens/cibil_details/cibil_details_screen.dart';

import '../constants/get_device_type.dart';

class CreditScoreScreen extends StatefulWidget {
  const CreditScoreScreen({super.key});

  @override
  State<CreditScoreScreen> createState() => _CreditScoreScreenState();
}

class _CreditScoreScreenState extends State<CreditScoreScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 17),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: appBarClNew1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(244, 247, 255, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Hii, Yusuf",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: medium,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  "Your Credit Report For Jan ‘24",
                                  style: TextStyle(
                                    color: borderNew,
                                    fontFamily: regular,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Next Report on",
                                  style: TextStyle(
                                    color: borderNew,
                                    fontFamily: regular,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  "15 Jan ‘24",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: medium,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 188,
                      width: 188,
                      child: SfRadialGauge(
                        enableLoadingAnimation: true,
                        backgroundColor: Colors.white,
                        title: const GaugeTitle(text: ''),
                        axes: [
                          RadialAxis(minimum: 300, maximum: 900, ranges: [
                            GaugeRange(
                                startValue: 300,
                                endValue: 722,
                                color: Colors.red),
                            GaugeRange(
                                startValue: 723,
                                endValue: 747,
                                color: Colors.orange),
                            GaugeRange(
                                startValue: 748,
                                endValue: 764,
                                color: Colors.yellow),
                            GaugeRange(
                                startValue: 765,
                                endValue: 777,
                                color: Colors.greenAccent),
                            GaugeRange(
                                startValue: 778,
                                endValue: 900,
                                color: Colors.green),
                          ], pointers: const [
                            NeedlePointer(value: 750),
                          ], annotations: const [
                            GaugeAnnotation(
                              widget: Text(
                                '750.0',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              angle: 90,
                              positionFactor: 0.5,
                            )
                          ])
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(21),
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(227, 245, 255, 1),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                soundIc,
                                height: 27,
                                width: 27,
                              ),
                              const SizedBox(width: 12),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Did You Know ?",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: medium,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    "Your Oldest Account is 5Y 8M Old",
                                    style: TextStyle(
                                      color: borderNew,
                                      fontFamily: regular,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const CibilDetailsScreen());
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
                                      end: Alignment.centerRight)),
                              width: 300,
                              height: 38,
                              child: const Center(
                                child: Text(
                                  "Check For More Info",
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
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 17),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: const BoxDecoration(color: Color(0xFFf2f4fa)),
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
                    cont("Payment History", paymentHistoryIc, "impact - High",
                        "100%", "Excellent"),
                    const SizedBox(height: 14),
                    cont("Cr. Card utilization", cardUtillizationIc,
                        "impact - High", "50%", "Good"),
                    const SizedBox(height: 14),
                    cont("Credit Age", creditAgeIc, "impact - Medium",
                        "1 Year +", "Average"),
                    const SizedBox(height: 14),
                    cont("Total Account", totalAccount, "impact - High", "5",
                        "Good"),
                    const SizedBox(height: 14),
                    cont("Enquiries", paymentHistoryIc, "impact - Low", "0",
                        "Low"),
                    const SizedBox(height: 14),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget cont(String tittle, String icon, String subTittle, String perValue,
      String type) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Card(
          elevation: 10,
          surfaceTintColor: Colors.white,
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 11),
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
                SizedBox(
                  width: GetDeviceType().getDeviceType(context)?20 : 10,
                ),
              ],
            ),
          ),
        ),
        Positioned.fill(
          right: -10,
          child: Align(
            alignment: Alignment.centerRight,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      const Color(0xFFD4D5D9),
                      const Color(0xFFF1F5F9),
                    ],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Image.asset(
                  arrowRoundIc,
                  height: 24,
                  width: 24,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
