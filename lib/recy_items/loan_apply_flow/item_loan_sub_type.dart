import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:wireframe/controllers/loan_apply_controller.dart';
import 'package:wireframe/models/loan_subtypelist_model.dart';
import 'package:wireframe/constants/constants.dart';

class ItemLoanSubType extends StatefulWidget {
  final LoanSubTypeData loanSubTypeData;
  final LoanApplyController controller;

  const ItemLoanSubType({super.key, required this.loanSubTypeData, required this.controller});

  @override
  State<ItemLoanSubType> createState() => _ItemEmploymentState();
}

class _ItemEmploymentState extends State<ItemLoanSubType> {
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
              widget.controller.loanSubTypeId.value = widget.loanSubTypeData.id.toString();
            });
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(7),
              border: Border.all(
                color: borderNewCl,
                width: 1,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    widget.loanSubTypeData.name.toString(),
                    style: const TextStyle(
                      color: secondaryCl,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontFamily: medium,
                      fontSize: 14,
                    ),
                  ),
                ),
                Obx(
                  () => Container(
                    height: 18,
                    width: 18,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: widget.controller.loanSubTypeId.value == widget.loanSubTypeData.id.toString() ? Border.all(color: primaryClNew, width: 5) : Border.all(color: borderNewCl, width: 1)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
