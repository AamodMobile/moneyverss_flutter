import 'package:get/get.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/controllers/loan_apply_controller.dart';

class CompanyType extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final String loanTypeId;
  final LoanApplyController controller;

  const CompanyType({super.key, required this.onNext, required this.onPrevious, required this.loanTypeId, required this.controller});

  @override
  State<CompanyType> createState() => _CompanyTypeState();
}

class _CompanyTypeState extends State<CompanyType> {
  String selectedProfession = "";

  List<String> professionTypeList = [
    "Doctor",
    "CA",
    "Other",
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: Get.find<LoanApplyController>(),
        initState: (state) => {Get.find<LoanApplyController>().getBusinessTypeList()},
        builder: (contextCtrl) {
          return Scaffold(
            backgroundColor: screenBgCl,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 14),
                  Text(
                    widget.controller.employmentTittle.value == "Self Employed Non Professional" ? 'Company type' : "Professional type",
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
                  const SizedBox(
                    height: 20,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: widget.controller.employmentTittle.value == "Self Employed Non Professional" ? contextCtrl.businessTypeList.length : professionTypeList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              if (widget.controller.employmentTittle.value == "Self Employed Non Professional") {
                                contextCtrl.selectCompanyType = contextCtrl.businessTypeList[index];
                              } else {
                                selectedProfession = professionTypeList[index];
                              }
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
                                color: widget.controller.employmentTittle.value == "Self Employed Non Professional"
                                    ? (contextCtrl.selectCompanyType == contextCtrl.businessTypeList[index])
                                        ? primaryClNew
                                        : borderNewCl
                                    : (selectedProfession == professionTypeList[index])
                                        ? primaryClNew
                                        : borderNewCl,
                                width: 1,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(
                                    widget.controller.employmentTittle.value == "Self Employed Non Professional" ? contextCtrl.businessTypeList[index].name.toString() : professionTypeList[index],
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: draKText,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: widget.controller.employmentTittle.value == "Self Employed Non Professional"
                                          ? (contextCtrl.selectCompanyType == contextCtrl.businessTypeList[index])
                                              ? semiBold
                                              : medium
                                          : (selectedProfession == professionTypeList[index])
                                              ? semiBold
                                              : medium,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 18,
                                  width: 18,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: widget.controller.employmentTittle.value == "Self Employed Non Professional"
                                        ? (contextCtrl.selectCompanyType == contextCtrl.businessTypeList[index])
                                            ? Border.all(color: primaryClNew, width: 5)
                                            : Border.all(color: borderNewCl, width: 1)
                                        : (selectedProfession == professionTypeList[index])
                                            ? Border.all(color: primaryClNew, width: 5)
                                            : Border.all(color: borderNewCl, width: 1),
                                  ),
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
            bottomSheet: (widget.controller.employmentTittle.value == "Self Employed Non Professional"?widget.controller.businessTypeList.isEmpty:professionTypeList.isEmpty)
                ? const SizedBox()
                : Container(
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
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            if (widget.controller.employmentTittle.value == "Self Employed Non Professional") {
                              if (contextCtrl.selectCompanyType == null) {
                                final snackBar = SnackBar(
                                  backgroundColor: redCl,
                                  behavior: SnackBarBehavior.floating,
                                  dismissDirection: DismissDirection.up,
                                  content: const Text("Please Select company Type"),
                                  action: SnackBarAction(
                                    label: '',
                                    onPressed: () {},
                                  ),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              } else {
                                widget.onNext();
                              }
                            } else {
                              if (selectedProfession == "") {
                                final snackBar = SnackBar(
                                  backgroundColor: redCl,
                                  behavior: SnackBarBehavior.floating,
                                  dismissDirection: DismissDirection.up,
                                  content: const Text("Please Select Professional Type"),
                                  action: SnackBarAction(
                                    label: '',
                                    onPressed: () {},
                                  ),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              } else {
                                widget.onNext();
                              }
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
        });
  }
}
