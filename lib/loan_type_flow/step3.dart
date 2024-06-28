import 'package:get/get.dart';
import 'package:wireframe/controllers/loan_apply_controller.dart';
import 'package:wireframe/recy_items/loan_apply_flow/item_bank.dart';

import '../constants/constants.dart';
import '../widget/my_button.dart';

class Step3 extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final LoanApplyController controller;
  final String loanTypeId;
  final String tittle;

  const Step3({Key? key, required this.onNext, required this.onPrevious, required this.controller, required this.loanTypeId, required this.tittle}) : super(key: key);

  @override
  State<Step3> createState() => _Step3State();
}

class _Step3State extends State<Step3> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<LoanApplyController>(),
      initState: (state) {
        Get.find<LoanApplyController>().getBankList();
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
               Text(
                widget.tittle,
                style: const TextStyle(
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
              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: widget.controller.bankList.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 52,
                      childAspectRatio: 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return ItemBank(
                        bankData: contextCtrl.bankList[index],
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
                widget.controller.bankList.isEmpty ? const SizedBox() : const SizedBox(width: 10),
                widget.controller.bankList.isEmpty
                    ? const SizedBox()
                    : GestureDetector(
                        onTap: () {
                          if (widget.controller.bankId.value == "") {
                            final snackBar = SnackBar(
                              backgroundColor: redCl,
                              behavior: SnackBarBehavior.floating,
                              dismissDirection: DismissDirection.up,
                              content: const Text("Please select back"),
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
