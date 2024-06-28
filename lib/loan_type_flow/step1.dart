import 'package:get/get.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/controllers/loan_apply_controller.dart';
import 'package:wireframe/recy_items/loan_apply_flow/item_employment.dart';

class Step1 extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final LoanApplyController controller;
  final String loanTypeId;
  final bool isPersonal;
  final bool isBusiness;

  const Step1({Key? key, required this.onNext, required this.onPrevious, required this.controller, required this.loanTypeId, required this.isPersonal, required this.isBusiness}) : super(key: key);

  @override
  State<Step1> createState() => _Step1State();
}

class _Step1State extends State<Step1> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: Get.find<LoanApplyController>(),
        initState: (state) => {Get.find<LoanApplyController>().getEmploymentList(widget.loanTypeId)},
        builder: (contextCtrl) {
          if (widget.controller.loading) {
            return const LoaderClass();
          }
          return Scaffold(
            backgroundColor: screenBgCl,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 14),
                const Text(
                  emplymentTypeTitle,
                  style: TextStyle(color: blueCl, fontStyle: FontStyle.normal, fontWeight: FontWeight.w600, fontFamily: semiBold, fontSize: 16),
                ),
                const SizedBox(height: 6),
                Container(
                  height: 4,
                  width: 65,
                  decoration: BoxDecoration(color: primaryClNew, borderRadius: BorderRadius.circular(4)),
                ),
                Expanded(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: widget.controller.employmentList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ItemEmployment(
                          employmentData: contextCtrl.employmentList[index],
                          controller: widget.controller,
                          isBusiness: widget.isBusiness,
                          isPersonal: widget.isPersonal,
                          loanTypeId: widget.loanTypeId,
                        );
                      },
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      margin: const EdgeInsets.only(right: 15),
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: primaryClNew),
                    ),
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        bottomSheet();
                      },
                      child: RichText(
                        textAlign: TextAlign.start,
                        text: const TextSpan(
                          text: "By clicking on proceed. you have and agree to the moneyverss's  ",
                          style: TextStyle(
                            color: secondary2Cl,
                            fontFamily: regular,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 10,
                          ),
                          children: [
                            TextSpan(
                              text: "Credit Reports Terms of Use,",
                              style: TextStyle(
                                color: primaryClNew,
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                fontFamily: bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            TextSpan(
                              text: " moneyverss's ",
                              style: TextStyle(
                                color: secondary2Cl,
                                fontFamily: regular,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 10,
                              ),
                            ),
                            TextSpan(
                              text: "Terms of Use & Privacy Policy.",
                              style: TextStyle(
                                color: primaryClNew,
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                fontFamily: bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                  ],
                ),
                const SizedBox(height: 80),
              ],
            ),
            bottomSheet: widget.controller.employmentList.isEmpty
                ? const SizedBox()
                : Container(
                    color: screenBgCl,
                    width: MediaQuery.of(context).size.width,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (widget.controller.employmentId.value == "") {
                              final snackBar = SnackBar(
                                backgroundColor: redCl,
                                behavior: SnackBarBehavior.floating,
                                dismissDirection: DismissDirection.up,
                                content: const Text("Please select employment type"),
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
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                gradient: const LinearGradient(colors: [
                                  Color(0xFF189DFF),
                                  Color(0xFF0070C1),
                                ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
                            width: 154,
                            height: 46,
                            child: const Center(
                              child: Text(
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
                        ),
                      ],
                    ),
                  ),
          );
        });
  }

  bottomSheet() {
    return showModalBottomSheet(
        isScrollControlled: true,
        useRootNavigator: true,
        isDismissible: true,
        backgroundColor: whiteColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(12), topLeft: Radius.circular(12)),
        ),
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (BuildContext context, setState) {
            return Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(
                color: appBarClNew1,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Wrap(children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width),
                    const Text(
                      demoString + demoString + demoString + demoString,
                      style: TextStyle(
                        color: primaryClNew,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontFamily: bold,
                      ),
                    ),
                    const Text(
                      demoString + demoString + demoString + demoString,
                      style: TextStyle(
                        color: primaryClNew,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontFamily: bold,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        Container(
                          height: 14,
                          width: 14,
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFFB6D3FF)), // Border color
                            borderRadius: BorderRadius.circular(2), // Adjust the radius as needed
                          ),
                          child: Checkbox(
                            value: isCheck,
                            onChanged: (bool? newValue) {
                              if (newValue != null) {
                                setState(() {
                                  isCheck = newValue;
                                });
                              }
                            },
                            checkColor: Colors.white,
                            activeColor: const Color(0xFF0066FF), // Color when clicked
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // Remove extra padding
                          ),
                        ),
                        const SizedBox(width: 10,),
                        const Expanded(
                            child: Text(
                              textAlign: TextAlign.start,
                               "Agree to term And conditions",
                                style: TextStyle(
                                  color: secondary2Cl,
                                  fontFamily: regular,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12,
                                ),
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                  ],
                )
              ]),
            );
          });
        });
  }
}
