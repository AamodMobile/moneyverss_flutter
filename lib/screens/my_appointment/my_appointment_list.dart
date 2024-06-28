import 'package:get/get.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/controllers/appointment_controller.dart';
import 'package:wireframe/screens/my_appointment/appointment_details_screen.dart';
import 'package:wireframe/screens/my_appointment/my_appointment.dart';

class MyAppointmentList extends StatefulWidget {
  const MyAppointmentList({super.key});

  @override
  State<MyAppointmentList> createState() => _MyAppointmentListState();
}

class _MyAppointmentListState extends State<MyAppointmentList> {
  AppointmentController controller = Get.put(AppointmentController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: Get.find<AppointmentController>(),
        initState: (state) {
          Get.find<AppointmentController>().appointments();
        },
        builder: (contextCtr) {
          return SafeArea(
              child: Scaffold(
            backgroundColor: screenBgCl,
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
                    SizedBox(
                      width: 5,
                    ),
                    const Text(
                      "My Appointment",
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
                const SizedBox(height: 15),
                Builder(builder: (context) {
                  if (contextCtr.isLoading) {
                    return const LoaderClass();
                  }
                  if (contextCtr.appointmentList.isEmpty) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                        ),
                        /*Image.asset(
                          fiinzyLogo,
                          height: 23,
                          width: 64,
                        ),*/
                        SizedBox(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                        ),
                        Image.asset(
                          appointTopImg,
                          height: 178,
                          width: 220,
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          "No Appointment Yet",
                          style: TextStyle(
                            color: draKText,
                            fontFamily: semiBold,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            "Need expert advice? Simply book an appointment with our consultants to get personalized guidance tailored to your financial needs. Tap below to schedule your consultation and take control of your financial future. ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: draKText,
                              fontFamily: regular,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        const SizedBox(height: 26),
                        Align(
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: () {
                              Get.to(() => const MyAppointment(
                                    isNew: true,
                                    id: "",
                                  ));
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 50),
                              padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 11),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: primaryClNew, width: 1),
                                color: Colors.white,
                              ),
                              child: const Center(
                                child: Text(
                                  'Book An Appointment',
                                  style: TextStyle(
                                    color: primaryClNew,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: medium,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  return Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: contextCtr.appointmentList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: (){
                            Get.to(()=> AppointmentDetailsScreen(id: contextCtr.appointmentList[index].id.toString()));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            margin: const EdgeInsets.symmetric(horizontal: 17, vertical: 5),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(7), color: Colors.white, border: Border.all(color: primaryClNew.withOpacity(0.43))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          contextCtr.appointmentList[index].reasonsTitle.toString(),
                                          maxLines: 2,
                                          style: const TextStyle(
                                            color: secondaryCl,
                                            overflow: TextOverflow.ellipsis,
                                            fontFamily: semiBold,
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      if (contextCtr.appointmentList[index].status == "Pending" || contextCtr.appointmentList[index].status == "Upcoming")
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: const Color.fromRGBO(255, 238, 225, 1)),
                                          child: Row(
                                            children: [
                                              Text(
                                                contextCtr.appointmentList[index].status.toString(),
                                                style: const TextStyle(
                                                  color: Color.fromRGBO(254, 155, 51, 1),
                                                  fontFamily: medium,
                                                  fontWeight: FontWeight.w400,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 10,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 6,
                                              ),
                                              Image.asset(
                                                happy,
                                                height: 16,
                                                width: 16,
                                              )
                                            ],
                                          ),
                                        ),
                                      if (contextCtr.appointmentList[index].status == "Cancel")
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: const Color.fromRGBO(255, 227, 223, 1)),
                                          child: Row(
                                            children: [
                                              Text(
                                                contextCtr.appointmentList[index].status.toString(),
                                                style: const TextStyle(
                                                  color: Color.fromRGBO(255, 31, 0, 1),
                                                  fontFamily: medium,
                                                  fontWeight: FontWeight.w400,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 10,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 6,
                                              ),
                                              Image.asset(
                                                sadIc,
                                                height: 16,
                                                width: 16,
                                              )
                                            ],
                                          ),
                                        ),
                                      if (contextCtr.appointmentList[index].status == "Complete")
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: const Color.fromRGBO(223, 235, 255, 1)),
                                          child: Row(
                                            children: [
                                              Text(
                                                contextCtr.appointmentList[index].status.toString(),
                                                style: const TextStyle(
                                                  color: Color.fromRGBO(0, 102, 255, 1),
                                                  fontFamily: medium,
                                                  fontWeight: FontWeight.w400,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 10,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 6,
                                              ),
                                              Image.asset(
                                                doneAppIc,
                                                height: 16,
                                                width: 16,
                                              )
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Divider(color: primaryClNew.withOpacity(0.43)),
                                const SizedBox(height: 10),
                                Padding(
                                  padding:  const EdgeInsets.symmetric(horizontal: 12),
                                  child: Text(
                                    contextCtr.appointmentList[index].message.toString(),
                                    maxLines: 1,
                                    style: const TextStyle(
                                      color: secondaryCl,
                                      overflow: TextOverflow.ellipsis,
                                      fontFamily: medium,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const SizedBox(height: 10),
                                Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 10),
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(color: const Color(0xfff2f4fa), borderRadius: BorderRadius.circular(4)),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.calendar_month,
                                        color: primaryClNew,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        contextCtr.appointmentList[index].date.toString(),
                                        maxLines: 1,
                                        style: const TextStyle(
                                          color: secondaryCl,
                                          overflow: TextOverflow.ellipsis,
                                          fontFamily: semiBold,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 12,
                                        ),
                                      ),
                                      const Spacer(),
                                      const Icon(
                                        Icons.watch_later_rounded,
                                        color: primaryClNew,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        contextCtr.appointmentList[index].time.toString(),
                                        maxLines: 1,
                                        style: const TextStyle(
                                          color: secondaryCl,
                                          overflow: TextOverflow.ellipsis,
                                          fontFamily: semiBold,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      contextCtr.appointmentList[index].status == "Pending" || contextCtr.appointmentList[index].status == "Upcoming"
                                          ? Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  controller.cancelAppointment(contextCtr.appointmentList[index].id.toString());
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(8),
                                                    border: Border.all(color: primaryClNew, width: 1),
                                                    color: Colors.white,
                                                  ),
                                                  width: 154,
                                                  height: 37,
                                                  child: const Center(
                                                    child: Text(
                                                      'Cancel',
                                                      style: TextStyle(
                                                        color: primaryClNew,
                                                        fontStyle: FontStyle.normal,
                                                        fontWeight: FontWeight.w400,
                                                        fontFamily: medium,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          : const SizedBox(),
                                      contextCtr.appointmentList[index].status == "Pending" || contextCtr.appointmentList[index].status == "Upcoming" ? const SizedBox(width: 16) : const SizedBox(),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.to(() => MyAppointment(isNew: false, id: contextCtr.appointmentList[index].id.toString()));
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8),
                                                gradient: const LinearGradient(colors: [
                                                  Color(0xFF189DFF),
                                                  Color(0xFF0070C1),
                                                ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
                                            width: 154,
                                            height: 37,
                                            child: const Center(
                                              child: Text(
                                                'Reschedule',
                                                style: TextStyle(
                                                  color: whiteColor,
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: medium,
                                                  fontSize: 14,
                                                ),
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
                        );
                      },
                    ),
                  );
                }),
              ],
            ),
          ));
        });
  }
}
