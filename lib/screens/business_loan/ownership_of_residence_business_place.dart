import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/controllers/loan_apply_controller.dart';
import 'package:wireframe/widget/my_button.dart';

class OwnershipOfResidenceBusinessPlace extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final String loanTypeId;
  final LoanApplyController controller;
  const OwnershipOfResidenceBusinessPlace({super.key, required this.onNext, required this.onPrevious, required this.loanTypeId, required this.controller});

  @override
  State<OwnershipOfResidenceBusinessPlace> createState() => _OwnershipOfResidenceBusinessPlaceState();
}

class _OwnershipOfResidenceBusinessPlaceState extends State<OwnershipOfResidenceBusinessPlace> {
  String selectedResidence ="";
  List<String> residenceTypeList = [
    "Owned By Self / spouse",
    "Owned By Parents",
    "Rented / Don’t Own a Property",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeBgCl,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 14),
            const Text(
              'Ownership of Residence / Business Place',
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
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: residenceTypeList.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                       selectedResidence = residenceTypeList[index];
                      });
                    },
                    child: Container(
                      height: 47,
                      margin: const EdgeInsets.only(bottom: 20),
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
                          Text(
                            residenceTypeList[index].toString(),
                            style: const TextStyle(
                              color: secondaryCl,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontFamily: medium,
                              fontSize: 14,
                            ),
                          ),
                          Container(
                            height: 18,
                            width: 18,
                            decoration: BoxDecoration(shape: BoxShape.circle, border: selectedResidence == residenceTypeList[index] ? Border.all(color: primaryClNew, width: 5) : Border.all(color: borderNewCl, width: 1)),
                          )
                        ],
                      ),
                    ),
                  );
                }),
            const SizedBox(height: 70),
          ],
        ),
      ),
      bottomSheet: residenceTypeList.isEmpty
          ? const SizedBox()
          : Container(
        color: homeBgCl,
        width: MediaQuery.of(context).size.width,
        height: 60,
        child: SizedBox(
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
                    if ( selectedResidence == "") {
                      final snackBar = SnackBar(
                        backgroundColor: redCl,
                        behavior: SnackBarBehavior.floating,
                        dismissDirection: DismissDirection.up,
                        content: const Text("Please Select Residence Type"),
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
      ),
    );
  }
}
