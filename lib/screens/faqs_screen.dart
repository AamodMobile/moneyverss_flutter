import 'package:get/get.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/controllers/faqs_controller.dart';

class FaqsScreen extends StatefulWidget {
  const FaqsScreen({super.key});

  @override
  State<FaqsScreen> createState() => _FaqsScreenState();
}

class _FaqsScreenState extends State<FaqsScreen> {
  FaqsController faqsController = Get.put(FaqsController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: Get.find<FaqsController>(),
        initState: (state) {
          Get.find<FaqsController>().faqsGet();
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
                        "FAQ",
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
              body: Builder(builder: (context) {
                if (contextCtr.isLoading) {
                  return const LoaderClass();
                }
                if (contextCtr.faqsList.isEmpty) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 200,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'No Data Found',
                          style: TextStyle(
                            color: mainColor,
                            fontSize: 14,
                            fontFamily: regular,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return SingleChildScrollView(
                    child: Column(
                  children: [
                    Container(
                      height: 60,
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(243, 248, 255, 1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Frequently Asked Questions',
                            style: TextStyle(
                              color: primaryClNew,
                              fontSize: 14,
                              fontFamily: regular,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Image.asset(
                            faqIc1,
                            height: 40,
                            width: 40,
                          )
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: contextCtr.faqsList
                          .map(
                            (e) => Container(
                              padding: const EdgeInsets.symmetric(vertical: 0),
                              decoration: BoxDecoration(color: whiteColor, border: Border.all(color: borderNewCl)),
                              child: ExpansionTile(
                                childrenPadding: EdgeInsets.zero,
                                iconColor: borderNewCl,
                                title: Text(
                                  e.title.toString(),
                                  style: const TextStyle(
                                    color: draKText,
                                    fontFamily: medium,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 12,
                                  ),
                                ),
                                children: [
                                  ListTile(
                                    contentPadding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
                                    title: Text(
                                      e.description.toString(),
                                      style: const TextStyle(
                                        color: greyNew,
                                        fontFamily: regular,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ));
              }),
            ),
          );
        });
  }
}
