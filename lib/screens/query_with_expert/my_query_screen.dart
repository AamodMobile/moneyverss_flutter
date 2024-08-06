import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/controllers/query_controller.dart';
import 'package:wireframe/screens/query_with_expert/query_with_expert_screen.dart';

class MyQueryScreen extends StatefulWidget {
  final String leadId;
  final String applicationNo;

  const MyQueryScreen({super.key, required this.leadId, required this.applicationNo});

  @override
  State<MyQueryScreen> createState() => _MyQueryScreenState();
}

class _MyQueryScreenState extends State<MyQueryScreen> {
  QueryController controller = Get.put(QueryController());
  bool viewAll = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: Get.find<QueryController>(),
        initState: (state) {
          Get.find<QueryController>().queryListGet(widget.leadId);
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
                            padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8),
                            child: Image.asset(
                              icBack,
                              height: 24,
                              width: 24,
                            ),
                          )),
                      const SizedBox(width: 5),
                      const Text(
                        "My Query",
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
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Column(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width),
                    Builder(builder: (context) {
                      if (contextCtr.isLoading) {
                        return const LoaderClass();
                      }
                      if (contextCtr.queryList.isEmpty) {
                        return SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height - 200,
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
                                  "No Query Found",
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
                            ));
                      }
                      return Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: contextCtr.queryList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                padding: const EdgeInsets.all(9),
                                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: borderNewCl)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                     Text(
                                      "File No:- ${widget.applicationNo}",
                                      style: const TextStyle(
                                        fontSize: 10,
                                        fontFamily: medium,
                                        fontWeight: FontWeight.w500,
                                        color: textGeryCl,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      contextCtr.queryList[index].reasonName.toString(),
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontFamily: semiBold,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      contextCtr.queryList[index].message.toString(),
                                      style: const TextStyle(fontSize: 10, fontFamily: regular, fontWeight: FontWeight.w400, color: Color(0xFF454545)),
                                    ),
                                    const SizedBox(height: 10),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: borderNewCl),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image.asset(calendarAlt, color: primaryClNew, height: 18, width: 18),
                                          const SizedBox(width: 7),
                                          Text(
                                            formatDate(contextCtr.queryList[index].createdAt.toString()),
                                            style: const TextStyle(
                                              fontSize: 10,
                                              fontFamily: medium,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Divider(
                                      color: borderNewCl,
                                      height: 1,
                                    ),
                                    const SizedBox(height: 10),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: borderNewCl),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      contextCtr.queryList[index].status.toString() == "Pending"
                                                          ? "Your Query Was Under Process..."
                                                          : contextCtr.queryList[index].status.toString() == "Complete"
                                                              ? "Your Query Was Successfully Resolved..."
                                                              : "Your Query Was Not Resolved...",
                                                      overflow: TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                        fontSize: 10,
                                                        fontFamily: medium,
                                                        fontWeight: FontWeight.w500,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 6),
                                                    Text(
                                                      formatDate(contextCtr.queryList[index].updatedAt.toString()),
                                                      style: const TextStyle(
                                                        fontSize: 10,
                                                        fontFamily: medium,
                                                        fontWeight: FontWeight.w400,
                                                        color: textGeryCl,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                                                decoration: BoxDecoration(
                                                  color: contextCtr.queryList[index].status.toString() == "Pending"
                                                      ? pendingCl
                                                      : contextCtr.queryList[index].status.toString() == "Complete"
                                                          ? completeCl
                                                          : rejectCl,
                                                  borderRadius: BorderRadius.circular(4),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                      contextCtr.queryList[index].status.toString() == "Pending"
                                                          ? pendingIc
                                                          : contextCtr.queryList[index].status.toString() == "Complete"
                                                              ? doneIc
                                                              : rejectIc,
                                                      height: 8,
                                                      width: 8,
                                                      color: contextCtr.queryList[index].status.toString() == "Pending"
                                                          ? Colors.white
                                                          : contextCtr.queryList[index].status.toString() == "Complete"
                                                              ? greenSec
                                                              : redCl,
                                                    ),
                                                    const SizedBox(width: 6),
                                                    Text(
                                                      contextCtr.queryList[index].status.toString(),
                                                      style: TextStyle(
                                                        color: contextCtr.queryList[index].status.toString() == "Pending"
                                                            ? Colors.white
                                                            : contextCtr.queryList[index].status.toString() == "Complete"
                                                                ? greenSec
                                                                : redCl,
                                                        fontStyle: FontStyle.normal,
                                                        fontSize: 10,
                                                        fontWeight: FontWeight.w500,
                                                        fontFamily: semiBold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                           contextCtr.queryList[index].adminReply == ""
                                              ? const SizedBox()
                                              :
                                          Container(
                                            width: MediaQuery.of(context).size.width,
                                            padding: const EdgeInsets.all(6),
                                            decoration: BoxDecoration(color: const Color(0xFFF0EEEE), borderRadius: BorderRadius.circular(6)),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                RichText(
                                                  maxLines: viewAll ? 10000 : 2,
                                                  text: TextSpan(
                                                    text: contextCtr.queryList[index].adminReply.toString(),
                                                    style: const TextStyle(
                                                      fontSize: 10,
                                                      fontFamily: regular,
                                                      fontWeight: FontWeight.w400,
                                                      color: Color(0xFF454545),
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        viewAll = !viewAll;
                                                      });
                                                    },
                                                    child: Text(
                                                      viewAll? "Less ":"View All",
                                                      style: const TextStyle(
                                                        fontSize: 10,
                                                        fontFamily: semiBold,
                                                        fontWeight: FontWeight.w600,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          )

                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      );
                    })
                  ],
                ),
              ),
              bottomSheet: contextCtr.queryList.isEmpty
                  ? const SizedBox()
                  : Container(
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
                                    leadId: widget.leadId,
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
                                'New Query with expert',
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
    var parsedDate = DateFormat("yyyy-MM-dd").parse(date);
    var formattedDate = DateFormat("dd-MMMM-yyyy").format(parsedDate);
    return formattedDate;
  }
}
