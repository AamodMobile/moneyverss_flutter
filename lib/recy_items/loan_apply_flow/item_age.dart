import 'package:get/get.dart';

import '../../constants/constants.dart';
import '../../controllers/loan_apply_controller.dart';

class ItemAge extends StatefulWidget {
  final String age;
  final LoanApplyController controller;
  const ItemAge({super.key, required this.age, required this.controller});

  @override
  State<ItemAge> createState() => _ItemAgeState();
}

class _ItemAgeState extends State<ItemAge> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.controller.age.value = widget.age.toString();
        });
      },
      child: Container(
        height: 50,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 5),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
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
            Text(
              widget.age.toString(),
              style: const TextStyle(
                color: secondaryCl,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                fontFamily: medium,
                fontSize: 14,
              ),
            ),

            Obx(()=>
              Container(
                height: 18,
                width: 18,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: widget.controller.age.value == widget.age.toString()
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
