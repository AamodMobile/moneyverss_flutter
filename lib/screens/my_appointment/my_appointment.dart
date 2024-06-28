import 'dart:async';

//import 'package:audioplayers/audioplayers.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
//import 'package:flutter_sound/flutter_sound.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/controllers/appointment_controller.dart';
import 'package:wireframe/models/reason_list_model.dart';
import 'package:wireframe/models/time_slot_model.dart';
import 'package:wireframe/widget/text_filled_widget.dart';

class MyAppointment extends StatefulWidget {
  final bool isNew;
  final String id;

  const MyAppointment({super.key, required this.isNew, required this.id});

  @override
  State<MyAppointment> createState() => _MyAppointmentState();
}

class _MyAppointmentState extends State<MyAppointment> {
  AppointmentController controller = Get.put(AppointmentController());
  TextEditingController date = TextEditingController();
  TextEditingController message = TextEditingController();
  DateTime selectedDate = DateTime.now();

  ///bool speechEnable = false;
  ///SpeechToText speech = SpeechToText();
  ///ouble confidenceLevel = 0;
  ///File? voiceFilePath;
  /// String wordsSpoken = "";
/*  late AudioPlayer audioPlayer;
  String pathToAudio = "";
  bool _playAudio = false;
  bool isRecord = false;
  bool isShow = false;
  FlutterSoundRecorder _recordingSession = FlutterSoundRecorder();*/

  @override
  void initState() {
    super.initState();
    //initializer();
    // initSpeech();
    controller.timeSlotModel = null;
    // audioPlayer = AudioPlayer();
    controller.reasonListGet();
  }

/*  void initializer() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/recorded_audio.wav');
    _recordingSession = FlutterSoundRecorder();
    await _recordingSession.openAudioSession(focus: AudioFocus.requestFocusAndStopOthers, category: SessionCategory.playAndRecord, mode: SessionMode.modeDefault, device: AudioDevice.speaker);
    await _recordingSession.setSubscriptionDuration(const Duration(milliseconds: 10));
    await Permission.microphone.request();
    await Permission.storage.request();
    await Permission.manageExternalStorage.request();
  }*/

