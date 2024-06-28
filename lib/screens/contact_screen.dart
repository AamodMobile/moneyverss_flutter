import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/controllers/contact_us_controller.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  ContactUsController controller = Get.put(ContactUsController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: Get.find<ContactUsController>(),
        initState: (state) {
          Get.find<ContactUsController>().contactUs();
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
                        "Contact Us",
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
                  const SizedBox(height: 36),
                  GestureDetector(
                    onTap: () async {
                      await launchUrl(
                        Uri.parse("https://wa.me/91${contextCtr.contact.value.mobile}/?text=Hii...moneyverss App"),
                        mode: LaunchMode.externalApplication,
                      );
                    },
                    child: cont("+91 ${contextCtr.contact.value.mobile??""}", "WhatsApp", whatsAppNew, "Chat Now"),
                  ),
                  const SizedBox(height: 16),
                  /*GestureDetector(
                    onTap: () async {
                      var url = "tel:91${contextCtr.contact.value.contactUs}";
                      if (await launchUrl(Uri.parse(url))) {
                        await launchUrl(Uri.parse(url));
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: cont("+91${contextCtr.contact.value.contactUs??""}", "Toll Free", callNew, "Call Now"),
                  ),
                  const SizedBox(height: 16),*/
                  GestureDetector(
                      onTap: () async {
                        final Uri params = Uri(
                          scheme: 'mailto',
                          path: contextCtr.contact.value.email??"",
                          query: 'subject=Support & body=Hi,moneyverss App',
                        );
                        await launchUrl(
                          (params),
                          mode: LaunchMode.externalApplication,
                        );
                      },
                      child: cont(contextCtr.contact.value.email??"", "Email Address", emailNew, "Send Email")),
                ],
              ),
            ),
          );
        });
  }

  Widget cont(String contactDetails, String typeContact, String icon, String type) {
    return Container(
      height: 101,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 17),
      decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.circular(10), border: Border.all(color: borderNewCl)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    icon,
                    height: 26,
                    width: 26,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    typeContact,
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: regular,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    contactDetails,
                    style: const TextStyle(
                      color: Color(0xFF8693B7),
                      fontFamily: regular,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 28,
            width: 86,
            decoration: const BoxDecoration(color: bgCont, borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomLeft: Radius.circular(10))),
            child: Center(
              child: Text(
                type,
                style: const TextStyle(
                  color: Color(0xFF8693B7),
                  fontFamily: medium,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  fontSize: 12,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
