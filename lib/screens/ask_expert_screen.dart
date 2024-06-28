import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/screens/chat_screen.dart';
import 'package:wireframe/widget/text_filled_widget.dart';

class AskExpertScreen extends StatefulWidget {
  const AskExpertScreen({super.key});

  @override
  State<AskExpertScreen> createState() => _AskExpertScreenState();
}

class _AskExpertScreenState extends State<AskExpertScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: homeBgCl,
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 65),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            decoration: const BoxDecoration(
              color: homeBgCl,
            ),
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
                const SizedBox(width: 20),
                const Text(
                 "Ask Expert",
                  style: TextStyle(
                      color: draKText,
                      fontFamily: semiBold,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 16),
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.70,
                      child: MyTextFormField(
                        hint: 'Search Expert',
                        obscureText: false,
                        readOnly: false,
                        border: borderNewCl,
                        fillColor: whiteColor,
                        prefixIcon: InkWell(
                          onTap: () {},
                          child: Material(
                            color: Colors.transparent,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Image.asset(
                                searchIc,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.only(left: 5),
                      height: 38,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: primaryClNew,
                      ),
                      child: Center(
                        child: Image.asset(
                          filterNewIc,
                          height: 20,
                          width: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 6),
            Expanded(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: const EdgeInsets.all(9),
                    height: 141,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: borderNewCl),
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 17, vertical: 6),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 72,
                              width: 72,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromRGBO(226, 234, 255, 1),
                              ),
                              child: Center(
                                child: Container(
                                  height: 62,
                                  width: 62,
                                  decoration: const BoxDecoration(shape: BoxShape.circle, color: whiteColor),
                                  child: Image.asset(
                                    demoExImg,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Yusuf Ali",
                                    style: TextStyle(
                                      color: secondaryCl,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: semiBold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        bagIc,
                                        height: 10,
                                        width: 12,
                                      ),
                                      const SizedBox(width: 9),
                                      const Text(
                                        "Branch Manager",
                                        style: TextStyle(
                                          color: textGeryCl,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: medium,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Image.asset(
                                        donePad,
                                        height: 10,
                                        width: 12,
                                      ),
                                      const SizedBox(width: 9),
                                      const Text(
                                        "3 Years Exp.",
                                        style: TextStyle(
                                          color: textGeryCl,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: medium,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 19,
                              width: 48,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: const Color.fromRGBO(245, 245, 245, 1),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    starSecIc,
                                    height: 12,
                                    width: 12,
                                    color: const Color.fromRGBO(255, 122, 0, 1),
                                  ),
                                  const SizedBox(width: 2),
                                  const Text(
                                    "4.5",
                                    style: TextStyle(
                                      color: secondaryCl,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: regular,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ChatScreen()));
                                },
                                child: Container(
                                  height: 36,
                                  decoration: BoxDecoration(color: draKText, borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        messageIc,
                                        height: 16,
                                        width: 16,
                                        color: whiteColor,
                                      ),
                                      const SizedBox(width: 10),
                                      const Text(
                                        "Chat With Us",
                                        style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          color: whiteColor,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: regular,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ChatScreen()));
                                },
                                child: Container(
                                  height: 36,
                                  decoration: BoxDecoration(color: const Color.fromRGBO(0, 167, 17, 1), borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        callIc,
                                        height: 18,
                                        width: 18,
                                        color: whiteColor,
                                      ),
                                      const SizedBox(width: 10),
                                      const Text(
                                        "Call With Us",
                                        style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          color: whiteColor,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: regular,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
