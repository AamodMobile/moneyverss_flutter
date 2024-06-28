import 'package:get/get.dart';
import 'package:wireframe/controllers/loan_apply_controller.dart';
import 'package:wireframe/models/city_list_model.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/models/state_list_model.dart';

class ItemState extends StatefulWidget {
  final LoanApplyController controller;
  final StateListModel stateListModel;

  const ItemState({super.key, required this.controller, required this.stateListModel});

  @override
  State<ItemState> createState() => _ItemStateState();
}

class _ItemStateState extends State<ItemState> {
  @override
  Widget build(BuildContext context) {
    return
      InkWell(
          onTap: () {
            setState(() {
              widget.controller.stateId.value = widget.stateListModel.stateId.toString();

            });
          },
          child: Obx(
                () => Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(7),
                border: Border.all(
                  color:widget.controller.stateId.value == widget.stateListModel.stateId.toString() ? primaryClNew : borderNewCl,
                  width: 1,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      widget.stateListModel.name.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: draKText,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        fontFamily: widget.controller.stateId.value == widget.stateListModel.stateId.toString() ? semiBold : medium,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Obx(
                        () => Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                          widget.controller.stateId.value == widget.stateListModel.stateId.toString()? Border.all(color: primaryClNew, width: 5) : Border.all(color: borderNewCl, width: 1)),
                    ),
                  )
                ],
              ),
            ),
          ));
  }
}
