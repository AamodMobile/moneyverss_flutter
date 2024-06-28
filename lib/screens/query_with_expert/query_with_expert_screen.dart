import 'package:get/get.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/constants/util.dart';
import 'package:wireframe/controllers/query_controller.dart';
import 'package:wireframe/widget/text_filled_widget.dart';

class QueryWithExpertScreen extends StatefulWidget {
  final String leadId;
  const QueryWithExpertScreen({Key? key, required this.leadId}) : super(key: key);

  @override
  State<QueryWithExpertScreen> createState() => _QueryWithExpertScreenState();
}

class _QueryWithExpertScreenState extends State<QueryWithExpertScreen> {
  QueryController controller = Get.put(QueryController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: Get.find<QueryController>(),
        initState: (state) {
          Get.find<QueryController>().queryReasonListGet();
        },
        builder: (contextCtr) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: homeBgCl,
              appBar: PreferredSize(
                preferredSize: Size(MediaQuery.of(context).size.width, 60),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
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
                        ),
                      ),
                      SizedBox(width: 5),
                      const Text(
                        "Query With Expert",
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
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Builder(builder: (context) {
                    if (contextCtr.isLoading) {
                      return const LoaderClass();
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: MediaQuery.of(context).size.width),
                        const Text(
                          'Select Reason',
                          style: TextStyle(
                            color: Colors.black,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            fontFamily: semiBold,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 10),
                        MediaQuery.removePadding(
                          removeTop: true,
                          context: context,
                          child: ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemCount: contextCtr.queryReasonList.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                padding: const EdgeInsets.symmetric(vertical: 7),
                                child: Row(
                                  children: [
                                    Radio(
                                      visualDensity: const VisualDensity(
                                        horizontal: VisualDensity.minimumDensity,
                                        vertical: VisualDensity.minimumDensity,
                                      ),
                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      activeColor: primaryClNew,
                                      value: contextCtr.queryReasonList[index],
                                      groupValue: contextCtr.selectedReason,
                                      onChanged: (value) {
                                        setState(() {
                                          contextCtr.selectedReason = value;
                                        });
                                      },
                                    ),
                                    const SizedBox(width: 14),
                                    Text(
                                      contextCtr.queryReasonList[index].reason.toString(),
                                      style: TextStyle(
                                        color: textGeryCl,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: medium,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Do You Have Any Thoughts You'd Like To Share ?",
                          style: TextStyle(
                            color: Colors.black,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            fontFamily: semiBold,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 6),
                        MyTextFormField(
                          hint: "Enter Right Here...",
                          obscureText: false,
                          controller: contextCtr.message,
                          readOnly: false,
                          border: borderNewCl,
                          fillColor: whiteColor,
                          maxLines: 7,
                        )
                      ],
                    );
                  }),
                ),
              ),
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
                        if (contextCtr.selectedReason == null) {
                          errorToast("Select Reason");
                        } else if (contextCtr.message.text.isEmpty) {
                          errorToast("Enter Message ");
                        } else {
                          contextCtr.submitQuery(widget.leadId);
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: const LinearGradient(colors: [
                              Color(0xFF189DFF),
                              Color(0xFF0070C1),
                            ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
                        child: const Text(
                          'Submit',
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
}
