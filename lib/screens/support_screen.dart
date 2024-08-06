import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wireframe/constants/constants.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: whiteColor,
          appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 65),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xFF3E4D77),
                    width: 1,
                  ),
                ),
                gradient: LinearGradient(
                  colors: [Color(0xFF112049), Color(0xFF3E4D77)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              alignment: Alignment.center,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: whiteColor,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                   "Support",
                    style: TextStyle(
                        color: whiteColor,
                        fontFamily: medium,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
                width: MediaQuery.of(context).size.width,
              ),
              Image.asset(
                helpAndSuppTopImg,
                height: 220,
                width: 220,
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Help & Support",
                style: TextStyle(
                    color: mainColor,
                    fontFamily: semiBold,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Html(
                  data: demoString,
                  style: {
                    "body": Style(
                      color: mainColor,
                      fontFamily: medium,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: FontSize(14 - 2),
                      maxLines: 3,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          await launchUrl(
                            Uri.parse(
                                "https://wa.me/911234567890/?text=Hii... Welcome to  Fittyus App"),
                            mode: LaunchMode.externalApplication,
                          );
                        },
                        child: Container(
                          width: 154,
                          height: 178,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.2),
                                offset: Offset(0, 1),
                                blurRadius: 5,
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                whatsHelpIc,
                                height: 54,
                                width: 54,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "On Chat",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xFF6D6D6D),
                                    fontFamily: medium,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 12),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Whatsapp",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xFF009806),
                                    fontFamily: semiBold,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          final Uri params = Uri(
                            scheme: 'mailto',
                            path: "gauravswami4@gmail.com",
                            query: 'subject=Support & body=Hi,Fittyus App',
                          );
                          await launchUrl(
                            (params),
                            mode: LaunchMode.externalApplication,
                          );
                        },
                        child: Container(
                          width: 154,
                          height: 178,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.2),
                                offset: Offset(0, 1),
                                blurRadius: 5,
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                emailHelpIc,
                                height: 54,
                                width: 54,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "On Chat",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xFF6D6D6D),
                                    fontFamily: medium,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 12),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Email",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xFFFF5151),
                                    fontFamily: semiBold,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
    ),
    );
  }
}
