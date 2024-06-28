import 'package:get/get.dart';
import 'package:wireframe/popups/select_age_popup.dart';

import '../constants/constants.dart';
import '../controllers/loan_apply_controller.dart';
import '../widget/my_button.dart';

class SelectAgePage extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final LoanApplyController controller;
  final String loanTypeId;

  const SelectAgePage({super.key, required this.onNext, required this.onPrevious, required this.controller, required this.loanTypeId});

  @override
  State<SelectAgePage> createState() => _SelectAgePageState();
}

class _SelectAgePageState extends State<SelectAgePage> {
  List<String> age = [];

  @override
  void initState() {
    super.initState();
    for (int i = 18; i <= 70; i++) {
      age.add(i.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeBgCl,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 14,
          ),
          const Text(
            ageTitle,
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
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 4,
                width: 65,
                decoration: BoxDecoration(color: primaryClNew, borderRadius: BorderRadius.circular(4)),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: InkWell(
                  onTap: () {
                    Get.defaultDialog(
                      title: ageTitle,
                      backgroundColor: Colors.white,
                      titleStyle: const TextStyle(color: primaryClNew, fontFamily: bold, fontSize: 16),
                      content: SelectAgePopup(
                        age: age,
                        controller: widget.controller,
                      ),
                    );
                  },
                  child: Container(
                      height: 50,
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
                      child: Obx(
                        () => Expanded(
                          child: Text(
                            widget.controller.age.value == "" ? "Select Age" : widget.controller.age.value,
                            style: const TextStyle(
                              color: secondaryCl,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontFamily: medium,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      )),
                ),
              ),
              const SizedBox(height: 20),
            ],
          )),
          SizedBox(
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
                      if (widget.controller.age.value == "") {
                        final snackBar = SnackBar(
                          backgroundColor: redCl,
                          behavior: SnackBarBehavior.floating,
                          dismissDirection: DismissDirection.up,
                          content: const Text("Please select your age"),
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
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