  /* Future<void> initSpeech() async {
    speechEnable = await speech.initialize();
    setState(() {});
  }

  void startListening() async {
    await speech.listen(
      onResult: (val) {
        wordsSpoken = val.recognizedWords;
        _saveVoiceToFile(val.recognizedWords.codeUnits);
      },
      partialResults: true,
    );
  }

  void stopListening() async {
    speech.stop();
    setState(() {});
  }*/

/*  Future<void> _saveVoiceToFile(List<int> data) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/recorded_audio.wav');
    await file.writeAsBytes(data);
    setState(() {
      // voiceFilePath = file;
    });
  }*/

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(3000),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        DateFormat formatter = DateFormat('E dd-MM-yyyy');
        date.text = formatter.format(picked);
        controller.timeSlotsGet(date.text);
      });
    }
  }

  /* Future<void> playFunc() async {
    try {
      audioPlayer.play(DeviceFileSource(pathToAudio));
    } catch (e) {
      Log.console(e);
    }
  }

  Future<void> stopPlayFunc() async {
    audioPlayer.stop();
  }

  Future<void> startRecording() async {
    final directory = await getApplicationDocumentsDirectory();
    final pathToDirectory = directory.path;
    Directory(directory.path).createSync(recursive: true); // Create directory if it doesn't exist
    final filePath = '$pathToDirectory/recorded_audio.wav';
    pathToAudio = filePath;
    _recordingSession.openAudioSession();
    await _recordingSession.startRecorder(
      toFile: filePath, // Use the correct file path here
      codec: Codec.pcm16WAV,
    );
    StreamSubscription recorderSubscription = _recordingSession.onProgress!.listen((e) {});
    recorderSubscription.cancel();
  }

  Future<String?> stopRecording() async {
    isShow = true;
    _recordingSession.closeAudioSession();
    return await _recordingSession.stopRecorder();
  }
*/
  @override
  Widget build(BuildContext context) {
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
                const SizedBox(
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 20,
                ),
                Image.asset(
                  expertIMg,
                  height: 120,
                  width: 142,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Need Our Expert Advice?",
                    style: TextStyle(
                      color: draKText,
                      fontFamily: semiBold,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Simply book an appointment with our consultants to get personalized guidance tailored to your financial needs. Tap below to schedule your consultation and take control of your financial future.",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(166, 166, 166, 0.7),
                    fontFamily: regular,
                    fontSize: 12,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                const SizedBox(height: 14),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Select Available Date",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: medium,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                MyTextFormField(
                  hint: 'DD/MM/YYYY',
                  onTab: () {
                    _selectDate(context);
                  },
                  obscureText: false,
                  readOnly: true,
                  controller: date,
                  border: const Color.fromRGBO(85, 153, 255, 0.43),
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Enter date";
                    }
                    return null;
                  },
                  onChanged: (v) {},
                  fillColor: whiteColor,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Material(
                      child: Image.asset(
                        calendarAlt,
                        height: 18,
                        width: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Select Available Time",
                    style: TextStyle(
                      color: textColorSec,
                      fontFamily: medium,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Obx(
                  () => DropdownButtonHideUnderline(
                    child: DropdownButton2<TimeSlotModel?>(
                      buttonStyleData: ButtonStyleData(
                        height: 45,
                        width: double.infinity,
                        padding: const EdgeInsets.only(left: 14, right: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: const Color.fromRGBO(85, 153, 255, 0.43),
                          ),
                          color: Colors.white,
                        ),
                      ),
                      iconStyleData: const IconStyleData(
                        icon: ImageIcon(
                          AssetImage(arrowDropDown),
                          size: 12,
                        ),
                        iconSize: 14,
                        iconEnabledColor: Colors.black,
                        iconDisabledColor: Colors.grey,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        maxHeight: 200,
                        width: MediaQuery.of(context).size.width * 0.90,
                        useSafeArea: true,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white,
                        ),
                        scrollbarTheme: ScrollbarThemeData(
                          radius: const Radius.circular(40),
                          thickness: MaterialStateProperty.all(6),
                          thumbVisibility: MaterialStateProperty.all(true),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 45,
                        padding: EdgeInsets.only(left: 14, right: 14),
                      ),
                      isDense: true,
                      value: controller.timeSlotModel,
                      hint: const Text(
                        "Select Time",
                        style: TextStyle(fontWeight: FontWeight.w400, color: Color.fromRGBO(166, 166, 166, 0.7), fontFamily: medium, fontSize: 12, fontStyle: FontStyle.normal),
                      ),
                      style: const TextStyle(color: Colors.white60, fontSize: 13, fontWeight: FontWeight.bold),
                      isExpanded: true,
                      items: controller.timeSlots
                          .map((s) => DropdownMenuItem<TimeSlotModel>(
                                value: s,
                                child: Text(
                                  " ${s.startTime} ${s.endTime}",
                                  style: const TextStyle(
                                    fontFamily: regular,
                                    color: draKText,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ))
                          .toList(),
                      onChanged: (TimeSlotModel? value) {
                        if (value != null) {
                          setState(() {
                            controller.timeSlotModel = value;
                          });
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Select Reason",
                    style: TextStyle(
                      color: textColorSec,
                      fontFamily: medium,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Obx(
                  () => DropdownButtonHideUnderline(
                    child: DropdownButton2<ReasonListModel?>(
                      buttonStyleData: ButtonStyleData(
                        height: 45,
                        width: double.infinity,
                        padding: const EdgeInsets.only(left: 14, right: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: const Color.fromRGBO(85, 153, 255, 0.43),
                          ),
                          color: Colors.white,
                        ),
                      ),
                      iconStyleData: const IconStyleData(
                        icon: ImageIcon(
                          AssetImage(arrowDropDown),
                          size: 12,
                        ),
                        iconSize: 14,
                        iconEnabledColor: Colors.black,
                        iconDisabledColor: Colors.grey,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        maxHeight: 200,
                        width: MediaQuery.of(context).size.width * 0.90,
                        useSafeArea: true,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white,
                        ),
                        scrollbarTheme: ScrollbarThemeData(
                          radius: const Radius.circular(40),
                          thickness: MaterialStateProperty.all(6),
                          thumbVisibility: MaterialStateProperty.all(true),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 45,
                        padding: EdgeInsets.only(left: 14, right: 14),
                      ),
                      isDense: true,
                      value: controller.reasonListModel,
                      hint: const Text(
                        "Select Reason",
                        style: TextStyle(fontWeight: FontWeight.w400, color: Color.fromRGBO(166, 166, 166, 0.7), fontFamily: medium, fontSize: 12, fontStyle: FontStyle.normal),
                      ),
                      style: const TextStyle(color: Colors.white60, fontSize: 13, fontWeight: FontWeight.bold),
                      isExpanded: true,
                      items: controller.reasonList
                          .map((s) => DropdownMenuItem<ReasonListModel>(
                                value: s,
                                child: Text(
                                  " ${s.reason} ",
                                  style: const TextStyle(
                                    fontFamily: regular,
                                    color: draKText,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ))
                          .toList(),
                      onChanged: (ReasonListModel? value) {
                        if (value != null) {
                          setState(() {
                            controller.reasonListModel = value;
                          });
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Remark",
                    style: TextStyle(
                      color: textColorSec,
                      fontFamily: medium,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                MyTextFormField(
                  hint: 'Enter Message',
                  obscureText: false,
                  readOnly: false,
                  border: borderNewCl,
                  controller: message,
                  maxLines: 4,
                  fillColor: Colors.white,
                ),
                const SizedBox(height: 16),
                /* isShow
                    ? Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        height: 49,
                        decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.circular(4), border: Border.all(color: appBarClNew1, width: 1)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isShow = false;
                                    !_playAudio;
                                    stopPlayFunc();
                                    pathToAudio = ""; // Clear pathToAudio when hiding the recording UI
                                  });
                                },
                                child: Image.asset(
                                  deleteIcNew,
                                  height: 24,
                                  width: 24,
                                )),
                            const SizedBox(
                              width: 26,
                            ),
                            _playAudio
                                ? const Expanded(child: WaveAnimation())
                                : Image.asset(
                                    wave,
                                    height: 24,
                                    fit: BoxFit.fill,
                                  ), // Show wave animation here
                            const SizedBox(
                              width: 26,
                            ),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _playAudio = !_playAudio;
                                  });
                                  if (_playAudio) playFunc();
                                  if (!_playAudio) stopPlayFunc();
                                  setState(() {});
                                },
                                child: _playAudio
                                    ? const Icon(
                                        Icons.stop,
                                        size: 24,
                                        color: redCl,
                                      )
                                    : Image.asset(
                                        play,
                                        height: 24,
                                        width: 24,
                                      )),
                          ],
                        ),
                      )
                    : MyTextFormField(
                        hint: 'Add Your Voice Message',
                        validator: (v) {
                          if (v!.isEmpty) {
                            return "Add Your Voice Message";
                          }
                          return null;
                        },
                        obscureText: false,
                        readOnly: true,
                        keyboardType: TextInputType.name,
                        border: borderNewCl,
                        fillColor: whiteColor,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isRecord = !isRecord;
                            });
                            if (isRecord) startRecording();
                            if (!isRecord) stopRecording();
                            setState(() {});
                          },
                          child: Padding(
                            padding: EdgeInsets.all(isRecord ? 2 : 14),
                            child: Material(
                              child: isRecord
                                  ? Image.asset(
                                      recordGif,
                                      height: 18,
                                      width: 18,
                                    )
                                  : Image.asset(
                                      voiceIc,
                                      height: 18,
                                      width: 18,
                                    ),
                            ),
                          ),
                        ),
                      ),*/
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () async {
                    if (widget.isNew) {
                      controller.createAppointmentApi(
                        date.text,
                        controller.timeSlotModel.id.toString(),
                        message.text,
                        "",
                        controller.reasonListModel.id.toString(),
                      );
                    } else {
                      controller.rescheduleAppointment(
                        widget.id,
                        date.text,
                        controller.timeSlotModel.id.toString(),
                        message.text,
                        "",
                        controller.reasonListModel.id.toString(),
                      );
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF189DFF),
                          Color(0xFF0070C1),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    width: 200,
                    height: 46,
                    child: const Center(
                      child: Text(
                        "Submit",
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
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WaveAnimation extends StatefulWidget {
  const WaveAnimation({super.key});

  @override
  State<WaveAnimation> createState() => _WaveAnimationState();
}

class _WaveAnimationState extends State<WaveAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: 1.0 + _controller.value * 0.1,
          child: Image.asset(
            wave,
            height: 24,
            fit: BoxFit.fill,
          ),
        );
      },
    );
  }
}
