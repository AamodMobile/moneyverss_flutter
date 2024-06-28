import 'package:get/get.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/constants/util.dart';
import 'package:wireframe/controllers/loan_apply_controller.dart';
import 'package:wireframe/widget/text_filled_widget.dart';

class RequireTopUpAmountScreen extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final LoanApplyController controller;
  final String loanTypeId;

  const RequireTopUpAmountScreen({super.key, required this.onNext, required this.onPrevious, required this.controller, required this.loanTypeId});

  @override
  State<RequireTopUpAmountScreen> createState() => _RequireTopUpAmountScreenState();
}

class _RequireTopUpAmountScreenState extends State<RequireTopUpAmountScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<LoanApplyController>(),
      initState: (state) {},
      builder: (contextCtrl) {
        if (widget.controller.loading) {
          return const LoaderClass();
        }
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: screenBgCl,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 14,
                ),
                const Text(
                  'Do you require topUp amount ?',
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
                  decoration: BoxDecoration(color: primaryClNew, borderRadius: BorderRadius.circular(4)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        setState(() {
                          widget.controller.requireAmountType.value = "Yes";
                        });
                      },
                      child: Obx(
                        () => Container(
                          height: 54,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(
                              color: widget.controller.requireAmountType.value == "Yes" ? primaryClNew : borderNewCl,
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  "Yes",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: draKText,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: widget.controller.requireAmountType.value == "Yes" ? semiBold : medium,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              Container(
                                height: 18,
                                width: 18,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: widget.controller.requireAmountType.value == "Yes" ? Border.all(color: primaryClNew, width: 5) : Border.all(color: borderNewCl, width: 1)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
                    const SizedBox(width: 18),
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        setState(() {
                          widget.controller.requireAmountType.value = "No";
                        });
                      },
                      child: Obx(
                        () => Container(
                          height: 54,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(
                              color: widget.controller.requireAmountType.value == "No" ? primaryClNew : borderNewCl,
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  "No",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: draKText,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: widget.controller.requireAmountType.value == "No" ? semiBold : medium,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              Container(
                                height: 18,
                                width: 18,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: widget.controller.requireAmountType.value == "No" ? Border.all(color: primaryClNew, width: 5) : Border.all(color: borderNewCl, width: 1)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
                  ],
                ),
                const SizedBox(height: 10),
                widget.controller.requireAmountType.value == "Yes"
                    ? const Text(
                        'Topup Amount',
                        style: TextStyle(
                          color: textHeading,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          fontFamily: semiBold,
                          fontSize: 12,
                        ),
                      )
                    : const SizedBox(),
                const SizedBox(height: 10),
                widget.controller.requireAmountType.value == "Yes"
                    ? MyTextFormField(
                        controller: widget.controller.topupAmount,
                        hint: "Topup Amount",
                        obscureText: false,
                        readOnly: false,
                        border: primaryClNew,
                        keyboardType: TextInputType.number,
                        fillColor: Colors.white,
                      )
                    : const SizedBox(),
                SizedBox(
                  height: widget.controller.requireAmountType.value == "Yes" ? MediaQuery.of(context).size.height * 0.30 : MediaQuery.of(context).size.height * 0.40,
                ),
                const Text(
                  'Why You Should Avail Top-Up ?',
                  style: TextStyle(
                    color: primaryClNew,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    fontFamily: regular,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Image.asset(
                      doneCircle,
                      height: 12,
                      width: 12,
                    ),
                    const SizedBox(width: 4),
                    const Expanded(
                      child: Text(
                        'Use Top-Up Amount For Your Personal Or Professional needs.',
                        style: TextStyle(
                          color: textHeading,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          fontFamily: regular,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Image.asset(
                      doneCircle,
                      height: 12,
                      width: 12,
                    ),
                    const SizedBox(width: 4),
                    const Expanded(
                      child: Text(
                        'Lower Interest Rate Compare Personal Loan',
                        style: TextStyle(
                          color: textHeading,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          fontFamily: regular,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Image.asset(
                      doneCircle,
                      height: 12,
                      width: 12,
                    ),
                    const SizedBox(width: 4),
                    const Expanded(
                      child: Text(
                        'Hassle Free Process',
                        style: TextStyle(
                          color: textHeading,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          fontFamily: regular,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
          bottomSheet: Container(
            color: screenBgCl,
            width: MediaQuery.of(context).size.width,
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    widget.onPrevious();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: primaryClNew, width: 1),
                      color: Colors.white,
                    ),
                    width: 154,
                    height: 46,
                    child: const Center(
                      child: Text(
                        'Previous',
                        style: TextStyle(
                          color: primaryClNew,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          fontFamily: semiBold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    if (widget.controller.requireAmountType.value == "") {
                      final snackBar = SnackBar(
                        backgroundColor: redCl,
                        behavior: SnackBarBehavior.floating,
                        dismissDirection: DismissDirection.up,
                        content: const Text("Please select require top up Amount type"),
                        action: SnackBarAction(
                          label: '',
                          onPressed: () {},
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      if (widget.controller.requireAmountType.value == "Yes") {
                        if (widget.controller.topupAmount.text.isEmpty) {
                          errorToast("Enter Topup Amount");
                        } else {
                          widget.onNext();
                        }
                      } else {
                        widget.onNext();
                      }
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
      },
    );
  }
}
