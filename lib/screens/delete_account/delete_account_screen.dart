import 'package:wireframe/constants/constants.dart';

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  List reasonDelete = [
    "I Don’t Want To Use Moneyverss Anymore",
    "I ‘m Using A Different Account",
    "i ‘m Worried About My Privacy",
    "You Are Sending Me Too Many Emails/Notification",
    "The App Is Not Working Properly",
    "Other",
  ];

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
                const SizedBox(width: 5),
                const Text(
                  "Delete account",
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
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
              ),
              const Text(
                "Delete My Account",
                style: TextStyle(
                  color: draKText,
                  fontFamily: semiBold,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Why Would You Like To Delete Your Account?",
                style: TextStyle(
                  color: Color(0xFF454545),
                  fontFamily: regular,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 10,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(child: ListView.builder(itemBuilder: (BuildContext context, int index) {
                return SizedBox();
              }))
            ],
          ),
        ),
      ),
    );
  }
}
