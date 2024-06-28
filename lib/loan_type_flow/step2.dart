import 'package:get/get.dart';
import 'package:wireframe/controllers/loan_apply_controller.dart';
import 'package:wireframe/recy_items/loan_apply_flow/item_annual_income.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/widget/my_button.dart';

class Step2 extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final LoanApplyController controller;
  final String loanTypeId;
  final String employmentId;

  const Step2({
    Key? key,
    required this.onNext,
    required this.onPrevious,
    required this.controller,
    required this.loanTypeId,
    required this.employmentId,
  }) : super(key: key);

  @override
  State<Step2> createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<LoanApplyController>(),
      initState: (state) {
        Get.find<LoanApplyController>().getAnnualIncomeList(widget.loanTypeId, widget.employmentId);
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
              const SizedBox(height: 14),
              const Text(
                annaulIncomeTitle,
                style: TextStyle(
                  color: blueCl,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600,
                  fontFamily: semiBold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 6),
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
                    itemCount: widget.controller.annualIncomeList.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 54,
                      childAspectRatio: 1,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return ItemAnnualIncome(
                        annualIncomeData: contextCtrl.annualIncomeList[index],
                        controller: widget.controller,
                      );
                    }),
              ),
              const SizedBox(height: 70),
            ],
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
                      border:Border.all(color: primaryClNew,width: 1),
                      color: Colors.white,),
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
                widget.controller.employmentList.isEmpty ? const SizedBox() : const SizedBox(width: 10),
                widget.controller.employmentList.isEmpty
                    ? const SizedBox()
                :  GestureDetector(
                  onTap: () {
                    if (widget.controller.annualIncomeId.value == "") {
                      final snackBar = SnackBar(
                        backgroundColor: redCl,
                        behavior: SnackBarBehavior.floating,
                        dismissDirection: DismissDirection.up,
                        content: const Text("Please select your annual income"),
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
