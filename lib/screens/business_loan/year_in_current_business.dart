import 'package:get/get.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/controllers/loan_apply_controller.dart';

class YearInCurrentBusiness extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final String loanTypeId;
  final LoanApplyController controller;

  const YearInCurrentBusiness({super.key, required this.onNext, required this.onPrevious, required this.loanTypeId, required this.controller});

  @override
  State<YearInCurrentBusiness> createState() => _YearInCurrentBusinessState();
}

class _YearInCurrentBusinessState extends State<YearInCurrentBusiness> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<LoanApplyController>(),
      initState: (state) {
        Get.find<LoanApplyController>().businessYearsGetList(widget.loanTypeId);
      },
      builder: (contextCtrl) {
        return Scaffold(
          backgroundColor: screenBgCl,
          body: Builder(builder: (context) {
            if (contextCtrl.loading) {
              return const LoaderClass();
            }
            if (contextCtrl.businessYearList.isEmpty) {
              return const Center(
                  child: Text(
                'No  Data Found',
                style: TextStyle(
                  color: mainColor,
                  fontSize: 14,
                  fontFamily: regular,
                  fontWeight: FontWeight.w600,
                ),
              ));
            }
            return SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 14),
                Text(
                  widget.controller.employmentTittle.value == "Self Employed Non Professional" ? 'Year in current business' : 'Year in current profession',
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
                GridView.builder(
                    shrinkWrap: true,
                    itemCount: contextCtrl.businessYearList.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(mainAxisExtent: 54, childAspectRatio: 1, crossAxisSpacing: 20, mainAxisSpacing: 20, crossAxisCount: 2),
                    itemBuilder: (BuildContext context, int index) {
                      return
                        InkWell(
                          onTap: () {
                            setState(() {
                              widget.controller.selectedBusinessYear.value = contextCtrl.businessYearList[index].value.toString();
                            });
                          },
                          child: Container(
                            height: 54,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(
                                color:widget.controller.selectedBusinessYear.value == contextCtrl.businessYearList[index].value.toString() ? primaryClNew : borderNewCl,
                                width: 1,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(
                                    contextCtrl.businessYearList[index].title.toString(),
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: draKText,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      fontFamily:widget.controller.selectedBusinessYear.value == contextCtrl.businessYearList[index].value.toString() ? semiBold : medium,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 18,
                                  width: 18,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border:widget.controller.selectedBusinessYear.value == contextCtrl.businessYearList[index].value.toString()
                                          ? Border.all(color: primaryClNew, width: 5)
                                          : Border.all(color: borderNewCl, width: 1)),
                                ),
                              ],
                            ),
                          ),
                        );
                    }),
                const SizedBox(height: 70),
              ],
            ));
          }),
          bottomSheet:  widget.controller.businessYearList.isEmpty?const SizedBox(): Container(
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
                      border:Border.all(color: primaryClNew,width: 1),
                      color: Colors.white,),
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
                    if (widget.controller.selectedBusinessYear.value == "") {
                      final snackBar = SnackBar(
                        backgroundColor: redCl,
                        behavior: SnackBarBehavior.floating,
                        dismissDirection: DismissDirection.up,
                        content: Text(widget.controller.employmentTittle.value == "Self Employe NON Professional" ? 'Year in Current Business' : 'Year in Current Profession'),
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
