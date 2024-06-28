import 'package:get/get.dart';

import '../constants/constants.dart';
import '../controllers/loan_apply_controller.dart';
import '../widget/my_button.dart';

class SelectBusinessTypePage extends StatefulWidget {
  final String loanTypeId;
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final LoanApplyController controller;

  const SelectBusinessTypePage({super.key, required this.onNext, required this.onPrevious, required this.loanTypeId, required this.controller});

  @override
  State<SelectBusinessTypePage> createState() => _SelectBusinessTypePageState();
}

class _SelectBusinessTypePageState extends State<SelectBusinessTypePage> {
  String businessType = "";

  List<String> businessTypeList = [
    "Proprietorship",
    "Partnership",
    "Private",
    "Public",
    "Other",
  ];
  String selectedDegree = "";

  List<String> degreeTypeList = [
    "MBBS",
    "Nursing",
    "H++",
    "M++",
    "Other",
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<LoanApplyController>(),
      initState: (state) => {Get.find<LoanApplyController>().getBusinessTypeList()},
      builder: (contextCtrl) {
        if (widget.controller.loading) {
          return const Center(
            child: CircularProgressIndicator(
              color: mainColor,
              backgroundColor: primaryCl,
            ),
          );
        }
        return Scaffold(
          backgroundColor: homeBgCl,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 14,
                ),
                Text(
                  widget.controller.employmentTittle.value == "Self Employe NON Professional" ? 'Business Details' : 'Profession Details',
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
                  decoration: BoxDecoration(
                    color: primaryClNew,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(height: 20),
                widget.controller.employmentTittle.value == "Self Employe NON Professional"
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Nature Of Business',
                            style: TextStyle(
                              color: textGeryCl,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontFamily: semiBold,
                              fontSize: 10,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 36,
                            child: DropdownButtonFormField<String?>(
                                dropdownColor: Colors.white,
                                iconDisabledColor: borderNewCl,
                                iconEnabledColor: borderNewCl,
                                iconSize: 24,
                                menuMaxHeight: 400,
                                padding: EdgeInsets.zero,
                                validator: (v) {
                                  if (v == "") {
                                    return "Select Business Type";
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  counterText: "",
                                  filled: true,
                                  fillColor: Colors.transparent,
                                  contentPadding: EdgeInsets.all(10),
                                  hintText: "Select Business Type",
                                  hintStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFFB4B4B4),
                                    fontFamily: regular,
                                    fontSize: 12,
                                  ),
                                  errorStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.red,
                                    fontFamily: regular,
                                    fontSize: 12,
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: borderNewCl, width: 1),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: borderNewCl, width: 1),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: borderNewCl, width: 1),
                                  ),
                                  disabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: borderNewCl, width: 1),
                                  ),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(color: borderNewCl, width: 1),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: borderNewCl, width: 1),
                                  ),
                                ),
                                isDense: true,
                                hint: const Text(
                                  "Select Business Type",
                                  style: TextStyle(
                                    fontFamily: regular,
                                    color: textGeryCl,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                value: businessType,
                                isExpanded: true,
                                items: [
                                  const DropdownMenuItem(
                                    value: "",
                                    child: Text(
                                      "Select Business",
                                      style: TextStyle(
                                        fontFamily: regular,
                                        color: primaryClNew,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  ...businessTypeList.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: const TextStyle(
                                          fontFamily: regular,
                                          color: primaryClNew,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ],
                                onChanged: (String? value) {
                                  setState(() {
                                    businessType = value!;
                                    print(businessType.toString());
                                  });
                                }),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Industry Type',
                            style: TextStyle(
                              color: textGeryCl,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontFamily: semiBold,
                              fontSize: 10,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 36,
                            child: DropdownButtonFormField<String?>(
                                dropdownColor: Colors.white,
                                iconDisabledColor: borderNewCl,
                                iconEnabledColor: borderNewCl,
                                iconSize: 24,
                                menuMaxHeight: 400,
                                padding: EdgeInsets.zero,
                                validator: (v) {
                                  if (v == "") {
                                    return "Select Industry Type";
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  counterText: "",
                                  filled: true,
                                  fillColor: Colors.transparent,
                                  contentPadding: EdgeInsets.all(10),
                                  hintText: "Select Industry Type",
                                  hintStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFFB4B4B4),
                                    fontFamily: regular,
                                    fontSize: 12,
                                  ),
                                  errorStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.red,
                                    fontFamily: regular,
                                    fontSize: 12,
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: borderNewCl, width: 1),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: borderNewCl, width: 1),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: borderNewCl, width: 1),
                                  ),
                                  disabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: borderNewCl, width: 1),
                                  ),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(color: borderNewCl, width: 1),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: borderNewCl, width: 1),
                                  ),
                                ),
                                isDense: true,
                                hint: const Text(
                                  "Select Industry Type",
                                  style: TextStyle(
                                    fontFamily: regular,
                                    color: textGeryCl,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                value: businessType,
                                isExpanded: true,
                                items: [
                                  const DropdownMenuItem(
                                    value: "",
                                    child: Text(
                                      "Select Industry Type",
                                      style: TextStyle(
                                        fontFamily: regular,
                                        color: primaryClNew,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  ...businessTypeList.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: const TextStyle(
                                          fontFamily: regular,
                                          color: primaryClNew,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ],
                                onChanged: (String? value) {
                                  setState(() {
                                    businessType = value!;
                                    print(businessType.toString());
                                  });
                                }),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Sub-Industry Type',
                            style: TextStyle(
                              color: textGeryCl,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontFamily: semiBold,
                              fontSize: 10,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 36,
                            child: DropdownButtonFormField<String?>(
                                dropdownColor: Colors.white,
                                iconDisabledColor: borderNewCl,
                                iconEnabledColor: borderNewCl,
                                iconSize: 24,
                                menuMaxHeight: 400,
                                padding: EdgeInsets.zero,
                                validator: (v) {
                                  if (v == "") {
                                    return "Select Industry Type";
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  counterText: "",
                                  filled: true,
                                  fillColor: Colors.transparent,
                                  contentPadding: EdgeInsets.all(10),
                                  hintText: "Select Industry Type",
                                  hintStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFFB4B4B4),
                                    fontFamily: regular,
                                    fontSize: 12,
                                  ),
                                  errorStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.red,
                                    fontFamily: regular,
                                    fontSize: 12,
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: borderNewCl, width: 1),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: borderNewCl, width: 1),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: borderNewCl, width: 1),
                                  ),
                                  disabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: borderNewCl, width: 1),
                                  ),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(color: borderNewCl, width: 1),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: borderNewCl, width: 1),
                                  ),
                                ),
                                isDense: true,
                                hint: const Text(
                                  "Select Industry Type",
                                  style: TextStyle(
                                    fontFamily: regular,
                                    color: textGeryCl,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                value: businessType,
                                isExpanded: true,
                                items: [
                                  const DropdownMenuItem(
                                    value: "",
                                    child: Text(
                                      "Select Industry Type",
                                      style: TextStyle(
                                        fontFamily: regular,
                                        color: primaryClNew,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  ...businessTypeList.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: const TextStyle(
                                          fontFamily: regular,
                                          color: primaryClNew,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ],
                                onChanged: (String? value) {
                                  setState(() {
                                    businessType = value!;
                                    print(businessType.toString());
                                  });
                                }),
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Your Heights degree',
                            style: TextStyle(
                              color: textGeryCl,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontFamily: semiBold,
                              fontSize: 10,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 36,
                            child: DropdownButtonFormField<String?>(
                                dropdownColor: Colors.white,
                                iconDisabledColor: borderNewCl,
                                iconEnabledColor: borderNewCl,
                                iconSize: 24,
                                menuMaxHeight: 400,
                                padding: EdgeInsets.zero,
                                validator: (v) {
                                  if (v == "") {
                                    return "Select Heights degree";
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  counterText: "",
                                  filled: true,
                                  fillColor: Colors.transparent,
                                  contentPadding: EdgeInsets.all(10),
                                  hintText: "Select Heights degree",
                                  hintStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFFB4B4B4),
                                    fontFamily: regular,
                                    fontSize: 12,
                                  ),
                                  errorStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.red,
                                    fontFamily: regular,
                                    fontSize: 12,
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: borderNewCl, width: 1),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: borderNewCl, width: 1),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: borderNewCl, width: 1),
                                  ),
                                  disabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: borderNewCl, width: 1),
                                  ),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(color: borderNewCl, width: 1),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: borderNewCl, width: 1),
                                  ),
                                ),
                                isDense: true,
                                hint: const Text(
                                  "Select Heights degree",
                                  style: TextStyle(
                                    fontFamily: regular,
                                    color: textGeryCl,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                value: businessType,
                                isExpanded: true,
                                items: [
                                  const DropdownMenuItem(
                                    value: "",
                                    child: Text(
                                      "Select Heights degree",
                                      style: TextStyle(
                                        fontFamily: regular,
                                        color: primaryClNew,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  ...degreeTypeList.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: const TextStyle(
                                          fontFamily: regular,
                                          color: primaryClNew,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ],
                                onChanged: (String? value) {
                                  setState(() {
                                    selectedDegree = value!;
                                    print(selectedDegree.toString());
                                  });
                                }),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Registration Number',
                            style: TextStyle(
                              color: textGeryCl,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontFamily: semiBold,
                              fontSize: 10,
                            ),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              counterText: "",
                              filled: true,
                              fillColor: Colors.transparent,
                              contentPadding: EdgeInsets.all(10),
                              hintText: "Enter Registration Number",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFB4B4B4),
                                fontFamily: regular,
                                fontSize: 12,
                              ),
                              errorStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.red,
                                fontFamily: regular,
                                fontSize: 12,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: borderNewCl, width: 1),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: borderNewCl, width: 1),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: borderNewCl, width: 1),
                              ),
                              disabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: borderNewCl, width: 1),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: borderNewCl, width: 1),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: borderNewCl, width: 1),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Registration Year',
                            style: TextStyle(
                              color: textGeryCl,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontFamily: semiBold,
                              fontSize: 10,
                            ),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              counterText: "",
                              filled: true,
                              fillColor: Colors.transparent,
                              contentPadding: EdgeInsets.all(10),
                              hintText: "Enter Registration Year",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFB4B4B4),
                                fontFamily: regular,
                                fontSize: 12,
                              ),
                              errorStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.red,
                                fontFamily: regular,
                                fontSize: 12,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: borderNewCl, width: 1),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: borderNewCl, width: 1),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: borderNewCl, width: 1),
                              ),
                              disabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: borderNewCl, width: 1),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: borderNewCl, width: 1),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: borderNewCl, width: 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                const SizedBox(height: 70),
              ],
            ),
          ),
          bottomSheet: contextCtrl.businessTypeList.isEmpty
              ? const SizedBox()
              : Container(
                  color: homeBgCl,
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 40,
                          width: 150,
                          child: MyButton(
                            onPressed: () {
                              widget.onPrevious();
                            },
                            color: primaryClNew,
                            child: const Text(
                              'Previous',
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
                        SizedBox(
                          height: 40,
                          width: 150,
                          child: MyButton(
                            onPressed: () {
                              if (widget.controller.employmentTittle.value == "Self Employe NON Professional") {
                                if (businessType == "") {
                                  final snackBar = SnackBar(
                                    backgroundColor: redCl,
                                    behavior: SnackBarBehavior.floating,
                                    dismissDirection: DismissDirection.up,
                                    content: const Text("Please Select your Business type"),
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
                                if (selectedDegree == "") {
                                  final snackBar = SnackBar(
                                    backgroundColor: redCl,
                                    behavior: SnackBarBehavior.floating,
                                    dismissDirection: DismissDirection.up,
                                    content: const Text("Please Select your Degree"),
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
                            color: primaryClNew,
                            child: const Text(
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
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
