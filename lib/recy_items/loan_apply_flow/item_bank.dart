import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wireframe/controllers/loan_apply_controller.dart';
import 'package:wireframe/models/bank_list_model.dart';

import '../../constants/constants.dart';

class ItemBank extends StatefulWidget {
  final LoanApplyController controller;
  final BankData bankData;

  const ItemBank({super.key, required this.controller, required this.bankData});

  @override
  State<ItemBank> createState() => _ItemBankState();
}

class _ItemBankState extends State<ItemBank> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.controller.bankId.value = widget.bankData.id.toString();
        });
      },
      child: Container(
        height: 62,
        padding: const EdgeInsets.all(7),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(7),
          border: Border.all(
            color:  widget.controller.bankId.value ==
                widget.bankData.id.toString()? primaryClNew : borderNewCl,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                widget.bankData.name.toString(),
                maxLines: 2,
                textAlign: TextAlign.center,
                style:  TextStyle(
                  color: draKText,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  fontFamily: widget.controller.bankId.value ==
                      widget.bankData.id.toString()? semiBold : medium,
                  fontSize: 10,
                ),
              ),
            ),
            Obx(
              () => Container(
                height: 18,
                width: 18,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: widget.controller.bankId.value ==
                            widget.bankData.id.toString()
                    ? Border.all(color: primaryClNew, width: 5)
                    : Border.all(color: borderNewCl, width: 1)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
