import 'package:get/get.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/controllers/loan_apply_controller.dart';

class GoldWeightScreen extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final String loanTypeId;
  final LoanApplyController controller;

  const GoldWeightScreen({super.key, required this.onNext, required this.onPrevious, required this.loanTypeId, required this.controller});

  @override
  State<GoldWeightScreen> createState() => _GoldWeightScreenState();
}

class _GoldWeightScreenState extends State<GoldWeightScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<LoanApplyController>(),
      initState: (state) {
        Get.find<LoanApplyController>().goldWeightListGet();
      },
      builder: (contextCtrl) {
        if (widget.controller.loading) {
          return const LoaderClass();
        }
        return Scaffold(
          backgroundColor: screenBgCl,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 14),
              const Text(
                "Select your gold weight",
                style: TextStyle(
                  color: blueCl,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600,
                  fontFamily: semiBold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 6),
              Container(
                height: 4,
                width: 65,
                decoration: BoxDecoration(color: primaryClNew, borderRadius: BorderRadius.circular(4)),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: widget.controller.goldWeightList.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 54,
                      childAspectRatio: 1,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                          onTap: () {
                            setState(() {
                              widget.controller.goldValue.value = widget.controller.goldWeightList[index].title.toString();
                            });
                          },
                          child: Obx(() => Container(
                              height: 40,
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(7),
                                border: Border.all(
                                  color: widget.controller.goldValue.value == widget.controller.goldWeightList[index].title.toString() ? primaryClNew : borderNewCl,
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Text(
                                      widget.controller.goldWeightList[index].title.toString(),
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: draKText,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: widget.controller.goldValue.value == widget.controller.goldWeightList[index].title.toString() ? semiBold : medium,
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
                                          border: widget.controller.goldValue.value == widget.controller.goldWeightList[index].title.toString()
                                              ? Border.all(color: primaryClNew, width: 5)
                                              : Border.all(color: borderNewCl, width: 1)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ));
                    }),
              ),
              const SizedBox(height: 70),
            ],
          ),
          bottomSheet: Container(
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
                widget.controller.goldWeightList.isEmpty ? const SizedBox() : const SizedBox(width: 10),
                widget.controller.goldWeightList.isEmpty
                    ? const SizedBox()
                    : GestureDetector(
                        onTap: () {
                          if (widget.controller.goldValue.value == "") {
                            final snackBar = SnackBar(
                              backgroundColor: redCl,
                              behavior: SnackBarBehavior.floating,
                              dismissDirection: DismissDirection.up,
                              content: const Text("Please select your gold weight"),
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
              ],
            ),
          ),
        );
      },
    );
  }
}
