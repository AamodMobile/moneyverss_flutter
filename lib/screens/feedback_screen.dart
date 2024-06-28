import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/constants/util.dart';
import 'package:wireframe/controllers/add_feedback_controller.dart';
import 'package:wireframe/widget/text_filled_widget.dart';

class FeedBackScreen extends StatefulWidget {
  const FeedBackScreen({super.key});

  @override
  State<FeedBackScreen> createState() => _FeedBackScreenState();
}

class _FeedBackScreenState extends State<FeedBackScreen> {
  AddFeedBackController controller = Get.put(AddFeedBackController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: homeBgCl,
        resizeToAvoidBottomInset: false,
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
                  "Feedback",
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
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          child: Stack(
            children: [
              Image.asset(
                feedbackBg,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
              Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                  ),
                  const Text(
                    "Give Feedback",
                    style: TextStyle(
                      color: draKText,
                      fontFamily: semiBold,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 18),
                  RatingBar.builder(
                    initialRating: 1,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 20,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 3.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Color(0xFF0360A4),
                    ),
                    onRatingUpdate: (rating) {
                      controller.rating.value = rating.toString();
                    },
                  ),
                  const SizedBox(height: 58),
                  const Text(
                    "Do You Have Any Thoughts You'd Like To Share ?",
                    style: TextStyle(
                      color: draKText,
                      fontFamily: semiBold,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 10,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal:    MediaQuery.of(context).size.height * 0.05,),
                    child: MyTextFormField(
                      maxLines: 6,
                      hint: "Enter Here...",
                      controller: controller.message,
                      fillColor: const Color(0xFFF3FAFF),
                      obscureText: false,
                      readOnly: false,
                      border: const Color(0xFF426681),
                    ),
                  ),
                  const SizedBox(height: 65),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (controller.message.text.isEmpty) {
                            errorToast("Please Add Message");
                          } else if (controller.rating.value == "") {
                            errorToast("Please Add Rate");
                          } else {
                            controller.addFeedBackApi();
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              gradient: const LinearGradient(colors: [
                                Color(0xFF357702),
                                Color(0xFF8BC568),
                              ], begin: Alignment.centerRight, end: Alignment.centerLeft)),
                          child: const Center(
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                color: whiteColor,
                                fontFamily: semiBold,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
