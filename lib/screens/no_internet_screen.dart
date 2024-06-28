



import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/widget/my_button.dart';

class NoInterNetScreen extends StatefulWidget {
  const NoInterNetScreen({super.key});

  @override
  State<NoInterNetScreen> createState() => _NoInterNetScreenState();
}

class _NoInterNetScreenState extends State<NoInterNetScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryCl,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
            ),
            Image.asset(
              noInternetImg,
              height: 196,
              width: 196,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "No Internet Connection",
              style: TextStyle(
                  color: Color.fromRGBO(28, 27, 78, 1),
                  fontFamily: semiBold,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  fontSize:20),
            ),
            const SizedBox(
              height: 5,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                "There is no internet connection Please check your internet connection and try again",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: textColorSec,
                    fontFamily: semiBold,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                    fontSize: 14),
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            SizedBox(
              height: 41,
              width: 140,
              child: MyButton(
                color: mainColor,
                onPressed: () async {

                },
                child: const Center(
                  child: Text(
                    "Try again",
                    style: TextStyle(
                      color: whiteColor,
                      fontSize: 14,
                      fontFamily: semiBold,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
