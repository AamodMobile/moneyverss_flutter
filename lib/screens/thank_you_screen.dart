import 'package:get/get.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/screens/dashboard_screen.dart';

class ThankYouScreen extends StatefulWidget {
  final String referenceId;
  final String msg;
  const ThankYouScreen({super.key, required this.referenceId, required this.msg});

  @override
  State<ThankYouScreen> createState() => _ThankYouScreenState();
}

class _ThankYouScreenState extends State<ThankYouScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool willLeave = false;
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const DashBoardScreen(currentScreen: 0)));
        return willLeave;
      },
      child: SafeArea(
          child: Scaffold(
            backgroundColor: whiteColor,
            appBar: PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width, 65),
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
                          Get.off(()=>const DashBoardScreen(currentScreen: 0));
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
                    Image.asset(
                      imgCommonLogo,
                      height: 25,
                      fit: BoxFit.contain,
                    )
                  ],
                ),
              ),
            ),
        body: Column(
          children: [
            const SizedBox(height: 10),
            const Text(
              "Application Submit",
              style: TextStyle(
                  fontSize: 14,
                  color: primaryClNew,
                  fontFamily: medium,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal),
            ),
            SizedBox(
              height: 10,
              width: MediaQuery.of(context).size.width,
            ),
            Image.asset(thankuScreenTopImg),
            const SizedBox(height: 10),
            const Text(
              "Thank You  !",
              style: TextStyle(
                  fontSize: 30,
                  color: greenSec,
                  fontFamily: bold,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal),
            ),
            const SizedBox(height: 30),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 34),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFEEFFF6),
                border: Border.all(color: greenSec),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Text(
                "Your Reference ID :- ${widget.referenceId}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 14,
                    color: textHeading,
                    fontFamily: bold,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal),
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                widget.msg,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 14,
                    color: textHeading,
                    fontFamily: semiBold,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal),),
            ),
            const SizedBox(height:24),
             Container(
               margin: const EdgeInsets.symmetric(horizontal: 13),
              padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 11),
              decoration: BoxDecoration(
                color: const Color(0xFFF2F4FA),
                borderRadius: BorderRadius.circular(10)
              ),
              child: const Text(
                "Our Expert will get in touch within 24 hours to take your application forward .",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontFamily: medium,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
