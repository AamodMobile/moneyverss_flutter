import 'package:get/get.dart';
import 'package:wireframe/controllers/loan_apply_controller.dart';

import '../constants/constants.dart';
import '../recy_items/loan_apply_flow/item_loanamt_range.dart';
import '../widget/my_button.dart';

class SelectLoanAmountPage extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final LoanApplyController controller;
  final String loanTypeId;

  const SelectLoanAmountPage({Key? key, required this.onNext, required this.onPrevious, required this.controller, required this.loanTypeId}) : super(key: key);

  @override
  State<SelectLoanAmountPage> createState() => _SelectLoanAmountState();
}

class _SelectLoanAmountState extends State<SelectLoanAmountPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<LoanApplyController>(),
      initState: (state) {
        Get.find<LoanApplyController>().getLoanAmountRangeList(widget.loanTypeId, widget.controller.employmentId.toString());
      },
      builder: (contextCtrl) {
        if (widget.controller.loading) {
          return const LoaderClass();
        }
        return Scaffold(
          backgroundColor: screenBgCl,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 14,
              ),
              const Text(
                'Select your desired  loan amount',
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
              Expanded(
                child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: contextCtrl.loanAmountRangeList.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(mainAxisExtent: 54, childAspectRatio: 1, crossAxisSpacing: 20, mainAxisSpacing: 20, crossAxisCount: 2),
                    itemBuilder: (BuildContext context, int index) {
                      return ItemLoanamtRange(loanAmtRangeData: contextCtrl.loanAmountRangeList[index], controller: widget.controller);
                    }),
              ),
              const SizedBox(height: 70),
            ],
          ),
          bottomSheet: widget.controller.loanAmountRangeList.isEmpty
              ? const SizedBox()
              : Container(
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
                          if (widget.controller.loanAmountRangeId.value == "") {
                            final snackBar = SnackBar(
                              backgroundColor: redCl,
                              behavior: SnackBarBehavior.floating,
                              dismissDirection: DismissDirection.up,
                              content: const Text("Please select desire loan amount range"),
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
      },
    );
  }
}
