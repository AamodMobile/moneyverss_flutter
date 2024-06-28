import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/controllers/dg_locker_controller.dart';
import 'package:wireframe/controllers/user_controller.dart';
import 'package:wireframe/service/api_logs.dart';
import 'package:wireframe/utils/WhiteSpacerAfter4.dart';
import 'package:wireframe/widget/text_filled_widget.dart';
import 'package:wireframe/widget/upper_case_text_formatter.dart';

class UploadDocumentScreen extends StatefulWidget {
  final String title;
  final String value;
  final String image;

  const UploadDocumentScreen({super.key, required this.title, required this.value, required this.image});

  @override
  State<UploadDocumentScreen> createState() => _UploadDocumentScreenState();
}

class _UploadDocumentScreenState extends State<UploadDocumentScreen> {
  File? pickedImageFile;
  File? image1;
  final ImagePicker picker = ImagePicker();
  UserController user = Get.put(UserController());
  DGLockerController controller = Get.put(DGLockerController());
  final formKeyBank = GlobalKey<FormState>();
  final formKeyAadharPanDriving = GlobalKey<FormState>();

  @override
  void initState() {
    controller.otherDocList.clear();
    user.userProfileGet();
    controller.bankDetails.clear();
    controller.bankDetails.add("upload");
    controller.panCard.value = File("");
    controller.aadhaarCard.value = File("");
    controller.drivingLicence.value = File("");
    controller.otherDocuments.clear();
    controller.aadhaarCardBack.value = File("");
    if (widget.title == "Bank Details") {
      if (user.user.value.bankDetails != null && user.user.value.bankDetails!.isNotEmpty) {
        for (int i = 0; i < user.user.value.bankDetails!.length; i++) {
          controller.bankDetails.add(user.user.value.bankDetails![i]);
          controller.updateImages.add(user.user.value.bankDetails![i]);
        }
      }
      controller.bankAcNo.text = user.user.value.accountNo ?? "";
      controller.bankName.text = user.user.value.bankName ?? "";
      controller.ifscCode.text = user.user.value.ifscNo ?? "";
    }

    controller.aadhaarNo.text = user.user.value.aadharNo ?? "";
    controller.panCardNo.text = user.user.value.panNo ?? "";
    controller.drivingNo.text = user.user.value.licenceNo ?? "";
    controller.addOtherDocList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: homeBgCl,
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 60),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: whiteColor,
            ),
            child: Row(
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8),
                      child: Image.asset(
                        icBack,
                        height: 24,
                        width: 24,
                      ),
                    )),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  widget.title.toString(),
                  style: const TextStyle(
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: widget.title == "Bank Details"
              ? Form(
                  key: formKeyBank,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 14,
                      ),
                      const Text(
                        "Bank Account No",
                        style: TextStyle(
                          color: secondaryCl,
                          fontFamily: medium,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 6),
                      MyTextFormField(
                        hint: "Bank Account No",
                        obscureText: false,
                        controller: controller.bankAcNo,
                        readOnly: false,
                        border: primaryClNew,
                        keyboardType: TextInputType.number,
                        fillColor: Colors.white,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Bank Name",
                        style: TextStyle(
                          color: secondaryCl,
                          fontFamily: medium,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 6),
                      MyTextFormField(
                        hint: "Bank Name",
                        obscureText: false,
                        controller: controller.bankName,
                        readOnly: false,
                        border: primaryClNew,
                        fillColor: Colors.white,
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "IFSC Code",
                        style: TextStyle(
                          color: secondaryCl,
                          fontFamily: medium,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 6),
                      MyTextFormField(
                        hint: "IFSC Code",
                        obscureText: false,
                        controller: controller.ifscCode,
                        readOnly: false,
                        border: primaryClNew,
                        fillColor: Colors.white,
                        keyboardType: TextInputType.text,
                        validator: (v) {
                          if (!controller.validateIFSC(v!)) {
                            return "Enter Valid IFSC Code";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Bank Doc Image",
                        style: TextStyle(
                          color: secondaryCl,
                          fontFamily: medium,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 97,
                        width: MediaQuery.of(context).size.width,
                        child: Obx(
                          () => Align(
                            alignment: Alignment.centerLeft,
                            child: ListView.builder(
                              clipBehavior: Clip.none,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: controller.bankDetails.length,
                              reverse: true,
                              itemBuilder: (BuildContext context, int index) {
                                if (controller.bankDetails[index] == "upload") {
                                  return GestureDetector(
                                    onTap: () {
                                      if (controller.bankDetails[index] == "upload") {
                                        controller.selectImages().then((value) {
                                          setState(() {});
                                        });
                                      }
                                    },
                                    child: Image.asset(
                                      uploadImg,
                                      height: 97,
                                      width: 90,
                                      fit: BoxFit.fill,
                                    ),
                                  );
                                } else {
                                  if (GetUtils.isURL(Uri.parse(controller.bankDetails[index].toString()).toString())) {
                                    return Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(left: 9, right: 9),
                                          height: 97,
                                          width: 90,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(7),
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(7),
                                            child: CachedNetworkImage(
                                              fit: BoxFit.cover,
                                              height: 66,
                                              width: 90,
                                              imageUrl: controller.bankDetails[index],
                                              placeholder: (a, b) => const Center(
                                                child: CircularProgressIndicator(
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                            top: -2,
                                            right: 10,
                                            child: GestureDetector(
                                              onTap: () {
                                                controller.remoBikeImageFromDb(index).then((value) {
                                                  setState(() {});
                                                });
                                              },
                                              child: Container(
                                                  decoration: BoxDecoration(color: const Color(0xFFD01111).withOpacity(0.72), shape: BoxShape.circle),
                                                  child: Image.asset(
                                                    deletePhotoIc,
                                                    height: 25,
                                                    width: 25,
                                                    fit: BoxFit.cover,
                                                  )),
                                            ))
                                      ],
                                    );
                                  } else {
                                    return Stack(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(left: 9, right: 9),
                                          height: 66,
                                          width: 90,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(7),
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(7),
                                            child: Image.file(File(controller.bankDetails[index].path), fit: BoxFit.cover),
                                          ),
                                        ),
                                        Positioned(
                                            top: 4,
                                            right: 4,
                                            child: GestureDetector(
                                              onTap: () {
                                                controller.removeImages(index).then((value) {
                                                  setState(() {});
                                                });
                                              },
                                              child: Container(
                                                  decoration: BoxDecoration(color: const Color(0xFFD01111).withOpacity(0.72), shape: BoxShape.circle),
                                                  child: Image.asset(
                                                    deletePhotoIc,
                                                    height: 25,
                                                    width: 25,
                                                    fit: BoxFit.cover,
                                                  )),
                                            ))
                                      ],
                                    );
                                  }
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          if (formKeyBank.currentState!.validate()) {
                            controller.uploadCustomerDocs();
                          }
                        },
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                gradient: const LinearGradient(colors: [
                                  Color(0xFF189DFF),
                                  Color(0xFF0070C1),
                                ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
                            width: 200,
                            height: 46,
                            child: const Center(
                              child: Text(
                                "Submit",
                                style: TextStyle(
                                  color: whiteColor,
                                  fontFamily: medium,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                )
              : widget.title == "Other Doc"
                  ? SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...controller.otherDocList.map((e) {
                            var ind = e.index;
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 14,
                                ),
                                const Text(
                                  "Doc Name",
                                  style: TextStyle(
                                    color: secondaryCl,
                                    fontFamily: medium,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                MyTextFormField(
                                  hint: "Doc Name",
                                  obscureText: false,
                                  readOnly: false,
                                  border: primaryClNew,
                                  fillColor: Colors.white,
                                  onChanged: (v) {
                                    setState(() {
                                      e.name = v;
                                    });
                                  },
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  "Doc No",
                                  style: TextStyle(
                                    color: secondaryCl,
                                    fontFamily: medium,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                MyTextFormField(
                                  hint: "Doc No",
                                  obscureText: false,
                                  readOnly: false,
                                  border: primaryClNew,
                                  fillColor: Colors.white,
                                  onChanged: (v) {
                                    setState(() {
                                      e.number = v;
                                    });
                                  },
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  "Doc Image",
                                  style: TextStyle(
                                    color: secondaryCl,
                                    fontFamily: medium,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  height: 195,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      galleryBottomSheet(context, widget.value);
                                    },
                                    child: controller.otherDocuments.isNotEmpty && controller.otherDocuments.length > ind
                                        ? ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: Image.file(
                                              File(controller.otherDocuments[ind]),
                                              height: 195,
                                              fit: BoxFit.fill,
                                              width: MediaQuery.of(context).size.width,
                                            ),
                                          )
                                        : widget.image != ""
                                            ? ClipRRect(
                                                borderRadius: BorderRadius.circular(10),
                                                child: CachedNetworkImage(
                                                  errorWidget: (context, url, error) => Image.asset(
                                                    bannerImg,
                                                    fit: BoxFit.fill,
                                                  ),
                                                  fit: BoxFit.fill,
                                                  height: 195,
                                                  width: MediaQuery.of(context).size.width,
                                                  imageUrl: widget.image.toString(),
                                                  placeholder: (a, b) => const Center(
                                                    child: CircularProgressIndicator(),
                                                  ),
                                                ),
                                              )
                                            : Image.asset(
                                                uploadImg,
                                                height: 195,
                                                fit: BoxFit.fill,
                                                width: MediaQuery.of(context).size.width,
                                              ),
                                  ),
                                ),
                                const SizedBox(height: 14),
                              ],
                            );
                          }),
                          const SizedBox(height: 30),
                          GestureDetector(
                            onTap: () {
                              controller.addOtherDocList();
                              setState(() {});
                            },
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    gradient: const LinearGradient(colors: [
                                      Color(0xFF3CBFFF),
                                      Color(0xFF0144DF),
                                    ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
                                width: 200,
                                height: 46,
                                child: const Center(
                                  child: Text(
                                    "Add More Doc",
                                    style: TextStyle(
                                      color: whiteColor,
                                      fontFamily: medium,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              for (int i = 0; i < controller.otherDocList.length; i++) {
                                controller.docName.add(controller.otherDocList[i].name.toString());
                                controller.docNo.add(controller.otherDocList[i].number.toString());
                              }
                              controller.uploadCustomerDocs();
                            },
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    gradient: const LinearGradient(colors: [
                                      Color(0xFF189DFF),
                                      Color(0xFF0070C1),
                                    ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
                                width: 200,
                                height: 46,
                                child: const Center(
                                  child: Text(
                                    "Submit",
                                    style: TextStyle(
                                      color: whiteColor,
                                      fontFamily: medium,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    )
                  : Form(
                      key: formKeyAadharPanDriving,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 14,
                          ),
                          Text(
                            "${widget.title} No.",
                            style: const TextStyle(
                              color: secondaryCl,
                              fontFamily: medium,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 10),
                          (widget.title == "Pan Card")
                              ? MyTextFormField(
                                  hint: "${widget.title} Number",
                                  controller: controller.panCardNo,
                                  obscureText: false,
                                  readOnly: false,
                                  counterText: "",
                                  inputFormatters: [
                                    UpperCaseTextFormatter(),
                                  ],
                                  border: primaryClNew,
                                  fillColor: Colors.white,
                                  validator: (v) {
                                    return controller.validatePAN(v!) ? null : "Enter Valid Pan Number";
                                  },
                                )
                              : (widget.title == "Driving Licence")
                                  ? MyTextFormField(
                                      hint: "${widget.title} Number",
                                      controller: controller.drivingNo,
                                      obscureText: false,
                                      readOnly: false,
                                      counterText: "",
                                      border: primaryClNew,
                                      fillColor: Colors.white,
                                      validator: (v) {
                                        return controller.validateDrivingLicense(v!) ? null : "Enter Valid Licence Number";
                                      },
                                    )
                                  : MyTextFormField(
                                      hint: "${widget.title} Number",
                                      controller: controller.aadhaarNo,
                                      obscureText: false,
                                      readOnly: false,
                                      counterText: "",
                                      maxLength: 14,
                                      border: primaryClNew,
                                      fillColor: Colors.white,
                                      inputFormatters: [FilteringTextInputFormatter.digitsOnly, WhiteSpacerAfter4()],
                                      validator: (v) {
                                        return controller.validateAadhaar(v!) ? null : "Enter Valid Aadhaar Number";
                                      },
                                    ),
                          const SizedBox(height: 10),
                          Text(
                            "${widget.title} Front Image",
                            style: const TextStyle(
                              color: secondaryCl,
                              fontFamily: medium,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            height: 195,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: InkWell(
                              onTap: () {
                                galleryBottomSheet(context, widget.value);
                              },
                              child: image1?.path != "" && image1?.path != null
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(6),
                                      child: Stack(
                                        children: [
                                          Image.file(
                                            image1!,
                                            height: 195,
                                            fit: BoxFit.fill,
                                            width: MediaQuery.of(context).size.width,
                                          ),
                                          Positioned(
                                              top: 4,
                                              right: 4,
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    image1 = File("");
                                                  });
                                                },
                                                child: Container(
                                                    decoration: BoxDecoration(color: const Color(0xFFD01111).withOpacity(0.72), shape: BoxShape.circle),
                                                    child: Image.asset(
                                                      deletePhotoIc,
                                                      height: 25,
                                                      width: 25,
                                                      fit: BoxFit.cover,
                                                    )),
                                              ))
                                        ],
                                      ),
                                    )
                                  : widget.image != ""
                                      ? Stack(
                                          children: [
                                            CachedNetworkImage(
                                              errorWidget: (context, url, error) => Image.asset(
                                                bannerImg,
                                                fit: BoxFit.fill,
                                              ),
                                              fit: BoxFit.fill,
                                              height: 195,
                                              width: MediaQuery.of(context).size.width,
                                              imageUrl: widget.image.toString(),
                                              placeholder: (a, b) => const Center(
                                                child: CircularProgressIndicator(),
                                              ),
                                            ),
                                            Positioned(
                                                top: 4,
                                                right: 4,
                                                child: Row(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {});
                                                      },
                                                      child: Container(
                                                          decoration: BoxDecoration(color: const Color(0xFF113BD0).withOpacity(0.72), shape: BoxShape.circle),
                                                          child: Image.asset(
                                                            editImgIc,
                                                            height: 25,
                                                            width: 25,
                                                            fit: BoxFit.cover,
                                                          )),
                                                    ),
                                                    const SizedBox(width: 7),
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {});
                                                      },
                                                      child: Container(
                                                          decoration: BoxDecoration(color: const Color(0xFFD01111).withOpacity(0.72), shape: BoxShape.circle),
                                                          child: Image.asset(
                                                            deletePhotoIc,
                                                            height: 25,
                                                            width: 25,
                                                            fit: BoxFit.cover,
                                                          )),
                                                    ),
                                                  ],
                                                ))
                                          ],
                                        )
                                      : Image.asset(
                                          uploadImg,
                                          height: 195,
                                          fit: BoxFit.fill,
                                          width: MediaQuery.of(context).size.width,
                                        ),
                            ),
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          widget.title == "Aadhaar Card"
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Aadhaar Card Back Image",
                                      style: TextStyle(color: secondaryCl, fontFamily: medium, fontWeight: FontWeight.w500, fontStyle: FontStyle.normal, fontSize: 12),
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          galleryBottomSheet(context, "${widget.value}Back");
                                        },
                                        child: controller.aadhaarCardBack.value.path != ""
                                            ? Stack(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius: BorderRadius.circular(6),
                                                    child: Image.file(
                                                      File(controller.aadhaarCardBack.value.path),
                                                      height: 195,
                                                      fit: BoxFit.fill,
                                                      width: MediaQuery.of(context).size.width,
                                                    ),
                                                  ),
                                                  Positioned(
                                                      top: 4,
                                                      right: 4,
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            controller.aadhaarCardBack.value = File("");
                                                          });
                                                        },
                                                        child: Container(
                                                            decoration: BoxDecoration(color: const Color(0xFFD01111).withOpacity(0.72), shape: BoxShape.circle),
                                                            child: Image.asset(
                                                              deletePhotoIc,
                                                              height: 25,
                                                              width: 25,
                                                              fit: BoxFit.cover,
                                                            )),
                                                      ))
                                                ],
                                              )
                                            : user.user.value.aadharCardBack != ""
                                                ? Stack(
                                                    children: [
                                                      CachedNetworkImage(
                                                        errorWidget: (context, url, error) => Image.asset(
                                                          bannerImg,
                                                          fit: BoxFit.fill,
                                                        ),
                                                        fit: BoxFit.fill,
                                                        height: 195,
                                                        width: MediaQuery.of(context).size.width,
                                                        imageUrl: user.user.value.aadharCardBack.toString(),
                                                        placeholder: (a, b) => const Center(
                                                          child: CircularProgressIndicator(),
                                                        ),
                                                      ),
                                                      Positioned(
                                                          top: 4,
                                                          right: 4,
                                                          child: Row(
                                                            children: [
                                                              GestureDetector(
                                                                onTap: () {
                                                                  setState(() {});
                                                                },
                                                                child: Container(
                                                                    decoration: BoxDecoration(color: const Color(0xFF113BD0).withOpacity(0.72), shape: BoxShape.circle),
                                                                    child: Image.asset(
                                                                      editImgIc,
                                                                      height: 25,
                                                                      width: 25,
                                                                      fit: BoxFit.cover,
                                                                    )),
                                                              ),
                                                              const SizedBox(width: 7),
                                                              GestureDetector(
                                                                onTap: () {
                                                                  setState(() {});
                                                                },
                                                                child: Container(
                                                                    decoration: BoxDecoration(color: const Color(0xFFD01111).withOpacity(0.72), shape: BoxShape.circle),
                                                                    child: Image.asset(
                                                                      deletePhotoIc,
                                                                      height: 25,
                                                                      width: 25,
                                                                      fit: BoxFit.cover,
                                                                    )),
                                                              ),
                                                            ],
                                                          ))
                                                    ],
                                                  )
                                                : Image.asset(
                                                    uploadImg,
                                                    height: 195,
                                                    fit: BoxFit.fill,
                                                    width: MediaQuery.of(context).size.width,
                                                  )),
                                  ],
                                )
                              : const SizedBox(),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              if (formKeyAadharPanDriving.currentState!.validate()) {
                                controller.uploadCustomerDocs();
                              }
                            },
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    gradient: const LinearGradient(colors: [
                                      Color(0xFF189DFF),
                                      Color(0xFF0070C1),
                                    ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
                                width: 200,
                                height: 46,
                                child: const Center(
                                  child: Text(
                                    "Submit",
                                    style: TextStyle(
                                      color: whiteColor,
                                      fontFamily: medium,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
        ),
      ),
    );
  }

  void galleryBottomSheet(BuildContext ctx, String tittle) {
    showModalBottomSheet(
        context: ctx,
        builder: (context) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.27,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                    _getImage(ImageSource.gallery, ctx, tittle);
                  },
                  leading: const Icon(Icons.photo_album),
                  title: const Text(
                    "Gallery",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                    _getImage(ImageSource.camera, ctx, tittle);
                  },
                  leading: const Icon(Icons.camera),
                  title: const Text(
                    "Camera",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () => Navigator.of(context).pop(),
                  leading: const Icon(Icons.close),
                  title: const Text(
                    "Close",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  void _getImage(ImageSource source, BuildContext context, String title) async {
    try {
      final XFile? pickedFile = await picker.pickImage(
        source: source,
      );
      setState(() {
        pickedImageFile = File(pickedFile!.path);
      });
      await cropImage(title);
    } catch (e) {
      Log.console("Error while picking image $e");
    }
  }

  Future<void> cropImage(String title) async {
    try {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedImageFile!.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9,
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: "Crop Image",
            toolbarColor: secondaryCl,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
          ),
          IOSUiSettings(
            title: "Crop Image",
          ),
        ],
      );
      if (croppedFile != null) {
        setState(() {
          if (title == "panCard") {
            controller.panCard.value = File(croppedFile.path);
            image1 = File(croppedFile.path);
          } else if (title == "aadhaarCard") {
            controller.aadhaarCard.value = File(croppedFile.path);
            image1 = File(croppedFile.path);
          } else if (title == "drivingLicence") {
            controller.drivingLicence.value = File(croppedFile.path);
            image1 = File(croppedFile.path);
          } else if (title == "bankDetails") {
            //controller.bankDetails.value = File(croppedFile.path);
            image1 = File(croppedFile.path);
          } else if (title == "otherDocuments") {
            controller.otherDocuments.add(croppedFile.path);
            image1 = File(croppedFile.path);
          } else {
            controller.aadhaarCardBack.value = File(croppedFile.path);
          }
        });
      }
    } catch (e) {
      Log.console("Crash error ${e.toString()}");
    }
  }
}
