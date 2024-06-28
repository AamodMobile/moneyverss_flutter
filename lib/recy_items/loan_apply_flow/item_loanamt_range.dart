import 'package:get/get.dart';
import 'package:wireframe/models/loan_amt_range_model.dart';

import '../../constants/constants.dart';
import '../../controllers/loan_apply_controller.dart';

class ItemLoanamtRange extends StatefulWidget {
  final LoanApplyController controller;
  final LoanAmtRangData loanAmtRangeData;

  const ItemLoanamtRange({super.key, required this.controller, required this.loanAmtRangeData});

  @override
  State<ItemLoanamtRange> createState() => _ItemLoanamtRangeState();
}

class _ItemLoanamtRangeState extends State<ItemLoanamtRange> {
  @override
  Widget build(BuildContext context) {
    return
      InkWell(
        onTap: () {
            setState(() {
              widget.controller.loanAmountRangeId.value = widget.loanAmtRangeData.id.toString();
              widget.controller.loanAmountRangeName.value = widget.loanAmtRangeData.title.toString();
            });
        },
        child:  Obx(()=>
          Container(
            height: 54,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(7),
              border: Border.all(
                color: widget.controller.loanAmountRangeId.value == widget.loanAmtRangeData.id.toString()? primaryClNew : borderNewCl,
                width: 1,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    "₹ ${widget.loanAmtRangeData.title}",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: draKText,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      fontFamily:  widget.controller.loanAmountRangeId.value == widget.loanAmtRangeData.id.toString()? semiBold : medium,
                      fontSize: 12,
                    ),
                  ),
                ),
                Container(
                  height: 18,
                  width: 18,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border:
                      widget.controller.loanAmountRangeId.value == widget.loanAmtRangeData.id.toString()? Border.all(color: primaryClNew, width: 5) : Border.all(color: borderNewCl, width: 1)),
                ),
              ],
            ),
          ),
        ),
      );
  }
}
