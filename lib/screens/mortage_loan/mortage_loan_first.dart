import 'package:get/get.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/controllers/loan_apply_controller.dart';
import 'package:wireframe/recy_items/loan_apply_flow/item_loanamt_range.dart';
import 'package:wireframe/widget/my_button.dart';

class MortageLoan1 extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final String loanTypeId;
  final LoanApplyController controller;

  const MortageLoan1({super.key, required this.onNext, required this.loanTypeId, required this.controller, required this.onPrevious});

  @override
  State<MortageLoan1> createState() => _MortageLoan1State();
}

class _MortageLoan1State extends State<MortageLoan1> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<LoanApplyController>(),
      initState: (state) {
        Get.find<LoanApplyController>().getLoanAmountRangeList(widget.loanTypeId,widget.controller.employmentId.toString());
      },
      builder: (contextCtrl) {
        return Scaffold(
          backgroundColor: screenBgCl,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 14,
                ),
                const Text(
                  'Select your desired mortage loan amount',
                  style: TextStyle(
                    color: blueCl,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    fontFamily: semiBold,
                    fontSize: 16,
                  ),
                ),
                Builder(
                  builder: (context) {
                    if (contextCtrl.loading) {
                      return const LoaderClass();
                    }
                    if (contextCtrl.loanAmountRangeList.isEmpty) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height - 200,
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'No Data',
                              style: TextStyle(
                                color: mainColor,
                                fontSize: 14,
                                fontFamily: regular,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                        GridView.builder(
                            shrinkWrap: true,
                            itemCount: contextCtrl.loanAmountRangeList.length,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(mainAxisExtent: 54, childAspectRatio: 1, crossAxisSpacing: 20, mainAxisSpacing: 20, crossAxisCount: 2),
                            itemBuilder: (BuildContext context, int index) {
                              return ItemLoanamtRange(loanAmtRangeData: contextCtrl.loanAmountRangeList[index], controller: widget.controller);
                            }),
                        const SizedBox(height: 70),
                      ],
                    );
                  },
                )
              ],
            ),
          ),
          bottomSheet: widget.controller.loanAmountRangeList.isEmpty?const SizedBox(): Container(
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
                        content: const Text("Please Select home loan amount"),
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
