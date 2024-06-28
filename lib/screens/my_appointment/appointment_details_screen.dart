//import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/controllers/appointment_controller.dart';
import 'package:wireframe/screens/my_appointment/my_appointment.dart';

class AppointmentDetailsScreen extends StatefulWidget {
  final String id;

  const AppointmentDetailsScreen({super.key, required this.id});

  @override
  State<AppointmentDetailsScreen> createState() => _AppointmentDetailsScreenState();
}

class _AppointmentDetailsScreenState extends State<AppointmentDetailsScreen> {
  AppointmentController controller = Get.put(AppointmentController());
  bool _playAudio = false;

  // late AudioPlayer audioPlayer;
  Duration _audioDuration = Duration.zero;

  @override
  void initState() {
    super.initState();
    // audioPlayer = AudioPlayer();
    /* audioPlayer.onDurationChanged.listen((Duration d) {
      setState(() {
        _audioDuration = d;
      });
    });*/
  }

/*  Future<void> playFunc(String url) async {
    try {
      await audioPlayer.play(UrlSource(url));
    } catch (e) {
      Log.console(e);
    }
  }*/
/*

  Future<void> stopPlayFunc() async {
    await audioPlayer.stop();
  }
*/

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<AppointmentController>(),
      initState: (state) {
        Get.find<AppointmentController>().appointmentsDetailsGet(widget.id);
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
                decoration: const BoxDecoration(color: whiteColor),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8),
                        child: Image.asset(icBack, height: 24, width: 24),
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      "Appointment Details",
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
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Builder(builder: (context) {
                if (contextCtr.isLoading) {
                  return const LoaderClass();
                }
                if (contextCtr.noData) {
                  return Column(
                    children: [
                      SizedBox(height: 60, width: MediaQuery.of(context).size.width),
                      SizedBox(height: 60, width: MediaQuery.of(context).size.width),
                      Image.asset(appointTopImg, height: 178, width: 220),
                      const SizedBox(height: 30),
                      const Text(
                        "No Appointment Details found",
                        style: TextStyle(
                          color: draKText,
                          fontFamily: semiBold,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  );
                }
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.white,
                          border: Border.all(color: primaryClNew.withOpacity(0.43)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: "Appointment ID: ",
                                      style: const TextStyle(
                                        color: greyNew,
                                        overflow: TextOverflow.ellipsis,
                                        fontFamily: semiBold,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 12,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: contextCtr.appointmentDetails.id.toString(),
                                          style: const TextStyle(
                                            color: secondaryCl,
                                            overflow: TextOverflow.ellipsis,
                                            fontFamily: semiBold,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (contextCtr.appointmentDetails.status == "Pending" || contextCtr.appointmentDetails.status == "Upcoming")
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: const Color.fromRGBO(255, 238, 225, 1),
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            contextCtr.appointmentDetails.status.toString(),
                                            style: const TextStyle(
                                              color: Color.fromRGBO(254, 155, 51, 1),
                                              fontFamily: medium,
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 10,
                                            ),
                                          ),
                                          const SizedBox(width: 6),
                                          Image.asset(happy, height: 16, width: 16),
                                        ],
                                      ),
                                    ),
                                  if (contextCtr.appointmentDetails.status == "Cancel")
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: const Color.fromRGBO(255, 227, 223, 1),
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            contextCtr.appointmentDetails.status.toString(),
                                            style: const TextStyle(
                                              color: Color.fromRGBO(255, 31, 0, 1),
                                              fontFamily: medium,
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 10,
                                            ),
                                          ),
                                          const SizedBox(width: 6),
                                          Image.asset(sadIc, height: 16, width: 16),
                                        ],
                                      ),
                                    ),
                                  if (contextCtr.appointmentDetails.status == "Complete")
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: const Color.fromRGBO(223, 235, 255, 1),
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            contextCtr.appointmentDetails.status.toString(),
                                            style: const TextStyle(
                                              color: Color.fromRGBO(0, 102, 255, 1),
                                              fontFamily: medium,
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 10,
                                            ),
                                          ),
                                          const SizedBox(width: 6),
                                          Image.asset(doneAppIc, height: 16, width: 16),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        contextCtr.appointmentDetails.reasonsTitle.toString(),
                        style: const TextStyle(
                          color: secondaryCl,
                          overflow: TextOverflow.ellipsis,
                          fontFamily: semiBold,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        contextCtr.appointmentDetails.message.toString(),
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
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.calendar_month, color: primaryClNew),
                            const SizedBox(width: 5),
                            Text(
                              contextCtr.appointmentDetails.date.toString(),
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
                            const SizedBox(width: 5),
                            Container(
                              height: 16,
                              width: 1.5,
                              color: const Color.fromRGBO(194, 194, 194, 1),
                            ),
                            const SizedBox(width: 5),
                            const Icon(Icons.access_time, color: primaryClNew),
                            const SizedBox(width: 5),
                            Text(
                              contextCtr.appointmentDetails.timeSlot.toString(),
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
                      /*   contextCtr.appointmentDetails.voiceMessage == "" ? const SizedBox() : const SizedBox(height: 12),
                      contextCtr.appointmentDetails.voiceMessage == ""
                          ? const SizedBox()
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Voice Message",
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: secondaryCl,
                                    overflow: TextOverflow.ellipsis,
                                    fontFamily: semiBold,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(color: primaryClNew.withOpacity(0.43)),
                                  ),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _playAudio = !_playAudio;
                                          });
                                          if (_playAudio) {
                                            playFunc(ApiUrl.imageUrl + contextCtr.appointmentDetails.voiceMessage.toString());
                                          } else {
                                            stopPlayFunc();
                                          }
                                        },
                                        child: _playAudio
                                            ? const Icon(
                                                Icons.stop,
                                                size: 20,
                                                color: redCl,
                                              )
                                            : Image.asset(
                                                play,
                                                height: 20,
                                                width: 20,
                                              ),
                                      ),
                                      const SizedBox(width: 10),
                                      _playAudio
                                          ? const SizedBox(
                                              width: 65,
                                              height: 24,
                                              child: WaveAnimation(),
                                            )
                                          : Image.asset(
                                              wave,
                                              height: 24,
                                              fit: BoxFit.fill,
                                            ),
                                      const SizedBox(width: 10),
                                      Text(
                                        formatDuration(_audioDuration),
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
                                )
                              ],
                            ),*/
                      const SizedBox(height: 20),
                      contextCtr.appointmentDetails.adminMessage == ""
                          ? const SizedBox()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Note",
                                  maxLines: 1,
                                  style: const TextStyle(
                                    color: secondaryCl,
                                    overflow: TextOverflow.ellipsis,
                                    fontFamily: semiBold,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                                  decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    contextCtr.appointmentDetails.adminMessage.toString(),
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
                              ],
                            ),
                      const SizedBox(height: 20),
                    ],
                  ),
                );
              }),
            ),
            bottomSheet: contextCtr.noData || contextCtr.isLoading
                ? const SizedBox()
                : Container(
                    color: whiteColor,
                    height: 80,
                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        contextCtr.appointmentDetails.status == "Pending" || contextCtr.appointmentDetails.status == "Upcoming"
                            ? Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    controller.cancelAppointment(contextCtr.appointmentDetails.id.toString());
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: primaryClNew, width: 1),
                                      color: Colors.white,
                                    ),
                                    width: 154,
                                    height: 40,
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
                        contextCtr.appointmentDetails.status == "Pending" || contextCtr.appointmentDetails.status == "Upcoming" ? const SizedBox(width: 16) : const SizedBox(),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Get.to(() => MyAppointment(isNew: false, id: contextCtr.appointmentDetails.id.toString()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  gradient: const LinearGradient(colors: [
                                    Color(0xFF189DFF),
                                    Color(0xFF0070C1),
                                  ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
                              width: 154,
                              height: 40,
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
                  ),
          ),
        );
      },
    );
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }
}
