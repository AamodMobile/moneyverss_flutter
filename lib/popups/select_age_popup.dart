import 'package:get/get.dart';
import 'package:wireframe/controllers/loan_apply_controller.dart';

import '../constants/constants.dart';
import '../recy_items/loan_apply_flow/item_age.dart';
import '../widget/my_button.dart';

class SelectAgePopup extends StatefulWidget {
  final List<String> age;
  final LoanApplyController controller;

  const SelectAgePopup(
      {super.key, required this.age, required this.controller});

  @override
  State<SelectAgePopup> createState() => _SelectAgePopupState();
}

class _SelectAgePopupState extends State<SelectAgePopup> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(

      width: MediaQuery.of(context).size.width,
      height: 400,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: widget.age.length,
              itemBuilder: (BuildContext context, int index) {
                return ItemAge(
                    age: widget.age[index], controller: widget.controller);
              },
            ),
          ),
          const SizedBox(height: 10,),
          SizedBox(
            height: 40,
            width: 150,
            child: MyButton(
              onPressed: () {
                Get.back();
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
    );
  }
}
