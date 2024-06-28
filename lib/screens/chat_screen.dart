import 'dart:io';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/widget/my_button.dart';
import 'package:wireframe/widget/text_filled_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController msg = TextEditingController();
  TextEditingController feedBack = TextEditingController();
  File image = File("");
  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello!", messageType: "sender"),
    ChatMessage(messageContent: "Thank you very mouch for your traveling, we really like the apartments. we will stay here for anather 5 days...", messageType: "sender"),
    ChatMessage(messageContent: "Hello!", messageType: "receiver"),
    ChatMessage(messageContent: "I’m very glab you like it👍", messageType: "receiver"),
    ChatMessage(messageContent: "We are arriving today at 01:45, will someone be at home?", messageType: "receiver"),
    ChatMessage(messageContent: "I will be at home", messageType: "sender"),
  ];
  int selected = -1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: screenBgCl,
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 65),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
            alignment: Alignment.center,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 22,
                      width: 22,
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(color: primaryClNew, borderRadius: BorderRadius.circular(4)),
                      child: const Center(
                        child: Icon(
                          Icons.arrow_back,
                          color: whiteColor,
                          size: 14,
                        ),
                      ),
                    )),
                const SizedBox(width: 8),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: primaryClNew),
                  ),
                  child: Image.asset(
                    userIc,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Name",
                      style: TextStyle(
                        color: draKText,
                        fontFamily: medium,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 8,
                          width: 8,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: success,
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        const Text(
                          "Online",
                          style: TextStyle(
                            color: success,
                            fontFamily: semiBold,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                itemCount: messages.length,
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                        child: Align(
                          alignment: (messages[index].messageType == "receiver" ? Alignment.topLeft : Alignment.topRight),
                          child: messages[index].messageType == "receiver"
                              ? Container(
                                  margin: const EdgeInsets.only(right: 100),
                                  padding: const EdgeInsets.all(12),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        messages[index].messageContent,
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                          color: secondaryCl,
                                          fontFamily: medium,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          const Text(
                                            "9:30",
                                            style: TextStyle(
                                              color: Color(0xFF7D848D),
                                              fontFamily: regular,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Image.asset(
                                            doneGryIc,
                                            width: 12,
                                            height: 6,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(left: 110),
                                      decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.circular(5)),
                                      padding: const EdgeInsets.all(12),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            messages[index].messageContent,
                                            style: const TextStyle(
                                              color: textHeading,
                                              fontFamily: medium,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              const Text(
                                                "9:30",
                                                style: TextStyle(
                                                  color: Color(0xFF7D848D),
                                                  fontFamily: regular,
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 10,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 4,
                                              ),
                                              Image.asset(
                                                doneGreenIc,
                                                width: 12,
                                                height: 6,
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(
                height: 80,
              )
            ],
          ),
        ),
        bottomSheet: Container(
          color: screenBgCl,
          height: 80,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 48,
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  width: MediaQuery.of(context).size.width * 0.70,
                  child: MyTextFormField(
                    controller: msg,
                    hint: 'Type you message',
                    obscureText: false,
                    readOnly: false,
                    border: primaryCl,
                    fillColor: whiteColor,
                    suffixIcon: InkWell(
                      onTap: () {
                        bottomSheet();
                        // pickImage(context);
                      },
                      child: Material(
                        color: Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Image.asset(
                            paperPinIc,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  if (msg.text == "") {
                    final snackBar = SnackBar(
                      duration: const Duration(seconds: 1),
                      backgroundColor: redCl,
                      behavior: SnackBarBehavior.floating,
                      dismissDirection: DismissDirection.up,
                      content: const Text("Please enter msg"),
                      action: SnackBarAction(
                        label: '',
                        onPressed: () {},
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    setState(() {
                      messages.add(ChatMessage(messageContent: msg.text, messageType: "receiver"));
                      msg.text = "";
                    });
                  }
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 12),
                  height: 48,
                  width: 48,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: primaryClNew,
                  ),
                  child: Center(
                    child: Image.asset(
                      sendIc,
                      height: 20,
                      width: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<ImageSource?> imagePickerSheet(context) async {
    ImageSource? source = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(bottom: 16, top: 16),
            color: Colors.white,
            height: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context, ImageSource.camera);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Icon(
                          Icons.camera_rounded,
                          color: mainColor,
                          size: 40,
                        ),
                        Text(
                          'Camera',
                          style: TextStyle(color: mainColor),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context, ImageSource.gallery);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Icon(
                          Icons.photo_rounded,
                          color: mainColor,
                          size: 40,
                        ),
                        Text('Gallery', style: TextStyle(color: mainColor)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
    return source;
  }

  void pickImage(BuildContext context) async {
    var source = await imagePickerSheet(context);
    if (source != null) {
      // ignore: invalid_use_of_visible_for_testing_member
      var picker = ImagePicker.platform;
      // ignore: deprecated_member_use
      var file = await picker.pickImage(
        source: source,
        maxHeight: 1080,
        maxWidth: 1080,
        imageQuality: 90,
      );
      image = File(file!.path);
    }
  }

  bottomSheet() {
    return showModalBottomSheet(
        isScrollControlled: true,
        useRootNavigator: true,
        backgroundColor: whiteColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(12), topLeft: Radius.circular(12)),
        ),
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (BuildContext context, setState) {
            return Wrap(children: [
              Column(
                children: [
                  const SizedBox(height: 14),
                  const Text(
                    "Feedback",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, fontStyle: FontStyle.normal, fontFamily: semiBold, color: secondaryCl),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Please share your feedback",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, fontFamily: medium, color: textGeryCl),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: RatingBar.builder(
                      initialRating: 0,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 30.0,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: secondaryCl,
                      ),
                      onRatingUpdate: (rating) {
                        //_controller.rating.value = rating.toString();
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        "Suggestion",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, fontFamily: medium, color: secondaryCl),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Container(
                    height: 30,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selected = 1;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              height: 36,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: selected == 1 ? secondaryCl : whiteColor,
                                boxShadow: [BoxShadow(offset: const Offset(0, 1), blurRadius: 4, spreadRadius: 0, color: Color(0xFF000000).withOpacity(0.15))],
                              ),
                              child: Center(
                                child: Text(
                                  "Very Bad",
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: selected == 1 ? whiteColor : primaryCl,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: medium),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selected = 2;
                              });
                            },
                            child: Container(
                              height: 36,
                              width: 80,
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: selected == 2 ? secondaryCl : whiteColor,
                                boxShadow: [BoxShadow(offset: const Offset(0, 1), blurRadius: 4, spreadRadius: 0, color: Color(0xFF000000).withOpacity(0.15))],
                              ),
                              child: Center(
                                child: Text(
                                  "Poor",
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: selected == 2 ? whiteColor : primaryCl,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: medium),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selected = 3;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              height: 36,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: selected == 3 ? secondaryCl : whiteColor,
                                boxShadow: [BoxShadow(offset: const Offset(0, 1), blurRadius: 4, spreadRadius: 0, color: Color(0xFF000000).withOpacity(0.15))],
                              ),
                              child: Center(
                                child: Text(
                                  "Fair",
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: selected == 3 ? whiteColor : primaryCl,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: medium),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 30,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selected = 4;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              height: 36,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: selected == 4 ? secondaryCl : whiteColor,
                                boxShadow: [BoxShadow(offset: const Offset(0, 1), blurRadius: 4, spreadRadius: 0, color: Color(0xFF000000).withOpacity(0.15))],
                              ),
                              child: Center(
                                child: Text(
                                  "Good",
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: selected == 4 ? whiteColor : primaryCl,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: medium),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selected = 5;
                              });
                            },
                            child: Container(
                              height: 36,
                              width: 80,
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: selected == 5 ? secondaryCl : whiteColor,
                                boxShadow: [BoxShadow(offset: const Offset(0, 1), blurRadius: 4, spreadRadius: 0, color: Color(0xFF000000).withOpacity(0.15))],
                              ),
                              child: Center(
                                child: Text(
                                  "Very Good",
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: selected == 5 ? whiteColor : primaryCl,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: medium),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selected = 6;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              height: 36,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: selected == 6 ? secondaryCl : whiteColor,
                                boxShadow: [BoxShadow(offset: const Offset(0, 1), blurRadius: 4, spreadRadius: 0, color: Color(0xFF000000).withOpacity(0.15))],
                              ),
                              child: Center(
                                child: Text(
                                  "Excellent",
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: selected == 6 ? whiteColor : primaryCl,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: medium),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        "Feedback",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, fontFamily: medium, color: secondaryCl),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Container(
                      color: Colors.white,
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      width: MediaQuery.of(context).size.width,
                      child: MyTextFormField(
                        fillColor: whiteColor,
                        controller: feedBack,
                        maxLines: 6,
                        hint: 'Enter message here',
                        obscureText: false,
                        readOnly: false,
                        border: primaryCl,
                      )),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 54,
                    width: 230,
                    child: MyButton(
                        onPressed: () {},
                        color: secondaryCl,
                        child: const Text(
                          "Submit",
                          style: TextStyle(color: whiteColor, fontFamily: semiBold, fontSize: 18),
                        )),
                  ),
                  const SizedBox(height: 20)
                ],
              )
            ]);
          });
        });
  }
}

class ChatMessage {
  String messageContent;
  String messageType;

  ChatMessage({
    required this.messageContent,
    required this.messageType,
  });
}
