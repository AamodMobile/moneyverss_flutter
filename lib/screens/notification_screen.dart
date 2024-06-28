import 'package:get/get.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/controllers/notification_controller.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  NotificationListController controller = Get.put(NotificationListController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder(
          init: Get.find<NotificationListController>(),
          initState: (state) {
            Get.find<NotificationListController>().notificationsGet();
          },
          builder: (contextCtr) {
            return Scaffold(
              backgroundColor: homeBgCl,
              appBar: PreferredSize(
                preferredSize: Size(MediaQuery.of(context).size.width, 65),
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16,),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      color: whiteColor,
                      border: Border.fromBorderSide(
                          BorderSide(color: Color(0xFFB6D3FF)))),
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
                      Text(
                        "Notifications",
                        style: TextStyle(
                          color: draKText,
                          fontFamily: semiBold,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 16,
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: (){
                          controller.deleteNotification();
                        },
                        child: Container(
                          height: 30,
                          width: 91,
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color.fromRGBO(255, 90, 90, 1))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(closeIc, height: 12, width: 12),
                              const SizedBox(width: 12),
                              const Text(
                                "Clear All",
                                style: TextStyle(
                                  color: Color.fromRGBO(255, 90, 90, 1),
                                  fontFamily: medium,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              body: Column(
                children: [
                  Builder(builder: (context) {
                    if (contextCtr.isLoading) {
                      return const LoaderClass();
                    }
                    if (contextCtr.notificationList.isEmpty) {
                      return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height - 100,
                          child: Column(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 100,
                              ),
                              Image.asset(
                                notNotification,
                                height: 229,
                                width: 229,
                              ),
                              const SizedBox(height: 14),
                              const Text(
                                "No Notification Found",
                                style: TextStyle(
                                  color: draKText,
                                  fontFamily: semiBold,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 30),
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
                                  width: 132,
                                  height: 43,
                                  child: const Center(
                                    child: Text(
                                      "Go Back",
                                      style: TextStyle(
                                        color: whiteColor,
                                        fontFamily: medium,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ));
                    }
                    return Expanded(
                      child: ListView.builder(
                        itemCount: contextCtr.notificationList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.only(bottom: 5, left: 17, right: 17, top: 5),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: whiteColor,
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(0, 1),
                                  blurRadius: 10,
                                  spreadRadius: 0,
                                  color: Color.fromRGBO(0, 0, 0, 0.15),
                                ),
                              ],
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Visibility(
                                  visible: false,
                                  child: Container(
                                    height: 93,
                                    width: 80,
                                    margin: const EdgeInsets.only(right: 9),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(6),
                                        child: Image.asset(
                                          bankImg,
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        contextCtr.notificationList[index].title.toString(),
                                        maxLines: 1,
                                        style: const TextStyle(
                                          color: secondaryCl,
                                          overflow: TextOverflow.ellipsis,
                                          fontFamily: semiBold,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 14,
                                        ),
                                      ),
                                      const SizedBox(height: 3),
                                      Text(
                                        contextCtr.notificationList[index].description.toString(),
                                        maxLines: 4,
                                        style: const TextStyle(
                                          color: textGeryCl,
                                          overflow: TextOverflow.ellipsis,
                                          fontFamily: medium,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 12,
                                        ),
                                      ),
                                      const SizedBox(height: 20,),
                                      Text(
                                        contextCtr.notificationList[index].date.toString(),
                                        maxLines: 1,
                                        style: const TextStyle(
                                          color: secondaryCl,
                                          overflow: TextOverflow.ellipsis,
                                          fontFamily: semiBold,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  }),
                ],
              ),
            );
          }),
    );
  }
}
