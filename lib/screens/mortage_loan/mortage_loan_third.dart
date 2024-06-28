import 'package:get/get.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/controllers/loan_apply_controller.dart';

class MortageLoan3 extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final String loanTypeId;
  final LoanApplyController controller;

  const MortageLoan3({
    super.key,
    required this.onNext,
    required this.loanTypeId,
    required this.controller, required this.onPrevious,
  });

  @override
  State<MortageLoan3> createState() => _MortageLoan3State();
}

class _MortageLoan3State extends State<MortageLoan3> {


  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: Get.find<LoanApplyController>(),
        initState: (state) {
          Get.find<LoanApplyController>().getYearsRangeGetList(widget.loanTypeId,widget.controller.employmentId.toString());
        },
        builder: (contextCtrl) {
        return Scaffold(
          backgroundColor: screenBgCl,
          appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width,60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 14,
                ),
                const Text(
                  'Loan tenure ',
                  style: TextStyle(
                    color: blueCl,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    fontFamily: semiBold,
                    fontSize: 14,
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
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Builder(
                  builder: (context) {
                    if (contextCtrl.loading) {
                      return const LoaderClass();
                    }
                    return GridView.builder(
                        shrinkWrap: true,
                        itemCount: contextCtrl.yearRangeList.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(mainAxisExtent: 54, childAspectRatio: 1, crossAxisSpacing: 20, mainAxisSpacing: 20, crossAxisCount: 2),
                        itemBuilder: (BuildContext context, int index) {
                          return
                            InkWell(
                              onTap: () {
                                setState(() {
                                  widget.controller.yearRangeId.value =  contextCtrl.yearRangeList[index].id.toString();
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
                                    color: widget.controller.yearRangeId.value == contextCtrl.yearRangeList[index].id.toString() ? primaryClNew : borderNewCl,
                                    width: 1,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        contextCtrl.yearRangeList[index].title.toString(),
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: draKText,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: widget.controller.yearRangeId.value == contextCtrl.yearRangeList[index].id.toString() ? semiBold : medium,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 18,
                                      width: 18,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border:widget.controller.yearRangeId.value == contextCtrl.yearRangeList[index].id.toString()
                                              ? Border.all(color: primaryClNew, width: 5)
                                              : Border.all(color: borderNewCl, width: 1)),
                                    ),
                                  ],
                                ),
                              ),
                            );
                        });
                  }
                ),
                const SizedBox(height: 70),
              ],
            ),
          ),

          bottomSheet:  Container(
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
                    if ( widget.controller.yearRangeId.value=="") {
                      final snackBar = SnackBar(
                        backgroundColor: redCl,
                        behavior: SnackBarBehavior.floating,
                        dismissDirection: DismissDirection.up,
                        content: const Text("Please Select with in day you want Loan"),
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
      }
    );
  }
}