import 'package:get/get.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/screens/cibil_details/account_details_screen.dart';

class PaymentHistoryScreen extends StatefulWidget {
  final String tittle;
  const PaymentHistoryScreen({super.key, required this.tittle});

  @override
  State<PaymentHistoryScreen> createState() => _PaymentHistoryScreenState();
}

class _PaymentHistoryScreenState extends State<PaymentHistoryScreen> {
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
                Text(
                  widget.tittle,
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: whiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 5,
                        spreadRadius: 0,
                        offset: Offset(0, 5)
                      )
                    ]
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 14),
                      Row(children: [
                        SizedBox(width: 12,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text(
                            "High Impact",
                            style: TextStyle(
                              color: draKText,
                              fontFamily: medium,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 5),
                          RichText(
                            text: const TextSpan(
                              text: "last Update in ",
                              style: TextStyle(
                                color: Color(0xFF70C0FD),
                                fontFamily: regular,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 11,
                              ),
                              children: [
                                TextSpan(
                                  text: "28 Mar 2024",
                                  style: TextStyle(
                                    color: secondaryCl,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 14,vertical: 7),
                          decoration: BoxDecoration(
                            color: Color(0xFF64CC9C),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10)
                            )
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Excellent",
                                style: TextStyle(
                                  color: whiteColor,
                                  fontFamily: medium,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(width: 10)
                            ],
                          ),
                        )
                      ],),
                      SizedBox(height: 19),
                      Divider(color: appBarClNew,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "0",
                                style: TextStyle(
                                  color: draKText,
                                  fontFamily: medium,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Late Payments",
                                style: TextStyle(
                                  color: draKText,
                                  fontFamily: regular,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14,
                                ),
                              ),
                            ],),
                        ),
                        SizedBox(height: 74,child: VerticalDivider(
                          color: appBarClNew,
                        ),),
                          SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "100%",
                                  style: TextStyle(
                                    color: draKText,
                                    fontFamily: medium,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Payments In Time",
                                  style: TextStyle(
                                    color: draKText,
                                    fontFamily: regular,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14,
                                  ),
                                ),
                              ],),
                          ),
                      ],)
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20,horizontal: 34),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color(0xFFE8F9F0)
                  ),
                  child: Row(
                    children: [
                      Image.asset(goodIc,height: 36,width: 36),
                      SizedBox(width: 30),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Payment are on time",
                              style: TextStyle(
                                color: Color(0xFF36B970),
                                fontFamily: medium,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 4),
                            const Text(
                              "Good job for Making Payment on time",
                              style: TextStyle(
                                color: draKText,
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
                const SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.circular(10)),
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
                            return GestureDetector(
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
      ),
    );
  }
}
