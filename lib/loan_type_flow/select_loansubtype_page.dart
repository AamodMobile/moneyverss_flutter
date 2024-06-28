import 'package:get/get.dart';
import 'package:wireframe/recy_items/loan_apply_flow/item_loan_sub_type.dart';
import 'package:wireframe/screens/cms_screen.dart';

import '../constants/constants.dart';
import '../controllers/loan_apply_controller.dart';
import '../widget/my_button.dart';

class SelectLoanSubTypePage extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onBack;
  final LoanApplyController controller;
  final String loanTypeId;

  const SelectLoanSubTypePage({Key? key, required this.onNext, required this.controller, required this.loanTypeId, required this.onBack}) : super(key: key);

  @override
  State<SelectLoanSubTypePage> createState() => _LoanSubTypePageState();
}

class _LoanSubTypePageState extends State<SelectLoanSubTypePage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: Get.find<LoanApplyController>(),
        initState: (state) => {Get.find<LoanApplyController>().getLoanSubTypeList(widget.loanTypeId)},
        builder: (contextCtrl) {
          if (widget.controller.loading) {
            return const Center(
              child: CircularProgressIndicator(
                color: mainColor,
                backgroundColor: primaryCl,
              ),
            );
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
                  loanSubTypeTitle,
                  style: TextStyle(
                    color: blueCl,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    fontFamily: semiBold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 4,
                  width: 65,
                  decoration: BoxDecoration(color: primaryClNew, borderRadius: BorderRadius.circular(4)),
                ),
                const SizedBox(height: 21),
                Expanded(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: widget.controller.loanSubTypeList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ItemLoanSubType(loanSubTypeData: contextCtrl.loanSubTypeList[index], controller: widget.controller);
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 40,
                    width: 150,
                    child: MyButton(
                      onPressed: () {
                        if (widget.controller.loanSubTypeId.value == "") {
                          final snackBar = SnackBar(
                            backgroundColor: redCl,
                            behavior: SnackBarBehavior.floating,
                            dismissDirection: DismissDirection.up,
                            content: const Text("Please select loan sub type"),
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
                      color: secondaryCl,
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
                ),
                const SizedBox(height: 20),
              ],
            ),
          );
        });
  }
}
