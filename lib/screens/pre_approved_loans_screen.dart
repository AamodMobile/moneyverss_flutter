import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/controllers/loan_apply_controller.dart';
import 'package:wireframe/controllers/loan_offer_controller.dart';
import 'package:wireframe/models/loan_offer_list_model.dart';
import 'package:wireframe/widget/my_button.dart';

class PreApprovedLoanScreen extends StatefulWidget {
  final String loanTypeId;
  final String loanType;
  final LoanApplyController controller;

  const PreApprovedLoanScreen({super.key, required this.loanTypeId, required this.controller, required this.loanType});

  @override
  State<PreApprovedLoanScreen> createState() => _PreApprovedLoanScreenState();
}

class _PreApprovedLoanScreenState extends State<PreApprovedLoanScreen> {
  LoanOfferController controller = Get.put(LoanOfferController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: Get.find<LoanOfferController>(),
        initState: (state) {
          Get.find<LoanOfferController>().getLoanOfferList(
            widget.controller.bankId.value,
            widget.loanTypeId,
            widget.controller.loanSubTypeId.value,
            widget.controller.loanAmountRangeId.value,
          );
        },
        builder: (contextCtrl) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: screenBgCl,
              appBar: PreferredSize(
                preferredSize: Size(MediaQuery.of(context).size.width, 65),
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16,),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      color: whiteColor,
                      border: Border.fromBorderSide(
                          BorderSide(color: Color(0xFFB6D3FF)))),
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: 8, bottom: 8, right: 8),
                            child: Image.asset(
                              icBack,
                              height: 24,
                              width: 24,
                            ),
                          )),
                      SizedBox(width: 5,),
                      Image.asset(
                        imgCommonLogo,
                        height: 25,
                        fit: BoxFit.contain,
                      )
                    ],
                  ),
                ),
              ),
              body: Builder(builder: (context) {
                if (contextCtrl.loading) {
                  return const LoaderClass();
                }
                if (contextCtrl.loanOfferDataList.isEmpty) {
                  return Center(
                    child: SizedBox(
                      height: 500,
                      width: MediaQuery.of(context).size.width,
                      child: const Center(
                        child: Text(
                          'No Pre Approved Loan',
                          style: TextStyle(
                            color: blueCl,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                            fontFamily: semiBold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  );
                }
                return Column(
                  children: [
                    contextCtrl.loanOfferDataList.isEmpty
                        ? const SizedBox()
                        : Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                            decoration: const BoxDecoration(color: whiteColor),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Loan Type",
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: textHeading,
                                        fontFamily: semiBold,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      widget.loanType,
                                      maxLines: 2,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: textHeading,
                                        fontFamily: semiBold,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 11,
                                ),
                                Container(
                                  decoration: BoxDecoration(color: const Color(0xFFF2F8FF), borderRadius: BorderRadius.circular(6)),
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      widget.controller.yearRangeName.value == ""
                                          ? const Expanded(
                                            child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Tenure:- ",
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.black,
                                                      fontFamily: regular,
                                                      fontWeight: FontWeight.w400,
                                                      fontStyle: FontStyle.normal,
                                                    ),
                                                  ),
                                                  Text(
                                                    "0-5 Years",
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      color: textHeading,
                                                      fontFamily: semiBold,
                                                      fontWeight: FontWeight.w600,
                                                      fontStyle: FontStyle.normal,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                          )
                                          : Expanded(
                                            child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    "Tenure",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black,
                                                      fontFamily: regular,
                                                      fontWeight: FontWeight.w400,
                                                      fontStyle: FontStyle.normal,
                                                    ),
                                                  ),
                                                  Text(
                                                    "${widget.controller.yearRangeName.value} ",
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                      color: textHeading,
                                                      fontFamily: semiBold,
                                                      fontWeight: FontWeight.w600,
                                                      fontStyle: FontStyle.normal,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                          ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "Loan Type",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black,
                                              fontFamily: regular,
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.normal,
                                            ),
                                          ),
                                          Text(
                                            "₹ ${widget.controller.loanAmountRangeName.value}",
                                            textAlign: TextAlign.start,
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: textHeading,
                                              fontFamily: semiBold,
                                              fontWeight: FontWeight.w600,
                                              fontStyle: FontStyle.normal,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                    const SizedBox(
                      height: 15,
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemCount: contextCtrl.loanOfferDataList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return myRunningListTile(contextCtrl.loanOfferDataList[index]);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 7);
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          controller.createLead(
                              widget.loanTypeId,
                              widget.controller.loanSubTypeId.value,
                              widget.controller.employmentId.value,
                              widget.controller.annualIncomeId.value,
                              "",
                              widget.controller.loanAmountRangeId.value,
                              widget.controller.cityId.value,
                              "",
                              widget.controller.stateId.value,
                              widget.controller.yearRangeId.toString(),
                              widget.controller.annualTurnoverId.value,
                              widget.controller.companyName.text,
                              widget.controller.selectCompanyType != null ? widget.controller.selectCompanyType!.id.toString() : "",
                              widget.controller.selectedBusinessYear.value,
                              "1",
                              widget.controller.pastLoanTimeValue.value,
                              widget.controller.requireAmountType.value=="Yes"?"1":"0",
                              widget.controller.bankId.value,
                              widget.controller.selectedCurrentResidence.value,
                              widget.controller.goldValue.value,
                              widget.controller.vehicleId.value,
                              widget.controller.modelId.value,
                              widget.controller.variantId.value,
                              widget.controller.productTypeId.value,
                              widget.controller.yearOfManufacture.text,
                              widget.controller.topupAmount.text,
                              true);
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 40),
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 11),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: primaryClNew, width: 1),
                            color: Colors.white,
                          ),
                          child: const Center(
                            child: Text(
                              'Book Free Financial Consultancy',
                              style: TextStyle(
                                color: primaryClNew,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                fontFamily: medium,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                  ],
                );
              }),
              /* floatingActionButton: InkWell(
                onTap: (){
                  Get.to(()=>const AskForLoan());
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 0,vertical: 10),
                  height: 60,
                  width: 60,
                  child: Image.asset(askIc),
                ),
              ),*/
            ),
          );
        });
  }

  myRunningListTile(LoanOfferData leadData) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 7),
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 1),
            blurRadius: 15,
            spreadRadius: 0,
            color: const Color(0xFF000000).withOpacity(0.15),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(width: MediaQuery.of(context).size.width),
          Row(
            children: [
              Visibility(
                visible: true,
                child: Container(
                  height: 40,
                  width: 40,
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: bgCont,
                    border: Border.all(color: borderNewCl,width: 0.5),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ClipRRect(
                    child: leadData.bank!.image != ""
                        ? CachedNetworkImage(
                            errorWidget: (context, url, error) => Image.asset(
                              kotakBankLogo,
                              fit: BoxFit.fill,
                              height: 45,
                              width: 45,
                            ),
                            height: 45,
                            width: 45,
                            fit: BoxFit.fill,
                            imageUrl: leadData.bank!.image.toString(),
                            placeholder: (a, b) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : Image.asset(
                            kotakBankLogo,
                            fit: BoxFit.cover,
                            height: 45,
                            width: 45,
                          ),
                  ),
                ),
              ),
              const SizedBox(width: 9),
              Expanded(
                flex: 3,
                child: Text(
                  " ${leadData.bank!.name!}",
                  style: const TextStyle(
                    color: draKText,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: semiBold,
                  ),
                ),
              ),
              /*    Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Max Loan Amount",
                    style: TextStyle(
                      color: primaryCl,
                      fontStyle: FontStyle.normal,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      fontFamily: semiBold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "Rs ${leadData.maxLoanAmount}",
                    style: const TextStyle(
                      color: draKText,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: semiBold,
                    ),
                  ),
                ],
              ),*/
              const Spacer(),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 36,
                  width: 80,
                  child: MyButton(
                    onPressed: () {
                      controller.createLead(
                          widget.loanTypeId,
                          widget.controller.loanSubTypeId.value,
                          widget.controller.employmentId.value,
                          widget.controller.annualIncomeId.value,
                          leadData.bankId.toString(),
                          widget.controller.loanAmountRangeId.value,
                          widget.controller.cityId.value,
                          leadData.id.toString(),
                          widget.controller.stateId.value,
                          widget.controller.yearRangeId.toString(),
                          widget.controller.annualTurnoverId.value,
                          widget.controller.companyName.text,
                          widget.controller.selectCompanyType != null ? widget.controller.selectCompanyType!.id.toString() : "",
                          widget.controller.selectedBusinessYear.value,
                          "0",
                          widget.controller.pastLoanTimeValue.value,
                          widget.controller.requireAmountType.value=="Yes"?"1":"0",
                          widget.controller.bankId.value,
                          widget.controller.selectedCurrentResidence.value,
                          widget.controller.goldValue.value,
                          widget.controller.vehicleId.value,
                          widget.controller.modelId.value,
                          widget.controller.variantId.value,
                          widget.controller.productTypeId.value,
                          widget.controller.yearOfManufacture.text,
                          widget.controller.topupAmount.text,
                          false);
                    },
                    color: primaryClNew,
                    child: const Text(
                      'Apply',
                      style: TextStyle(
                        color: whiteColor,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        fontFamily: semiBold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(color: homeBgCl, height: 1),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 5),
                  decoration: const BoxDecoration(color: bgCont),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Interest Rate",
                        style: TextStyle(
                          color: primaryClNew,
                          fontStyle: FontStyle.normal,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          fontFamily: semiBold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "${leadData.interestRate}",
                        style: const TextStyle(
                          color: draKText,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: semiBold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 5),
                  decoration: const BoxDecoration(color: bgCont),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "EMI",
                        style: TextStyle(
                          color: rejectCl,
                          fontStyle: FontStyle.normal,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          fontFamily: semiBold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "${leadData.emi}",
                        style: const TextStyle(
                          color: draKText,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: semiBold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 5),
                  decoration: const BoxDecoration(color: bgCont),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Processing Fee",
                        style: TextStyle(
                          color: success,
                          fontStyle: FontStyle.normal,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          fontFamily: semiBold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "${leadData.processingFees}",
                        style: const TextStyle(
                          color: draKText,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: semiBold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  bottomSheet() {
    return showModalBottomSheet(
        isScrollControlled: true,
        useRootNavigator: true,
        isDismissible: false,
        backgroundColor: whiteColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(12), topLeft: Radius.circular(12)),
        ),
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (BuildContext context, setState) {
            return Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: appBarClNew1,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Wrap(children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        closeIcRound,
                        height: 20,
                        width: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        controller.createLead(
                            widget.loanTypeId,
                            widget.controller.loanSubTypeId.value,
                            widget.controller.employmentId.value,
                            widget.controller.annualIncomeId.value,
                            "",
                            widget.controller.loanAmountRangeId.value,
                            widget.controller.cityId.value,
                            "",
                            widget.controller.stateId.value,
                            widget.controller.yearRangeId.toString(),
                            widget.controller.annualTurnoverId.value,
                            widget.controller.companyName.text,
                            widget.controller.selectCompanyType != null ? widget.controller.selectCompanyType!.id.toString() : "",
                            widget.controller.selectedBusinessYear.value,
                            "1",
                            widget.controller.pastLoanTimeValue.value,
                            widget.controller.requireAmountType.value=="Yes"?"1":"0",
                            widget.controller.bankId.value,
                            widget.controller.selectedCurrentResidence.value,
                            widget.controller.goldValue.value,
                            widget.controller.vehicleId.value,
                            widget.controller.modelId.value,
                            widget.controller.variantId.value,
                            widget.controller.productTypeId.value,
                            widget.controller.yearOfManufacture.text,
                            widget.controller.topupAmount.text,
                            true);
                      },
                      child: Image.asset(
                        componentImg,
                        height: 102,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                )
              ]),
            );
          });
        });
  }
}
