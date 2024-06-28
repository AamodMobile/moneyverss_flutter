import 'package:get/get.dart';
import 'package:wireframe/controllers/loan_apply_controller.dart';
import 'package:wireframe/models/city_list_model.dart';
import 'package:wireframe/constants/constants.dart';

class ItemCity extends StatefulWidget {
  final LoanApplyController controller;
  final CityData cityData;

  const ItemCity({super.key, required this.controller, required this.cityData});

  @override
  State<ItemCity> createState() => _ItemCityState();
}

class _ItemCityState extends State<ItemCity> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.controller.cityId.value = widget.cityData.cityCode.toString();
        });
      },
      child: Container(
        height: 62,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                widget.cityData.name.toString(),
                maxLines: 1,
                style: const TextStyle(
                  color: secondaryCl,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                  fontFamily: medium,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Obx(
              () => Container(
                height: 18,
                width: 18,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: widget.controller.cityId.value == widget.cityData.cityCode.toString() ? Border.all(color: primaryClNew, width: 5) : Border.all(color: borderNewCl, width: 1),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
