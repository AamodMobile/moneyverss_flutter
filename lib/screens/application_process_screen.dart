import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/controllers/lead_list_controller.dart';
import 'package:wireframe/screens/document_list_screen/document_list_screen.dart';
import 'package:wireframe/screens/query_with_expert/my_query_screen.dart';
import 'package:wireframe/screens/query_with_expert/query_with_expert_screen.dart';

class ApplicationProcessScreen extends StatefulWidget {
  final String id;

  const ApplicationProcessScreen({super.key, required this.id});

  @override
  State<ApplicationProcessScreen> createState() => _ApplicationProcessScreenState();
}

class _ApplicationProcessScreenState extends State<ApplicationProcessScreen> {
  LeadListController leadListController = Get.put(LeadListController());
  File? pickedImageFile;
  File? image1;
  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: Get.find<LeadListController>(),
        initState: (state) {
          Get.find<LeadListController>().getLoanStatusHistory(widget.id);
        },
        builder: (contextCtr) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: homeBgCl,
              appBar: PreferredSize(
                preferredSize: Size(MediaQuery.of(context).size.width, 60),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: whiteColor,
                  ),
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
                      const SizedBox(width: 5),
                      const Text(
                        "Application Process",
                        style: TextStyle(
                          color: draKText,
                          fontFamily: medium,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 16,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => MyQueryScreen(
                                leadId: contextCtr.leadDetails.value.id.toString(),
                                applicationNo: contextCtr.leadDetails.value.uniqueId.toString(),
                              ));
                        },
                        child: Image.asset(
                          querySupport,
                          height: 24,
                          width: 24,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              body: Builder(builder: (context) {
                if (contextCtr.isLoading) {
                  return const LoaderClass();
                }
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 14),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 17.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: contextCtr.statusList.asMap().entries.map((entry) {
                            final index = entry.key;
                            final item = entry.value;
                            return Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.155,
                                      child: Text(
                                        "Step-${index + 1}",
                                        style: TextStyle(
                                          color: item.isStatus == 1 ? primaryClNew : primaryCl,
                                          fontFamily: semiBold,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 16,
                                      width: 16,
                                      decoration: BoxDecoration(
                                        color: whiteColor,
                                        shape: BoxShape.circle,
                                        border: Border.all(color: item.isStatus == 1 ? primaryClNew : primaryCl, width: 3),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Text(
                                      item.name.toString(),
                                      style: TextStyle(
                                        color: item.isStatus == 1 ? primaryClNew : textHeading,
                                        fontFamily: medium,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                if (index < contextCtr.statusList.length - 1)
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(width: MediaQuery.of(context).size.width * 0.17),
                                      contextCtr.statusList[index].subStatus!.isEmpty
                                          ? SizedBox(
                                              width: 4,
                                              height: 30,
                                              child: VerticalDivider(
                                                width: 4,
                                                color: item.isStatus == 1 ? primaryClNew : primaryCl,
                                              ),
                                            )
                                          : SizedBox(
                                              width: 4,
                                              height: 50 * contextCtr.statusList[index].subStatus!.length.toDouble(),
                                              child: VerticalDivider(
                                                width: 4,
                                                color: item.isStatus == 1 ? primaryClNew : primaryCl,
                                              ),
                                            ),
                                      SizedBox(width: MediaQuery.of(context).size.width * 0.10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: contextCtr.statusList[index].subStatus!.asMap().entries.map((entry) {
                                                final ind = entry.key;
                                                final item = entry.value;
                                                return Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment: CrossAxisAlignment.end,
                                                      children: [
                                                        Container(
                                                          height: 16,
                                                          width: 16,
                                                          decoration: BoxDecoration(
                                                            color: whiteColor,
                                                            shape: BoxShape.circle,
                                                            border: Border.all(color: item.isStatus == 1 ? greenSec : primaryCl, width: 3),
                                                          ),
                                                        ),
                                                        const SizedBox(width: 16),
                                                        Expanded(
                                                          child: Text(
                                                            item.title.toString(),
                                                            overflow: TextOverflow.ellipsis,
                                                            style: TextStyle(
                                                              color: item.isStatus == 1 ? greenSec : textHeading,
                                                              fontFamily: medium,
                                                              fontWeight: FontWeight.w400,
                                                              fontStyle: FontStyle.normal,
                                                              fontSize: 10,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    if (ind < contextCtr.statusList[index].subStatus!.length - 1)
                                                      Row(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          SizedBox(width: MediaQuery.of(context).size.width * 0.17),
                                                          SizedBox(
                                                            width: 4,
                                                            height: 30,
                                                            child: VerticalDivider(
                                                              width: 4,
                                                              color: item.isStatus == 1 ? greenSec : primaryCl,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                  ],
                                                );
                                              }).toList(),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(
                          border: Border.all(color: primaryCl, width: 1),
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(14),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 7,
                              width: MediaQuery.of(context).size.width,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 14.0),
                              child: Text(
                                "Application No. ${contextCtr.leadDetails.value.uniqueId}",
                                style: const TextStyle(
                                  color: secondaryCl,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: semiBold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 14.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Name:${contextCtr.leadDetails.value.customerName}",
                                    style: const TextStyle(color: greenSec, fontFamily: semiBold, fontWeight: FontWeight.w600, fontStyle: FontStyle.normal, fontSize: 12),
                                  ),
                                  const SizedBox(width: 7),
                                  Container(
                                    decoration: BoxDecoration(color: priceBg, borderRadius: BorderRadius.circular(10)),
                                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 2),
                                    child: Text(
                                      contextCtr.leadDetails.value.loanAmountRange == "" ? "₹ ${contextCtr.leadDetails.value.loanAmount}" : "₹ ${contextCtr.leadDetails.value.loanAmountRange}",
                                      style: const TextStyle(
                                        color: blueCl,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: medium,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 7),
                            const Divider(
                              color: screenBgCl,
                              height: 1,
                            ),
                            const SizedBox(height: 7),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const SizedBox(
                                  width: 12,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Loan Type",
                                        style: TextStyle(
                                          color: textGeryCl,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: semiBold,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        contextCtr.leadDetails.value.loanType.toString(),
                                        style: const TextStyle(
                                          color: textHeading,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: semiBold,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const SizedBox(
                                    height: 28,
                                    child: VerticalDivider(
                                      width: 1,
                                      color: Colors.black,
                                    )),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Date",
                                        style: TextStyle(
                                          color: textGeryCl,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: semiBold,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        formatDate(contextCtr.leadDetails.value.createdAt.toString()),
                                        style: const TextStyle(
                                          color: textHeading,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: semiBold,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                const SizedBox(
                                    height: 28,
                                    child: VerticalDivider(
                                      width: 1,
                                      color: Colors.black,
                                    )),
                                const SizedBox(
                                  width: 12,
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(color: lightPink, borderRadius: BorderRadius.circular(4)),
                                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                                    child: Center(
                                      child: Text(
                                        contextCtr.leadDetails.value.leadStatus.toString(),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: redCl,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: semiBold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                              ],
                            ),
                            const SizedBox(height: 7),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      contextCtr.leadDetails.value.documentStatus.toString() == "No Documents Required"
                          ? const SizedBox()
                          : contextCtr.statusList.isNotEmpty && contextCtr.statusList[2].isStatus == 1
                              ? GestureDetector(
                                  onTap: () {
                                    Get.to(() => DocumentListScreen(leadId: contextCtr.leadDetails.value.id.toString()));
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: primaryCl, width: 1),
                                      borderRadius: BorderRadius.circular(10),
                                      color: whiteColor,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "Documents Requirement",
                                              style: TextStyle(
                                                color: textHeading,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: medium,
                                              ),
                                            ),
                                            Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                                              decoration: BoxDecoration(
                                                color: contextCtr.leadDetails.value.documentStatus == "Pending" ? Color(0xFFFFF4E3) : lightGreenSec,
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              child: contextCtr.leadDetails.value.documentStatus == "Pending"
                                                  ? Row(
                                                      children: [
                                                        Image.asset(
                                                          pendingIc,
                                                          height: 12,
                                                          width: 12,
                                                        ),
                                                        const SizedBox(width: 4),
                                                        Text(
                                                          contextCtr.leadDetails.value.documentStatus.toString(),
                                                          style: const TextStyle(
                                                            color: pendingCl,
                                                            fontStyle: FontStyle.normal,
                                                            fontSize: 11,
                                                            fontWeight: FontWeight.w600,
                                                            fontFamily: semiBold,
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  : Row(
                                                      children: [
                                                        Image.asset(
                                                          completeIc,
                                                          height: 12,
                                                          width: 12,
                                                        ),
                                                        const SizedBox(width: 4),
                                                        Text(
                                                          contextCtr.leadDetails.value.documentStatus.toString(),
                                                          style: const TextStyle(
                                                            color: greenSec,
                                                            fontStyle: FontStyle.normal,
                                                            fontSize: 11,
                                                            fontWeight: FontWeight.w600,
                                                            fontFamily: semiBold,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(height: 22),
                                        Container(
                                          width: MediaQuery.of(context).size.width,
                                          padding: EdgeInsets.symmetric(vertical: 8),
                                          decoration:
                                              BoxDecoration(color: Color(0xFFD4E6FF), borderRadius: BorderRadius.circular(6), border: Border.all(color: primaryClNew.withOpacity(0.43), width: 1)),
                                          child: const Center(
                                            child: Text(
                                              "View Documents And Upload",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: primaryClNew,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: semiBold,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                      const SizedBox(height: 8),
                      /*  Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.circular(12), border: Border.all(color: primaryClNew.withOpacity(0.43))),
                        child: Column(
                          children: [
                            contextCtr.leadDetails.value.documentStatus.toString() == "No Documents Required"
                                ? const SizedBox()
                                : contextCtr.statusList.isNotEmpty && contextCtr.statusList[2].isStatus == 1
                                    ? Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                                            child: Text(
                                              "Documents Requirement",
                                              style: TextStyle(
                                                color: secondaryCl,
                                                fontFamily: medium,
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                          Table(
                                            border: TableBorder.all(color: Colors.black),
                                            children: [
                                              // Table header row
                                              const TableRow(
                                                decoration: BoxDecoration(color: primaryCl), // Header row background color
                                                children: [
                                                  TableCell(
                                                    child: Center(
                                                      child: Text(
                                                        "", // Empty cell
                                                        style: TextStyle(
                                                          color: whiteColor,
                                                          fontFamily: medium,
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 10,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  TableCell(
                                                    child: Center(
                                                      child: Text(
                                                        "Status",
                                                        style: TextStyle(
                                                          color: whiteColor,
                                                          fontFamily: medium,
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 10,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  TableCell(
                                                    child: Center(
                                                      child: Text(
                                                        "Action",
                                                        style: TextStyle(
                                                          color: whiteColor,
                                                          fontFamily: medium,
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 10,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              // Data rows
                                              for (int index = 0; index < contextCtr.documentsList.length; index++)
                                                TableRow(
                                                  children: [
                                                    TableCell(
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text(
                                                          contextCtr.documentsList[index].title.toString(),
                                                          style: const TextStyle(
                                                            color: textHeading,
                                                            fontFamily: medium,
                                                            fontWeight: FontWeight.w500,
                                                            fontSize: 10,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    TableCell(
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Container(
                                                          height: 22,
                                                          width: 80,
                                                          decoration: BoxDecoration(
                                                            color: contextCtr.documentsList[index].isUploaded == 0 ? lightRedSec : lightGreenSec,
                                                            borderRadius: BorderRadius.circular(4),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              contextCtr.documentsList[index].isUploaded == 0 ? "Pending" : "Completed",
                                                              style: TextStyle(
                                                                color: contextCtr.documentsList[index].isUploaded == 0 ? pendingCl : completeCl,
                                                                fontSize: 10,
                                                                fontWeight: FontWeight.w600,
                                                                fontFamily: semiBold,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    TableCell(
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: contextCtr.documentsList[index].isUploaded == 0
                                                            ? GestureDetector(
                                                                onTap: () {
                                                                  galleryBottomSheet(context, contextCtr.documentsList[index].id.toString());
                                                                },
                                                                child: Container(
                                                                  height: 22,
                                                                  width: 80,
                                                                  decoration: BoxDecoration(
                                                                    color: secondaryCl,
                                                                    borderRadius: BorderRadius.circular(4),
                                                                  ),
                                                                  child: const Center(
                                                                    child: Text(
                                                                      "Upload",
                                                                      style: TextStyle(
                                                                        color: whiteColor,
                                                                        fontSize: 10,
                                                                        fontWeight: FontWeight.w600,
                                                                        fontFamily: semiBold,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                            : const Center(
                                                                child: Text(
                                                                  "Uploaded",
                                                                  style: TextStyle(
                                                                    color: primaryClNew,
                                                                    fontSize: 10,
                                                                    fontWeight: FontWeight.w600,
                                                                    fontFamily: semiBold,
                                                                  ),
                                                                ),
                                                              ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                            ],
                                          ),
                                        ],
                                      )
                                    : const SizedBox(),
                          ],
                        ),
                      ),*/
                      const SizedBox(height: 70)
                    ],
                  ),
                );
              }),
              bottomSheet: Container(
                color: whiteColor,
                width: MediaQuery.of(context).size.width,
                height: 70,
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => QueryWithExpertScreen(
                              leadId: contextCtr.leadDetails.value.id.toString(),
                            ));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 41, vertical: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: const LinearGradient(colors: [
                              Color(0xFF189DFF),
                              Color(0xFF0070C1),
                            ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
                        child: const Text(
                          'Query With Expert',
                          style: TextStyle(
                            color: whiteColor,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                            fontFamily: semiBold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  String formatDate(String date) {
    try {
      var parsedDate = DateFormat("yyyy-MM-dd").parse(date);
      var formattedDate = DateFormat("yyyy-MM-dd").format(parsedDate);
      return formattedDate;
    } catch (e) {
      return "";
    }
  }
}
