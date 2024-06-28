import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/controllers/loan_apply_controller.dart';
import 'package:wireframe/widget/my_button.dart';
import 'package:wireframe/widget/text_filled_widget.dart';

class BusinessLoan1 extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final String loanTypeId;
  final LoanApplyController controller;

  const BusinessLoan1({super.key, required this.onNext, required this.loanTypeId, required this.controller, required this.onPrevious});

  @override
  State<BusinessLoan1> createState() => _BusinessLoan1State();
}

class _BusinessLoan1State extends State<BusinessLoan1> {
  /* final List annualTurnoverList = [
    "Upto ₹15 Lac",
    "₹15 - ₹20 Lac",
    "₹21 - ₹25 Lac",
    "₹26 - ₹30 Lac",
    "₹31 - ₹35 Lac",
    "₹36 - ₹40 Lac",
    "₹41 - ₹45 Lac",
    "₹ 45+ Lac",
  ];
int annualTurnover = -1;*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeBgCl,
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 14,
          ),
          const Text(
            'Annual Turnover',
            style: TextStyle(
              color: blueCl,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
              fontFamily: semiBold,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Container(
            height: 4,
            width: 65,
            decoration: BoxDecoration(
              color: primaryClNew,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(height: 20),
          /* GridView.builder(
                shrinkWrap: true,
                itemCount: annualTurnoverList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(mainAxisExtent: 62, childAspectRatio: 1, crossAxisSpacing: 20, mainAxisSpacing: 20, crossAxisCount: 2),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        annualTurnover = index;
                      });
                    },
                    child: Container(
                      height: 62,
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(
                          color: borderNewCl,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            annualTurnoverList[index],
                            style: const TextStyle(
                              color: draKText,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontFamily: medium,
                              fontSize: 16,
                            ),
                          ),
                          Container(
                            height: 18,
                            width: 18,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: annualTurnover == index ? Border.all(color: primaryClNew, width: 5) : Border.all(color: borderNewCl, width: 1),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),*/
          const Text(
            "Annual Turnover",
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
            controller: widget.controller.annualTurnoverText,
            textInputAction: TextInputAction.go,
            hint: 'Enter Annual Turnover',
            obscureText: false,
            readOnly: false,
            border: borderNewCl,
            validator: (v) {
              if (v!.isEmpty) {
                return "Enter Annual Turnover";
              }
              return null;
            },
            fillColor: whiteColor,
          ),
          const SizedBox(height: 70),
        ]),
      ),
      bottomSheet: Container(
        color: homeBgCl,
        width: MediaQuery.of(context).size.width,
        height: 60,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
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
              SizedBox(
                height: 40,
                width: 150,
                child: MyButton(
                  onPressed: () {
                    if (widget.controller.annualTurnoverText.text.isEmpty) {
                      final snackBar = SnackBar(
                        backgroundColor: redCl,
                        behavior: SnackBarBehavior.floating,
                        dismissDirection: DismissDirection.up,
                        content: const Text("Please Enter Annual Turnover"),
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
      ),
    );
  }
}
