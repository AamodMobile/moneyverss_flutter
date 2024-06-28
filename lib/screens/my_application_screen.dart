import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/controllers/lead_list_controller.dart';
import 'package:wireframe/models/lead_list_model.dart';
import 'package:wireframe/screens/application_process_screen.dart';
import 'package:wireframe/screens/repayment_schedule_screen.dart';

class MyApplicationScreen extends StatefulWidget {
  const MyApplicationScreen({super.key});

  @override
  State<MyApplicationScreen> createState() => _MyApplicationScreenState();
}

class _MyApplicationScreenState extends State<MyApplicationScreen> {
  LeadListController controller = Get.put(LeadListController());
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: Get.find<LeadListController>(),
        initState: (state) {
          Get.find<LeadListController>().getLeadList();
        },
        builder: (contextCtrl) {
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
                        "My Application",
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
              body: Column(
                children: [
                  SizedBox(height: 15,),
                  Container(
                      height: 40,
                      margin: const EdgeInsets.symmetric(horizontal: 38),
                      decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = 0;
                                  controller.getLeadList();
                                });
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: selectedIndex == 0 ? primaryClNew : whiteColor,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    bottomLeft: Radius.circular(15),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "Running",
                                    style: TextStyle(
                                      color: selectedIndex == 0 ? whiteColor : primaryCl,
                                      fontFamily: regular,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = 1;
                                  controller.getPastLeads();
                                });
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: selectedIndex == 1 ? primaryClNew : whiteColor,
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    bottomRight: Radius.circular(15),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "Past",
                                    style: TextStyle(
                                      color: selectedIndex == 1 ? whiteColor : primaryCl,
                                      fontFamily: regular,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )),
                  const SizedBox(height: 14),
                  Builder(builder: (context) {
                    if (contextCtrl.isLoading) {
                      return const LoaderClass();
                    }
                    return Expanded(
                        child: selectedIndex == 0
                            ? contextCtrl.leadDataList.isNotEmpty
                                ? ListView.separated(
                                    itemCount: contextCtrl.leadDataList.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      return myRunningListTile(contextCtrl.leadDataList[index]);
                                    },
                                    separatorBuilder: (BuildContext context, int index) {
                                      return const SizedBox(height: 7);
                                    },
                                  )
                                : SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height - 100,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width,
                                          height: 100,
                                        ),
                                        Image.asset(
                                          notApplication,
                                          height: 229,
                                          width: 229,
                                        ),
                                        const SizedBox(height: 14),
                                        const Text(
                                          "No Running Application Found",
                                          style: TextStyle(
                                            color: draKText,
                                            fontFamily: semiBold,
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(height: 30),
                                      ],
                                    ))
                            : contextCtrl.pastLeadList.isNotEmpty
                                ? ListView.separated(
                                    itemCount: contextCtrl.pastLeadList.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      return myPastListTile(contextCtrl.pastLeadList[index]);
                                    },
                                    separatorBuilder: (BuildContext context, int index) {
                                      return const SizedBox(height: 7);
                                    },
                                  )
                                : SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height - 100,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width,
                                          height: 100,
                                        ),
                                        Image.asset(
                                          notApplication,
                                          height: 229,
                                          width: 229,
                                        ),
                                        const SizedBox(height: 14),
                                        const Text(
                                          "No Past Application Found",
                                          style: TextStyle(
                                            color: draKText,
                                            fontFamily: semiBold,
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(height: 30),
                                      ],
                                    )));
                  }),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          );
        });
  }

  myRunningListTile(LeadData leadData) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 7),
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 1),
            blurRadius: 15,
            spreadRadius: 0,
            color: const Color(0xFF000000).withOpacity(0.15),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(width: MediaQuery.of(context).size.width),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    "Application No. ${leadData.uniqueId}",
                    style: const TextStyle(
                      color: draKText,
                      fontStyle: FontStyle.normal,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      fontFamily: semiBold,
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          leadData.leadStatus.toString() == "Pending" ? pendingIc : doneIc,
                          height: 8,
                          width: 8,
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            leadData.leadStatus.toString(),
                            style: TextStyle(
                              color: leadData.leadStatus.toString() == "Pending" ? pendingCl : greenSec,
                              fontStyle: FontStyle.normal,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              fontFamily: semiBold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 12),
          const Divider(color: homeBgCl, height: 1),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                  decoration: const BoxDecoration(color: bgCont),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Loan Type",
                              style: TextStyle(
                                color: textGeryCl,
                                fontStyle: FontStyle.normal,
                                fontSize: 8,
                                fontWeight: FontWeight.w500,
                                fontFamily: semiBold,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              leadData.loanType.toString(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: draKText,
                                fontStyle: FontStyle.normal,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                fontFamily: semiBold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  decoration: const BoxDecoration(color: Color(0xFFF1FFF2)),
                  child: Row(
                    children: [
                      Container(
                        color: primaryClNew,
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Date",
                            style: TextStyle(
                              color: textGeryCl,
                              fontStyle: FontStyle.normal,
                              fontSize: 8,
                              fontWeight: FontWeight.w500,
                              fontFamily: semiBold,
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            formatDate(leadData.createdAt.toString()),
                            style: const TextStyle(
                              color: draKText,
                              fontStyle: FontStyle.normal,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              fontFamily: semiBold,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(width: 12),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ApplicationProcessScreen(
                                  id: leadData.id.toString(),
                                )));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        gradient: const LinearGradient(colors: [
                          Color(0xFF189DFF),
                          Color(0xFF0070C1),
                        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                    width: 95,
                    height: 27,
                    child: const Center(
                      child: Text(
                        "View Details",
                        style: TextStyle(
                          color: whiteColor,
                          fontFamily: medium,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10)
        ],
      ),
    );
  }

  myPastListTile(LeadData model) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 7),
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 1),
            blurRadius: 15,
            spreadRadius: 0,
            color: const Color(0xFF000000).withOpacity(0.15),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
          ),
          Row(
            children: [
              const SizedBox(width: 9),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Application No. ${model.uniqueId}",
                    style: const TextStyle(
                      color: draKText,
                      fontStyle: FontStyle.normal,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      fontFamily: semiBold,
                    ),
                  ),
                  const SizedBox(height: 2),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(color: homeBgCl, height: 1),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  decoration: const BoxDecoration(color: bgCont),
                  child: Row(
                    children: [
                      Container(
                        color: primaryClNew,
                      ),
                      const SizedBox(width: 14),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Lone Type",
                            style: TextStyle(
                              color: textGeryCl,
                              fontStyle: FontStyle.normal,
                              fontSize: 8,
                              fontWeight: FontWeight.w500,
                              fontFamily: semiBold,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            model.loanType.toString(),
                            style: const TextStyle(
                              color: draKText,
                              fontStyle: FontStyle.normal,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              fontFamily: semiBold,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(width: 14),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 5),
                  decoration: const BoxDecoration(color: Color(0xFFF1FFF2)),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Date",
                            style: TextStyle(
                              color: textGeryCl,
                              fontStyle: FontStyle.normal,
                              fontSize: 8,
                              fontWeight: FontWeight.w500,
                              fontFamily: semiBold,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            formatDate(model.createdAt.toString()),
                            style: const TextStyle(
                              color: draKText,
                              fontStyle: FontStyle.normal,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              fontFamily: semiBold,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(width: 12),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: const BoxDecoration(color: Color(0xFFf3f3f3)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Loan Completion Date",
                      style: TextStyle(
                        color: primaryCl,
                        fontStyle: FontStyle.normal,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        fontFamily: semiBold,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      "12-10-2032",
                      style: TextStyle(
                        color: draKText,
                        fontStyle: FontStyle.normal,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontFamily: semiBold,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const RepaymentScheduleScreen());
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        gradient: const LinearGradient(colors: [
                          Color(0xFF189DFF),
                          Color(0xFF0070C1),
                        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                    child: const Center(
                      child: Text(
                        "Repayment schedule",
                        style: TextStyle(
                          color: whiteColor,
                          fontFamily: medium,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 12,
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
    );
  }

  String formatDate(String date) {
    var parsedDate = DateFormat("yyyy-MM-dd").parse(date);
    var formattedDate = DateFormat("yyyy-MM-dd").format(parsedDate);
    return formattedDate;
  }
}
