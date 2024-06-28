import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:get/get.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/controllers/loan_apply_controller.dart';
import 'package:wireframe/models/product_type_model.dart';
import 'package:wireframe/models/vehicle_company_model.dart';
import 'package:wireframe/models/vehicle_model_list_model.dart';
import 'package:wireframe/models/vehicle_veriant_model.dart';
import 'package:wireframe/widget/text_filled_widget.dart';

class VehicleDetailsScreen extends StatefulWidget {
  final VoidCallback onNext;
  final String loanTypeId;
  final LoanApplyController controller;
  final VoidCallback onPrevious;

  const VehicleDetailsScreen({super.key, required this.onNext, required this.loanTypeId, required this.controller, required this.onPrevious});

  @override
  State<VehicleDetailsScreen> createState() => _VehicleDetailsScreenState();
}

class _VehicleDetailsScreenState extends State<VehicleDetailsScreen> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.controller.vehicleCompanyModel = null;
    widget.controller.vehicleMModel = null;
    widget.controller.vehicleVariantModel = null;
    widget.controller.productTypeModel = null;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<LoanApplyController>(),
      initState: (state) {
        Get.find<LoanApplyController>().vehicleCompanyGet();
      },
      builder: (contextCtrl) {
        if (widget.controller.loading) {
          return const LoaderClass();
        }
        return Scaffold(
          backgroundColor: screenBgCl,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 14),
                const Text(
                  'Vehicle details',
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
                Container(
                  height: 4,
                  width: 65,
                  decoration: BoxDecoration(color: primaryClNew, borderRadius: BorderRadius.circular(4)),
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Vehicle Company",
                    style: TextStyle(
                      color: textColorSec,
                      fontFamily: medium,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Obx(
                  () => DropdownButtonHideUnderline(
                    child: DropdownButton2<VehicleCompanyModel?>(
                      dropdownSearchData: DropdownSearchData(
                        searchInnerWidget: Container(
                          padding: const EdgeInsets.all(4),
                          child: MyTextFormField(
                            controller: textEditingController,
                            hint: 'Search Vehicle Company',
                            obscureText: false,
                            readOnly: false,
                            border: borderNewCl,
                            maxLines: 1,
                            fillColor: Colors.transparent,
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(searchIc,height: 12,width: 12,),
                            ),
                          ),
                        ),
                        searchController: textEditingController,
                        searchInnerWidgetHeight: 30,
                        searchMatchFn: (item, searchValue) {
                          return item.value!.title!.toString().contains(searchValue.capitalizeFirst!);
                        },
                      ),
                      onMenuStateChange: (isOpen) {
                        if (!isOpen) {
                          textEditingController.clear();
                        }
                      },
                      buttonStyleData: ButtonStyleData(
                        height: 45,
                        width: double.infinity,
                        padding: const EdgeInsets.only(left: 14, right: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: const Color.fromRGBO(85, 153, 255, 0.43),
                          ),
                          color: Colors.transparent,
                        ),
                      ),
                      iconStyleData: const IconStyleData(
                        icon: ImageIcon(
                          AssetImage(arrowDropDown),
                          size: 12,
                        ),
                        iconSize: 14,
                        iconEnabledColor: Colors.black,
                        iconDisabledColor: Colors.grey,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        maxHeight: 200,
                        width: MediaQuery.of(context).size.width * 0.90,
                        useSafeArea: true,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white,
                        ),
                        scrollbarTheme: ScrollbarThemeData(
                          radius: const Radius.circular(40),
                          thickness: MaterialStateProperty.all(6),
                          thumbVisibility: MaterialStateProperty.all(true),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 45,
                        padding: EdgeInsets.only(left: 14, right: 14),
                      ),
                      isDense: true,
                      value: widget.controller.vehicleCompanyModel,
                      hint: const Text(
                        "Select Vehicle Company",
                        style: TextStyle(fontWeight: FontWeight.w400, color: Color.fromRGBO(166, 166, 166, 0.7), fontFamily: medium, fontSize: 12, fontStyle: FontStyle.normal),
                      ),
                      style: const TextStyle(color: Colors.white60, fontSize: 13, fontWeight: FontWeight.bold),
                      isExpanded: true,
                      items: widget.controller.vehicleCompanyList
                          .map((s) => DropdownMenuItem<VehicleCompanyModel>(
                                value: s,
                                child: Text(
                                  " ${s.title}",
                                  style: const TextStyle(
                                    fontFamily: regular,
                                    color: draKText,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ))
                          .toList(),
                      onChanged: (VehicleCompanyModel? value) {
                        if (value != null) {
                          setState(() {
                            widget.controller.vehicleCompanyModel = value;
                            widget.controller.vehicleId.value = value.id.toString();
                            widget.controller.vehicleMModel = null;
                            contextCtrl.vehicleModelGet(widget.controller.vehicleId.value);
                          });
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Vehicle Model",
                    style: TextStyle(
                      color: textColorSec,
                      fontFamily: medium,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Obx(
                  () => DropdownButtonHideUnderline(
                    child: DropdownButton2<VehicleModelModel?>(
                      dropdownSearchData: DropdownSearchData(
                        searchInnerWidget: Container(
                          padding: const EdgeInsets.all(4),
                          child: MyTextFormField(
                            controller: textEditingController,
                            hint: 'Search Vehicle Company',
                            obscureText: false,
                            readOnly: false,
                            border: borderNewCl,
                            maxLines: 1,
                            fillColor: Colors.transparent,
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(searchIc,height: 12,width: 12,),
                            ),
                          ),
                        ),
                        searchController: textEditingController,
                        searchInnerWidgetHeight: 30,
                        searchMatchFn: (item, searchValue) {
                          return item.value!.title!.toString().contains(searchValue.capitalizeFirst!);
                        },
                      ),
                      onMenuStateChange: (isOpen) {
                        if (!isOpen) {
                          textEditingController.clear();
                        }
                      },
                      buttonStyleData: ButtonStyleData(
                        height: 45,
                        width: double.infinity,
                        padding: const EdgeInsets.only(left: 14, right: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: const Color.fromRGBO(85, 153, 255, 0.43),
                          ),
                          color: Colors.transparent,
                        ),
                      ),
                      iconStyleData: const IconStyleData(
                        icon: ImageIcon(
                          AssetImage(arrowDropDown),
                          size: 12,
                        ),
                        iconSize: 14,
                        iconEnabledColor: Colors.black,
                        iconDisabledColor: Colors.grey,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        maxHeight: 200,
                        width: MediaQuery.of(context).size.width * 0.90,
                        useSafeArea: true,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white,
                        ),
                        scrollbarTheme: ScrollbarThemeData(
                          radius: const Radius.circular(40),
                          thickness: MaterialStateProperty.all(6),
                          thumbVisibility: MaterialStateProperty.all(true),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 45,
                        padding: EdgeInsets.only(left: 14, right: 14),
                      ),
                      isDense: true,
                      value: widget.controller.vehicleMModel,
                      hint: const Text(
                        "Select Vehicle Model",
                        style: TextStyle(fontWeight: FontWeight.w400, color: Color.fromRGBO(166, 166, 166, 0.7), fontFamily: medium, fontSize: 12, fontStyle: FontStyle.normal),
                      ),
                      style: const TextStyle(color: Colors.white60, fontSize: 13, fontWeight: FontWeight.bold),
                      isExpanded: true,
                      items: widget.controller.vehicleModelList
                          .map((s) => DropdownMenuItem<VehicleModelModel>(
                                value: s,
                                child: Text(
                                  " ${s.title}",
                                  style: const TextStyle(
                                    fontFamily: regular,
                                    color: draKText,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ))
                          .toList(),
                      onChanged: (VehicleModelModel? value) {
                        if (value != null) {
                          setState(() {
                            widget.controller.vehicleMModel = value;
                            widget.controller.modelId.value = value.id.toString();
                            widget.controller.vehicleVariantModel = null;
                            contextCtrl.vehicleVariantGet(widget.controller.vehicleId.value, widget.controller.modelId.value);
                          });
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Vehicle Variant",
                    style: TextStyle(
                      color: textColorSec,
                      fontFamily: medium,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Obx(
                  () => DropdownButtonHideUnderline(
                    child: DropdownButton2<VehicleVariantModel?>(
                      dropdownSearchData: DropdownSearchData(
                        searchInnerWidget: Container(
                          padding: const EdgeInsets.all(4),
                          child: MyTextFormField(
                            controller: textEditingController,
                            hint: 'Search Vehicle Company',
                            obscureText: false,
                            readOnly: false,
                            border: borderNewCl,
                            maxLines: 1,
                            fillColor: Colors.transparent,
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(searchIc,height: 12,width: 12,),
                            ),
                          ),
                        ),
                        searchController: textEditingController,
                        searchInnerWidgetHeight: 30,
                        searchMatchFn: (item, searchValue) {
                          return item.value!.title!.toString().contains(searchValue.capitalizeFirst!);
                        },
                      ),
                      onMenuStateChange: (isOpen) {
                        if (!isOpen) {
                          textEditingController.clear();
                        }
                      },
                      buttonStyleData: ButtonStyleData(
                        height: 45,
                        width: double.infinity,
                        padding: const EdgeInsets.only(left: 14, right: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: const Color.fromRGBO(85, 153, 255, 0.43),
                          ),
                          color: Colors.transparent,
                        ),
                      ),
                      iconStyleData: const IconStyleData(
                        icon: ImageIcon(
                          AssetImage(arrowDropDown),
                          size: 12,
                        ),
                        iconSize: 14,
                        iconEnabledColor: Colors.black,
                        iconDisabledColor: Colors.grey,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        maxHeight: 200,
                        width: MediaQuery.of(context).size.width * 0.90,
                        useSafeArea: true,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white,
                        ),
                        scrollbarTheme: ScrollbarThemeData(
                          radius: const Radius.circular(40),
                          thickness: MaterialStateProperty.all(6),
                          thumbVisibility: MaterialStateProperty.all(true),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 45,
                        padding: EdgeInsets.only(left: 14, right: 14),
                      ),
                      isDense: true,
                      value: widget.controller.vehicleVariantModel,
                      hint: const Text(
                        "Select Vehicle Model",
                        style: TextStyle(fontWeight: FontWeight.w400, color: Color.fromRGBO(166, 166, 166, 0.7), fontFamily: medium, fontSize: 12, fontStyle: FontStyle.normal),
                      ),
                      style: const TextStyle(color: Colors.white60, fontSize: 13, fontWeight: FontWeight.bold),
                      isExpanded: true,
                      items: widget.controller.vehicleVariantList
                          .map((s) => DropdownMenuItem<VehicleVariantModel>(
                                value: s,
                                child: Text(
                                  " ${s.title}",
                                  style: const TextStyle(
                                    fontFamily: regular,
                                    color: draKText,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ))
                          .toList(),
                      onChanged: (VehicleVariantModel? value) {
                        if (value != null) {
                          setState(() {
                            widget.controller.vehicleVariantModel = value;
                            widget.controller.variantId.value = value.id.toString();
                            widget.controller.productTypeGet();
                          });
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Product Type",
                    style: TextStyle(
                      color: textColorSec,
                      fontFamily: medium,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Obx(
                  () => DropdownButtonHideUnderline(
                    child: DropdownButton2<ProductTypeModel?>(
                      buttonStyleData: ButtonStyleData(
                        height: 45,
                        width: double.infinity,
                        padding: const EdgeInsets.only(left: 14, right: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: const Color.fromRGBO(85, 153, 255, 0.43),
                          ),
                          color: Colors.transparent,
                        ),
                      ),
                      iconStyleData: const IconStyleData(
                        icon: ImageIcon(
                          AssetImage(arrowDropDown),
                          size: 12,
                        ),
                        iconSize: 14,
                        iconEnabledColor: Colors.black,
                        iconDisabledColor: Colors.grey,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        maxHeight: 200,
                        width: MediaQuery.of(context).size.width * 0.90,
                        useSafeArea: true,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white,
                        ),
                        scrollbarTheme: ScrollbarThemeData(
                          radius: const Radius.circular(40),
                          thickness: MaterialStateProperty.all(6),
                          thumbVisibility: MaterialStateProperty.all(true),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 45,
                        padding: EdgeInsets.only(left: 14, right: 14),
                      ),
                      isDense: true,
                      value: widget.controller.productTypeModel,
                      hint: const Text(
                        "Select Vehicle Model",
                        style: TextStyle(fontWeight: FontWeight.w400, color: Color.fromRGBO(166, 166, 166, 0.7), fontFamily: medium, fontSize: 12, fontStyle: FontStyle.normal),
                      ),
                      style: const TextStyle(color: Colors.white60, fontSize: 13, fontWeight: FontWeight.bold),
                      isExpanded: true,
                      items: widget.controller.productTypeList
                          .map((s) => DropdownMenuItem<ProductTypeModel>(
                                value: s,
                                child: Text(
                                  " ${s.title}",
                                  style: const TextStyle(
                                    fontFamily: regular,
                                    color: draKText,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ))
                          .toList(),
                      onChanged: (ProductTypeModel? value) {
                        if (value != null) {
                          setState(() {
                            widget.controller.productTypeModel = value;
                            widget.controller.productTypeId.value = value.id.toString();
                          });
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Year of Manufacture",
                    style: TextStyle(
                      color: textColorSec,
                      fontFamily: medium,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                MyTextFormField(
                  hint: 'Year of Manufacture',
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  maxLength: 4,
                  readOnly: false,
                  border: borderNewCl,
                  counterText: "",
                  controller: widget.controller.yearOfManufacture,
                  maxLines: 1,
                  fillColor: Colors.transparent,
                ),
                const SizedBox(height: 70),
              ],
            ),
          ),
          bottomSheet: Container(
            color: screenBgCl,
            width: MediaQuery.of(context).size.width,
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GestureDetector(
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
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (widget.controller.vehicleId.value == "") {
                        final snackBar = SnackBar(
                          backgroundColor: redCl,
                          behavior: SnackBarBehavior.floating,
                          dismissDirection: DismissDirection.up,
                          content: const Text("Please Select vehicle Type"),
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
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
