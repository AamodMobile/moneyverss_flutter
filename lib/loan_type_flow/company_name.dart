import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/controllers/loan_apply_controller.dart';
import 'package:wireframe/widget/my_button.dart';
import 'package:wireframe/widget/text_filled_widget.dart';

class YourEmploymentDetails extends StatefulWidget {
  final VoidCallback onNext;
  final String loanTypeId;
  final LoanApplyController controller;
  final VoidCallback onPrevious;
  const YourEmploymentDetails({super.key, required this.onNext, required this.loanTypeId, required this.controller, required this.onPrevious});

  @override
  State<YourEmploymentDetails> createState() => _YourEmploymentDetailsState();
}

class _YourEmploymentDetailsState extends State<YourEmploymentDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeBgCl,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width,60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 14,
            ),
            const Text(
              'Please Provide Your Employment Details',
              style: TextStyle(
                color: blueCl,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600,
                fontFamily: semiBold,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Container(
              height: 4,
              width: 65,
              decoration: BoxDecoration(color: primaryClNew, borderRadius: BorderRadius.circular(4)),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Company Name",
              style: TextStyle(
                color: textColorSec,
                fontFamily: medium,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 4),
            MyTextFormField(
              controller: widget.controller.companyName,
              textInputAction: TextInputAction.go,
              hint: 'Enter Company Name',
              obscureText: false,
              readOnly: false,
              border: borderNewCl,
              validator: (v) {
                if (v!.isEmpty) {
                  return "Enter Company Name";
                }
                return null;
              },
              fillColor: whiteColor,
            ),
            const SizedBox(height: 70),
          ],
        ),
      ),
      bottomSheet: Container(
        color:homeBgCl,
        width: MediaQuery.of(context).size.width,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SizedBox(
                height: 40,
                width: 150,
                child: MyButton(
                  onPressed: () {
                    widget.onPrevious();
                  },
                  color: primaryClNew,
                  child: const Text(
                    'Previous',
                    style: TextStyle(
                      color: whiteColor,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      fontFamily: semiBold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            widget.controller.companyName.text.isEmpty?const SizedBox():const SizedBox(width: 10),
            widget.controller.companyName.text.isEmpty?const SizedBox(): SizedBox(
              height: 40,
              width: 150,
              child: MyButton(
                onPressed: () {
                  if (  widget.controller.companyName.text=="") {
                    final snackBar = SnackBar(
                      backgroundColor: redCl,
                      behavior: SnackBarBehavior.floating,
                      dismissDirection: DismissDirection.up,
                      content: const Text("Please Enter company name"),
                      action: SnackBarAction(
                        label: '',
                        onPressed: () {},
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    widget.onNext();
                  }
                },
                color: primaryClNew,
                child: const Text(
                  'Next',
                  style: TextStyle(
                    color: whiteColor,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    fontFamily: semiBold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
