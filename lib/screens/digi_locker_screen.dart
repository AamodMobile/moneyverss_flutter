import 'dart:io';

import 'package:get/get.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/controllers/dg_locker_controller.dart';
import 'package:wireframe/controllers/user_controller.dart';
import 'package:wireframe/screens/upload_docoment_screen.dart';

class DigitalLocker extends StatefulWidget {
  const DigitalLocker({super.key});

  @override
  State<DigitalLocker> createState() => _DigitalLockerState();
}

class _DigitalLockerState extends State<DigitalLocker> {
  UserController user = Get.put(UserController());
  DGLockerController controller = Get.put(DGLockerController());

  @override
  void initState() {
    user.userProfileGet();
    controller.panCard.value = File("");
    controller.aadhaarCard.value = File("");
    controller.drivingLicence.value = File("");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: Get.find<UserController>(),
        initState: (state) {
          Get.find<UserController>().documentsListGet();
        },
        builder: (contextCtr) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: homeBgCl,
              appBar: PreferredSize(
                preferredSize: Size(MediaQuery.of(context).size.width, 60),
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16,),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: whiteColor,),
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: 8, bottom: 8, right: 8),
                            child: Image.asset(
                              icBack,
                              height: 24,
                              width: 24,
                            ),
                          )),
                      SizedBox(width: 5,),
                      const Text(
                        "Digi Locker",
                        style: TextStyle(
                          color: draKText,
                          fontFamily: medium,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 14,
                    ),
                    /* Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 17),
                      child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: contextCtr.documentsList.length,
                          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            mainAxisExtent: 150,
                            childAspectRatio: (200 / 100),
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 4,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const UploadDocumentScreen(
                                              title: "Bank Details",
                                            )));
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: const [BoxShadow(offset: Offset(0, 1), blurRadius: 8, spreadRadius: 0, color: Color.fromRGBO(0, 0, 0, 0.15))]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            bankIc,
                                            height: 38,
                                            width: 41,
                                          ),
                                        ),
                                        Container(
                                          height: 43,
                                          width: 35,
                                          decoration: const BoxDecoration(color: Color(0xFFE6ECEE), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35))),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 9),
                                     Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Text(
                                        contextCtr.documentsList[index].title.toString(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: draKText,
                                          fontFamily: semiBold,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          fontStyle: FontStyle.normal,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 17),
                                    Image.asset(
                                      viewDocBt,
                                      width: MediaQuery.of(context).size.width,
                                      height: 36,
                                    ),
                                    const SizedBox(height: 11),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),*/
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 17),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => UploadDocumentScreen(title: "Bank Details", value: "bankDetails", image: user.user.value.bankDetails.toString())));
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: const [BoxShadow(offset: Offset(0, 1), blurRadius: 8, spreadRadius: 0, color: Color.fromRGBO(0, 0, 0, 0.15))]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            bankIc,
                                            height: 38,
                                            width: 41,
                                          ),
                                        ),
                                        Container(
                                          height: 43,
                                          width: 35,
                                          decoration: const BoxDecoration(color: Color(0xFFE6ECEE), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35))),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 9),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Text(
                                        "Bank Details",
                                        style: TextStyle(
                                          color: draKText,
                                          fontFamily: semiBold,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          fontStyle: FontStyle.normal,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 17),
                                    user.user.value.bankDetails != null && user.user.value.bankDetails!.isEmpty
                                        ? Image.asset(
                                            uploadBt,
                                            width: MediaQuery.of(context).size.width,
                                            height: 36,
                                          )
                                        : Image.asset(
                                            viewDocBt,
                                            width: MediaQuery.of(context).size.width,
                                            height: 36,
                                          ),
                                    const SizedBox(height: 11),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => UploadDocumentScreen(title: "Aadhaar Card", value: "aadhaarCard", image: user.user.value.aadharCard.toString())));
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: const [BoxShadow(offset: Offset(0, 1), blurRadius: 8, spreadRadius: 0, color: Color.fromRGBO(0, 0, 0, 0.15))]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            adharIc,
                                            height: 38,
                                            width: 41,
                                          ),
                                        ),
                                        Container(
                                          height: 43,
                                          width: 35,
                                          decoration: const BoxDecoration(color: Color(0xFFE6ECEE), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35))),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 9),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Text(
                                        "Aadhaar Card",
                                        style: TextStyle(
                                          color: draKText,
                                          fontFamily: semiBold,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          fontStyle: FontStyle.normal,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 17),
                                    user.user.value.aadharCard == ""
                                        ? Image.asset(
                                            uploadBt,
                                            width: MediaQuery.of(context).size.width,
                                            height: 36,
                                          )
                                        : Image.asset(
                                            viewDocBt,
                                            width: MediaQuery.of(context).size.width,
                                            height: 36,
                                          ),
                                    const SizedBox(height: 11),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 17),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => UploadDocumentScreen(title: "Pan Card", value: "panCard", image: user.user.value.panCard.toString())));
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: const [BoxShadow(offset: Offset(0, 1), blurRadius: 8, spreadRadius: 0, color: Color.fromRGBO(0, 0, 0, 0.15))]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            panIc,
                                            height: 38,
                                            width: 41,
                                          ),
                                        ),
                                        Container(
                                          height: 43,
                                          width: 35,
                                          decoration: const BoxDecoration(color: Color(0xFFE6ECEE), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35))),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 9),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Text(
                                        "PAN card",
                                        style: TextStyle(
                                          color: draKText,
                                          fontFamily: semiBold,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          fontStyle: FontStyle.normal,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 17),
                                    user.user.value.panCard == ""
                                        ? Image.asset(
                                            uploadBt,
                                            width: MediaQuery.of(context).size.width,
                                            height: 36,
                                          )
                                        : Image.asset(
                                            viewDocBt,
                                            width: MediaQuery.of(context).size.width,
                                            height: 36,
                                          ),
                                    const SizedBox(height: 11),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => UploadDocumentScreen(title: "Driving Licence", value: "drivingLicence", image: user.user.value.drivingLicence.toString())));
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: const [BoxShadow(offset: Offset(0, 1), blurRadius: 8, spreadRadius: 0, color: Color.fromRGBO(0, 0, 0, 0.15))]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            panIc,
                                            height: 38,
                                            width: 41,
                                          ),
                                        ),
                                        Container(
                                          height: 43,
                                          width: 35,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFFE6ECEE),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(35),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 9),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Text(
                                        "Driving Licence",
                                        style: TextStyle(
                                          color: draKText,
                                          fontFamily: semiBold,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          fontStyle: FontStyle.normal,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 17),
                                    user.user.value.drivingLicence == ""
                                        ? Image.asset(
                                            uploadBt,
                                            width: MediaQuery.of(context).size.width,
                                            height: 36,
                                          )
                                        : Image.asset(
                                            viewDocBt,
                                            width: MediaQuery.of(context).size.width,
                                            height: 36,
                                          ),
                                    const SizedBox(height: 11),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 17),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => UploadDocumentScreen(title: "Other Doc", value: "otherDocuments", image: user.user.value.otherDocuments.toString())));
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: const [BoxShadow(offset: Offset(0, 1), blurRadius: 8, spreadRadius: 0, color: Color.fromRGBO(0, 0, 0, 0.15))]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            docIc,
                                            height: 38,
                                            width: 41,
                                          ),
                                        ),
                                        Container(
                                          height: 43,
                                          width: 35,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFFE6ECEE),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(35),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 9),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Text(
                                        "Other Doc",
                                        style: TextStyle(
                                          color: draKText,
                                          fontFamily: semiBold,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          fontStyle: FontStyle.normal,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 17),
                                    user.user.value.otherDocuments != null && user.user.value.otherDocuments!.isEmpty
                                        ? Image.asset(
                                            uploadBt,
                                            width: MediaQuery.of(context).size.width,
                                            height: 36,
                                          )
                                        : Image.asset(
                                            viewDocBt,
                                            width: MediaQuery.of(context).size.width,
                                            height: 36,
                                          ),
                                    const SizedBox(height: 11),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Expanded(child: SizedBox())
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
