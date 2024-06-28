import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/models/dashboard_model.dart';
import 'package:wireframe/screens/loan_apply_screen.dart';

class ItemLoanType extends StatefulWidget {
  final Loantype loanTypeList;
  final Loantype lastLoanType;

  const ItemLoanType({super.key, required this.loanTypeList, required this.lastLoanType});

  @override
  State<ItemLoanType> createState() => _ItemLoanTypeState();
}

class _ItemLoanTypeState extends State<ItemLoanType> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            if (widget.loanTypeList.name.toString() == "Home Loan") {
              HomeLoanTypeDialog();
            } else {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoanApplyScreen(
                            title: widget.loanTypeList.name.toString(),
                            loanTypeId: widget.loanTypeList.id.toString(),
                          )));
            }
          },
          child: Container(
            padding: const EdgeInsets.all(13),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 1),
                  blurRadius: 5,
                  spreadRadius: 0,
                  color: Colors.black.withOpacity(0.25),
                ),
              ],
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF189DFF),
                  Color(0xFF0070C1),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Image.network(
              widget.loanTypeList.image.toString(),
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.20,
          child: Text(
            widget.loanTypeList.name!.capitalize!,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: textHeading,
              overflow: TextOverflow.ellipsis,
              fontFamily: semiBold,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
              fontSize: 10,
            ),
          ),
        ),
      ],
    );
  }

  HomeLoanTypeDialog() {
    showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          elevation: 0,
          insetPadding: const EdgeInsets.symmetric(horizontal: 30),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: textBg,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 35,
                    ),
                    Expanded(
                      child: const Text(
                        "Select Loan Type",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: textColorSec,
                          fontFamily: semiBold,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Align(
                              alignment: Alignment.centerRight,
                              child:
                                  Image.asset(width: 25, height: 25, icCross)),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
                width: MediaQuery.of(context).size.width,
              ),
              InkWell(
                onTap: (){
                  Get.back();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoanApplyScreen(
                            title: widget.loanTypeList.name.toString(),
                            loanTypeId: widget.loanTypeList.id.toString(),
                          )));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  height: 90,
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xFFCEDEEA), width: 2),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFF1F9FF),
                        Color(0xFFEAF5FD),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Image.asset(
                        imgHomeLoan,
                        height: 50,
                        width: 50,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Text(
                          "Home Loan",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: semiBold,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Image.asset(
                        arrowRoundIc,
                        height: 20,
                        width: 20,
                      ),
                      SizedBox(
                        width: 15,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: (){
                  Get.back();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoanApplyScreen(
                            title: widget.lastLoanType.name.toString(),
                            loanTypeId: widget.lastLoanType.id.toString(),
                          )));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  height: 90,
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xFFCEDEEA), width: 2),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFF1F9FF),
                        Color(0xFFEAF5FD),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Image.asset(
                        imgTopup,
                        height: 50,
                        width: 50,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Text(
                          "Topup",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: semiBold,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Image.asset(
                        arrowRoundIc,
                        height: 20,
                        width: 20,
                      ),
                      SizedBox(
                        width: 15,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
                width: MediaQuery.of(context).size.width,
              ),
            ],
          ),
        );
      },
    );
  }
}
