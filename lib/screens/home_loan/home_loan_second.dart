import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/controllers/loan_apply_controller.dart';
import 'package:wireframe/models/city_list_model.dart';
import 'package:wireframe/widget/text_filled_widget.dart';

class HomeLoan2 extends StatefulWidget {
  final VoidCallback onNext;
  final String loanTypeId;
  final LoanApplyController controller;
  final VoidCallback onPrevious;

  const HomeLoan2(
      {super.key,
      required this.onNext,
      required this.loanTypeId,
      required this.controller,
      required this.onPrevious});

  @override
  State<HomeLoan2> createState() => _HomeLoan2State();
}

class _HomeLoan2State extends State<HomeLoan2> {
  String query = "";
  TextEditingController queryNew = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: Get.find<LoanApplyController>(),
        initState: (state) {
          Get.find<LoanApplyController>()
              .getCityList(widget.controller.stateId.value);
        },
        builder: (contextCtrl) {
          return Scaffold(
            backgroundColor: screenBgCl,
            appBar: PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width, 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 14,
                  ),
                  const Text(
                    'Select your residence city',
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
                    decoration: BoxDecoration(
                        color: primaryClNew,
                        borderRadius: BorderRadius.circular(4)),
                  ),
                ],
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Builder(builder: (context) {
                      if (contextCtrl.loading) {
                        return   const LoaderClass();

                      }
                      if (contextCtrl.cityList.isEmpty) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height - 200,
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'No Data',
                                style: TextStyle(
                                  color: mainColor,
                                  fontSize: 14,
                                  fontFamily: regular,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      return Column(
                        children: [
                          const SizedBox(height: 10),
                          Visibility(
                            visible: widget.controller.cityList.isNotEmpty
                                ? true
                                : false,
                            child: MyTextFormField(
                              fillColor: Colors.white,
                              controller: queryNew,
                              onChanged: (value) {
                                query = value;
                                setState(() {});
                              },
                              suffixIcon: InkWell(
                                onTap: () {
                                  query = queryNew.text;
                                  setState(() {});
                                },
                                child: Container(
                                  width: 30.0,
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      color: primaryClNew,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                      child: Image.asset(
                                    searchIc,
                                    color: Colors.white,
                                  )),
                                ),
                              ),
                              readOnly: false,
                              hint: 'Search',
                              obscureText: false,
                              border: primaryCl,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Builder(builder: (context) {
                            if (query.trim().isNotEmpty) {
                              List<CityData> searchList = [];
                              for (var i = 0;
                                  i < widget.controller.cityList.length;
                                  i++) {
                                var product = widget.controller.cityList[i];
                                if (product.name
                                    .toString()
                                    .trim()
                                    .toLowerCase()
                                    .contains(query.toLowerCase())) {
                                  searchList.add(product);
                                }
                              }
                              if (searchList.isEmpty) {
                                return const SizedBox(
                                  height: 140,
                                  child: Center(
                                    child: Text(
                                      'No City Found',
                                      style: TextStyle(
                                          color: primaryCl,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                );
                              }
                              return GridView.builder(
                                  shrinkWrap: true,
                                  physics:
                                      const NeverScrollableScrollPhysics(),
                                  itemCount: searchList.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          mainAxisExtent: 54,
                                          childAspectRatio: 1,
                                          crossAxisSpacing: 20,
                                          mainAxisSpacing: 20,
                                          crossAxisCount: 2),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return  InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.controller.propertyLocation
                                              .value =
                                              searchList[index].cityCode
                                                  .toString();});
                                      },
                                      child:  Container(
                                        height: 54,
                                        padding: const EdgeInsets.symmetric(horizontal: 8),
                                        width: MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          color: whiteColor,
                                          borderRadius: BorderRadius.circular(7),
                                          border: Border.all(
                                            color: widget
                                                .controller
                                                .propertyLocation
                                                .value ==
                                                searchList[index]
                                                    .cityCode
                                                    .toString()? primaryClNew : borderNewCl,
                                            width: 1,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                searchList[index].name
                                                    .toString(),
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  color: draKText,
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: widget
                                                      .controller
                                                      .propertyLocation
                                                      .value ==
                                                      searchList[index]
                                                          .cityCode
                                                          .toString()? semiBold : medium,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 18,
                                              width: 18,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border:
                                                  widget
                                                      .controller
                                                      .propertyLocation
                                                      .value ==
                                                      searchList[index]
                                                          .cityCode
                                                          .toString()? Border.all(color: primaryClNew, width: 5) : Border.all(color: borderNewCl, width: 1)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );

                                  });
                            }
                            return GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: widget.controller.cityList.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        mainAxisExtent: 54,
                                        childAspectRatio: 1,
                                        crossAxisSpacing: 20,
                                        mainAxisSpacing: 20,
                                        crossAxisCount: 2),
                                itemBuilder:
                                    (BuildContext context, int index) {
                                  return  InkWell(
                                    onTap: () {
                                      setState(() {
                                        widget.controller.propertyLocation
                                            .value =
                                            widget.controller.cityList[index]
                                                .cityCode
                                                .toString();});
                                    },
                                    child:  Container(
                                      height: 54,
                                      padding: const EdgeInsets.symmetric(horizontal: 8),
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: whiteColor,
                                        borderRadius: BorderRadius.circular(7),
                                        border: Border.all(
                                          color: widget
                                              .controller
                                              .propertyLocation
                                              .value ==
                                              widget
                                                  .controller
                                                  .cityList[index]
                                                  .cityCode
                                                  .toString()? primaryClNew : borderNewCl,
                                          width: 1,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              widget.controller
                                                  .cityList[index].name
                                                  .toString(),
                                              maxLines: 1,
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                color: draKText,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: widget
                                                    .controller
                                                    .propertyLocation
                                                    .value ==
                                                    widget
                                                        .controller
                                                        .cityList[index]
                                                        .cityCode
                                                        .toString()? semiBold : medium,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 18,
                                            width: 18,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border:
                                                widget
                                                    .controller
                                                    .propertyLocation
                                                    .value ==
                                                    widget
                                                        .controller
                                                        .cityList[index]
                                                        .cityCode
                                                        .toString()? Border.all(color: primaryClNew, width: 5) : Border.all(color: borderNewCl, width: 1)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );

                                });
                          }),
                          const SizedBox(height: 70),
                        ],
                      );
                    }),
                  ]),
            ),
            bottomSheet:widget.controller.cityList.isEmpty
                ? const SizedBox(): Container(
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
                      if (widget.controller.propertyLocation.value ==
                          "") {
                        final snackBar = SnackBar(
                          backgroundColor: redCl,
                          behavior: SnackBarBehavior.floating,
                          dismissDirection: DismissDirection.up,
                          content: const Text(
                              "Please Select property location"),
                          action: SnackBarAction(
                            label: '',
                            onPressed: () {},
                          ),
                        );
                        ScaffoldMessenger.of(context)
                            .showSnackBar(snackBar);
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
                ],
              ),
            ),
          );
        });
  }
}
