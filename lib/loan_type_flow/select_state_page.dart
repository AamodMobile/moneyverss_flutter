import 'package:get/get.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/controllers/loan_apply_controller.dart';
import 'package:wireframe/models/state_list_model.dart';
import 'package:wireframe/recy_items/loan_apply_flow/item_state.dart';
import 'package:wireframe/widget/my_button.dart';
import 'package:wireframe/widget/text_filled_widget.dart';

class SelectStatePage extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final String loanTypeId;
  final LoanApplyController controller;

  const SelectStatePage({Key? key, required this.onNext, required this.onPrevious, required this.controller, required this.loanTypeId}) : super(key: key);

  @override
  State<SelectStatePage> createState() => _SelectStatePageState();
}

class _SelectStatePageState extends State<SelectStatePage> {
  String query = "";
  TextEditingController queryNew = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<LoanApplyController>(),
      initState: (state) => {Get.find<LoanApplyController>().getStateList()},
      builder: (contextCtrl) {
        if (widget.controller.loading) {
          return const LoaderClass();
        }
        return Scaffold(
          backgroundColor: screenBgCl,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 14,
              ),
              const Text(
                "Select your current residence state",
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
                decoration: BoxDecoration(color: redCl, borderRadius: BorderRadius.circular(4)),
              ),
              const SizedBox(height: 10),
              Visibility(
                visible: widget.controller.stateList.isNotEmpty ? true : false,
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
                      decoration: BoxDecoration(color: primaryClNew, borderRadius: BorderRadius.circular(5)),
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
                  List<StateListModel> searchList = [];
                  for (var i = 0; i < widget.controller.stateList.length; i++) {
                    var product = widget.controller.stateList[i];
                    if (product.name.toString().trim().toLowerCase().contains(query.toLowerCase())) {
                      searchList.add(product);
                    }
                  }
                  if (searchList.isEmpty) {
                    return const SizedBox(
                      height: 140,
                      child: Center(
                        child: Text(
                          'No State Found',
                          style: TextStyle(color: primaryCl, fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ),
                    );
                  }
                  return Expanded(
                    child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: searchList.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(mainAxisExtent: 54, childAspectRatio: 1, crossAxisSpacing: 20, mainAxisSpacing: 20, crossAxisCount: 2),
                        itemBuilder: (BuildContext context, int index) {
                          return ItemState(stateListModel: searchList[index], controller: widget.controller);
                        }),
                  );
                }
                return Expanded(
                  child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: widget.controller.stateList.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(mainAxisExtent: 54, childAspectRatio: 1, crossAxisSpacing: 20, mainAxisSpacing: 20, crossAxisCount: 2),
                      itemBuilder: (BuildContext context, int index) {
                        return ItemState(stateListModel: contextCtrl.stateList[index], controller: widget.controller);
                      }),
                );
              }),
              const SizedBox(height:80),
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
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    if (widget.controller.stateId.value == "") {
                      final snackBar = SnackBar(
                        backgroundColor: redCl,
                        behavior: SnackBarBehavior.floating,
                        dismissDirection: DismissDirection.up,
                        content: const Text("Please select your State"),
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
