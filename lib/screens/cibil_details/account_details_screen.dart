import 'package:wireframe/constants/constants.dart';

class AccountDetailsScreen extends StatefulWidget {
  const AccountDetailsScreen({super.key});

  @override
  State<AccountDetailsScreen> createState() => _AccountDetailsScreenState();
}

class _AccountDetailsScreenState extends State<AccountDetailsScreen> {
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17,vertical: 20),
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
                              offset: const Offset(0, 5)
                          )
                        ]
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 6),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(width: 14),
                            Image.asset(
                              bankIcNew,
                              height: 32,
                              width: 32,
                            ),
                            const SizedBox(width: 19),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "YES BANK",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: medium,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  "Credit Card: ***** 1230",
                                  style: TextStyle(
                                    color: primaryClNew,
                                    fontFamily: regular,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 19),
                        const Divider(color: appBarClNew,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(width: 12),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Credit Card",
                                    style: TextStyle(
                                      color: draKText,
                                      fontFamily: medium,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "issued on 24 July 2024",
                                    style: TextStyle(
                                      color: draKText,
                                      fontFamily: regular,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],),
                            ),
                            const SizedBox(height: 74,child: VerticalDivider(
                              color: appBarClNew,
                            ),),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Credit Status",
                                    style: TextStyle(
                                      color: draKText,
                                      fontFamily: medium,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 17,vertical: 5),
                                    decoration: BoxDecoration(
                                      color: completeCl,
                                      borderRadius: BorderRadius.circular(5)
                                    ),
                                    child: const Text(
                                      "Active",
                                      style: TextStyle(
                                        color: whiteColor,
                                        fontFamily: regular,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],),
                            ),
                          ],)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
    ),);
  }
}
