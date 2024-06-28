import 'package:get/get.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/controllers/loan_apply_controller.dart';

class CurrentResidenceType extends StatefulWidget {
  final VoidCallback onNext;
  final String loanTypeId;
  final LoanApplyController controller;
  final VoidCallback onPrevious;

  const CurrentResidenceType({super.key, required this.onNext, required this.loanTypeId, required this.controller, required this.onPrevious});

  @override
  State<CurrentResidenceType> createState() => _CurrentResidenceTypeState();
}

class _CurrentResidenceTypeState extends State<CurrentResidenceType> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<LoanApplyController>(),
      initState: (state) {
        /*   if (widget.controller.employmentTittle.value != "Salaried") {
      Get.find<LoanApplyController>().getAnnualTurnoverList(widget.loanTypeId, widget.employmentId);

        } else {*/
        Get.find<LoanApplyController>().residenceTypeGet();
        // }
      },
      builder: (contextCtrl) {
        if (widget.controller.loading) {
          return const LoaderClass();
        }
        return Scaffold(
          backgroundColor: screenBgCl,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 14),
                const Text(
                  'Select your current residence type',
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
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.controller.residenceTypeList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.controller.selectedCurrentResidence.value = widget.controller.residenceTypeList[index].title.toString();
                          });
                        },
                        child: Container(
                          height: 54,
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(
                              color: widget.controller.selectedCurrentResidence.value == widget.controller.residenceTypeList[index].title.toString() ? primaryClNew : borderNewCl,
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  widget.controller.residenceTypeList[index].title.toString(),
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: draKText,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: widget.controller.selectedCurrentResidence.value == widget.controller.residenceTypeList[index].title.toString() ? semiBold : medium,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              Container(
                                height: 18,
                                width: 18,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: widget.controller.selectedCurrentResidence.value == widget.controller.residenceTypeList[index].title.toString()
                                        ? Border.all(color: primaryClNew, width: 5)
                                        : Border.all(color: borderNewCl, width: 1)),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                const SizedBox(height: 70),
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
                Expanded(
                  child: GestureDetector(
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
                ),
                widget.controller.residenceTypeList.isEmpty ? const SizedBox() : const SizedBox(width: 10),
                widget.controller.residenceTypeList.isEmpty
                    ? const SizedBox()
                    : Expanded(
                        child: GestureDetector(
                          onTap: () {
                            if (widget.controller.selectedCurrentResidence.value == "") {
                              final snackBar = SnackBar(
                                backgroundColor: redCl,
                                behavior: SnackBarBehavior.floating,
                                dismissDirection: DismissDirection.up,
                                content: const Text("Please Select Residence Type"),
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
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
