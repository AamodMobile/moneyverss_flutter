import 'package:get/get.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/controllers/dashboard_controller.dart';
import 'package:wireframe/controllers/loan_apply_controller.dart';
import 'package:wireframe/models/employment_list_model.dart';
import 'package:wireframe/screens/loan_apply_screen.dart';

class ItemEmployment extends StatefulWidget {
  final EmploymentData employmentData;
  final LoanApplyController controller;
  final bool isBusiness;
  final bool isPersonal;
  final String loanTypeId;

  const ItemEmployment({
    super.key,
    required this.employmentData,
    required this.controller,
    required this.isBusiness,
    required this.loanTypeId,
    required this.isPersonal,
  });

  @override
  State<ItemEmployment> createState() => _ItemEmploymentState();
}

class _ItemEmploymentState extends State<ItemEmployment> {
  DashboardController dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {
            setState(() {
              widget.controller.employmentId.value = widget.employmentData.id.toString();
              widget.controller.employmentTittle.value = widget.employmentData.name.toString();
              if (widget.isPersonal) {
                if (widget.employmentData.name != "Salaried" && !widget.isBusiness) {
                  for (int i = 0; i < dashboardController.loanTypeList.length; i++) {
                    if (dashboardController.loanTypeList[i].name == "Business Loan") {
                      Get.to(() => LoanApplyScreen(title: "Business Loan", loanTypeId: dashboardController.loanTypeList[i].id.toString()));
                    }
                  }
                }
              }
            });
          },
          child: widget.employmentData.name == "Salaried" && widget.isBusiness
              ? const SizedBox()
              : Obx(
                  () => Container(
                    height: 70,
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: whiteColor,
                      border: Border.all(
                        color: widget.controller.employmentId.value == widget.employmentData.id.toString() ? primaryClNew : borderNewCl,
                        width: 1,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.employmentData.name.toString(),
                              style: TextStyle(
                                color: widget.controller.employmentId.value == widget.employmentData.id.toString() ? primaryClNew : secondaryCl,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontFamily: widget.controller.employmentId.value == widget.employmentData.id.toString() ? semiBold : medium,
                                fontSize: 14,
                              ),
                            ),
                            Container(
                              height: 18,
                              width: 18,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: widget.controller.employmentId.value == widget.employmentData.id.toString()
                                      ? Border.all(color: primaryClNew, width: 5)
                                      : Border.all(color: borderNewCl, width: 1)),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          widget.employmentData.description ?? "",
                          style: const TextStyle(
                            color: textGeryCl,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            fontFamily: regular,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
