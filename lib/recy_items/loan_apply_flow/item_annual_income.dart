import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:wireframe/models/annual_income_list_model.dart';

import '../../constants/constants.dart';
import '../../controllers/loan_apply_controller.dart';

class ItemAnnualIncome extends StatefulWidget {
  final AnnualIncomeData annualIncomeData;
  final LoanApplyController controller;

  const ItemAnnualIncome({super.key, required this.annualIncomeData, required this.controller});

  @override
  State<ItemAnnualIncome> createState() => _ItemAnnualIncomeState();
}

class _ItemAnnualIncomeState extends State<ItemAnnualIncome> {
  @override
  Widget build(BuildContext context) {
    return
    InkWell(
        onTap: () {
          setState(() {
            widget.controller.annualIncomeId.value = widget.annualIncomeData.id.toString();

          });
        },
        child: Obx(
              () => Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(7),
              border: Border.all(
                color: widget.controller.annualIncomeId.value == widget.annualIncomeData.id.toString() ? primaryClNew : borderNewCl,
                width: 1,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "₹ ${widget.annualIncomeData.income}",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: draKText,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      fontFamily:  widget.controller.annualIncomeId.value == widget.annualIncomeData.id.toString() ? semiBold : medium,
                      fontSize: 12,
                    ),
                  ),
                ),
                Obx(
                      () => Container(
                    height: 18,
                    width: 18,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border:
                        widget.controller.annualIncomeId.value == widget.annualIncomeData.id.toString()? Border.all(color: primaryClNew, width: 5) : Border.all(color: borderNewCl, width: 1)),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
