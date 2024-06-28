import 'package:get/get.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/screens/contact_screen.dart';
import 'package:wireframe/screens/faqs_screen.dart';

class NewSupportScreen extends StatefulWidget {
  const NewSupportScreen({super.key});

  @override
  State<NewSupportScreen> createState() => _NewSupportScreenState();
}

class _NewSupportScreenState extends State<NewSupportScreen> {
  @override
  Widget build(BuildContext context) {
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
                  "Support",
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
            const SizedBox(height: 18),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: Text(
                "To help you with the common questions asked we have tried to put all the answers in our FAQ section. You can even search for FAQs for easy access.",
                style: TextStyle(
                  color: draKText,
                  fontFamily: medium,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(height: 24),
            GestureDetector(
                onTap: () {
                  Get.to(() => const FaqsScreen());
                },
                child: cont(faqIc, "FAQs")),
            const SizedBox(height: 15),
            GestureDetector(
                onTap: () {
                  Get.to(() => const ContactUsScreen());
                },
                child: cont(phoneIc, "Contact Us")),
          ],
        ),
      ),
    );
  }

  Widget cont(String icon, String tittle) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.symmetric(horizontal: 18),
      height: 40,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: whiteColor, borderRadius: BorderRadius.circular(4), boxShadow: const [BoxShadow(offset: Offset(0, 1), blurRadius: 6, spreadRadius: 0, color: Color.fromRGBO(0, 0, 0, 0.15))]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Image.asset(
                icon,
                height: 17,
                width: 17,
              ),
              const SizedBox(width: 15),
              Text(
                tittle,
                style: const TextStyle(
                  color: textHeading,
                  fontFamily: medium,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ],
          ),
          const Icon(
            Icons.arrow_forward_ios,
            size: 12,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
