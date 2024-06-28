import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:permission_handler/permission_handler.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/constants/get_device_type.dart';
import 'package:wireframe/constants/util.dart';
import 'package:wireframe/controllers/lead_list_controller.dart';
import 'package:wireframe/service/api_logs.dart';

class DocumentListScreen extends StatefulWidget {
  final String leadId;

  const DocumentListScreen({super.key, required this.leadId});

  @override
  State<DocumentListScreen> createState() => _DocumentListScreenState();
}

class _DocumentListScreenState extends State<DocumentListScreen> {
  LeadListController controller = Get.put(LeadListController());
  File? pickedImageFile;
  File? image1;
  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: Get.find<LeadListController>(),
        initState: (state) {
          Get.find<LeadListController>().leadDocumentList(widget.leadId);
        },
        builder: (contextCtr) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: homeBgCl,
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
                      const SizedBox(width: 5),
                      const Text(
                        "Documents Requirement",
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
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Builder(
                        builder: (context) {
                          if (contextCtr.isLoading) {
                            return const LoaderClass();
                          }
                          return MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: contextCtr.documentsNewList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 16),
                                      Text(
                                        contextCtr.documentsNewList[index].title.toString(),
                                        style: const TextStyle(
                                          color: draKText,
                                          fontFamily: medium,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 14,
                                        ),
                                      ),
                                      const SizedBox(height: 14),
                                      MediaQuery.removePadding(
                                        context: context,
                                        removeTop: true,
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            physics: const NeverScrollableScrollPhysics(),
                                            itemCount: contextCtr.documentsNewList[index].documentList?.length,
                                            itemBuilder: (BuildContext context, int ind) {
                                              return Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Container(
                                                        height: 60,
                                                        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 11),
                                                        width: MediaQuery.of(context).size.width * 0.77,
                                                        decoration: BoxDecoration(color: whiteColor, border: Border.all(color: borderNewCl, width: 1), borderRadius: BorderRadius.circular(4)),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            contextCtr.documentsNewList[index].documentList![ind].document != ""
                                                                ? Row(
                                                                    children: [
                                                                      GestureDetector(
                                                                        onTap: () async {
                                                                          await showDialog(
                                                                              context: context,
                                                                              builder: (_) => imageDialog(contextCtr.documentsNewList[index].documentList![ind].title.toString(), contextCtr.documentsNewList[index].documentList![ind].document.toString(), context));
                                                                        },
                                                                        child: Container(
                                                                          padding: EdgeInsets.all(GetDeviceType().getDeviceType(context) ? 4 : 2),
                                                                          decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(GetDeviceType().getDeviceType(context) ? 6 : 4),
                                                                            border: Border.all(color: greyNew),
                                                                            color: whiteColor,
                                                                          ),
                                                                          child: ClipRRect(
                                                                            borderRadius: BorderRadius.circular(GetDeviceType().getDeviceType(context) ? 6 : 4),
                                                                            child: contextCtr.documentsNewList[index].documentList![ind].document != ""
                                                                                ? CachedNetworkImage(
                                                                                    errorWidget: (context, url, error) => Image.asset(
                                                                                      defult,
                                                                                      fit: BoxFit.fill,
                                                                                    ),
                                                                                    fit: BoxFit.fill,
                                                                                    height: GetDeviceType().getDeviceType(context) ? 40 : 30,
                                                                                    width: GetDeviceType().getDeviceType(context) ? 56 : 46,
                                                                                    imageUrl: contextCtr.documentsNewList[index].documentList![ind].document.toString(),
                                                                                    placeholder: (a, b) => const Center(
                                                                                      child: CircularProgressIndicator(),
                                                                                    ),
                                                                                  )
                                                                                : Image.asset(
                                                                                    defult,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        width: 10,
                                                                      )
                                                                    ],
                                                                  )
                                                                : const SizedBox(),
                                                            Expanded(
                                                              child: Text(
                                                                contextCtr.documentsNewList[index].documentList![ind].title.toString(),
                                                                style: const TextStyle(
                                                                  color: draKText,
                                                                  fontFamily: medium,
                                                                  fontWeight: FontWeight.w500,
                                                                  fontStyle: FontStyle.normal,
                                                                  fontSize: 12,
                                                                  overflow: TextOverflow.ellipsis,
                                                                ),
                                                                maxLines: 2,
                                                              ),
                                                            ),
                                                            const SizedBox(width: 10),
                                                            Container(
                                                              padding: const EdgeInsets.all(5),
                                                              decoration: BoxDecoration(
                                                                  color: contextCtr.documentsNewList[index].documentList![ind].isUploaded == 0 ? Color(0xFFFFF4EA) : lightGreenSec,
                                                                  borderRadius: BorderRadius.circular(4)),
                                                              child: Row(
                                                                children: [
                                                                  Image.asset(
                                                                    contextCtr.documentsNewList[index].documentList![ind].isUploaded == 0 ? pendingIc : completeIc,
                                                                    height: 10,
                                                                    width: 10,
                                                                  ),
                                                                  const SizedBox(width: 6),
                                                                  Text(
                                                                    contextCtr.documentsNewList[index].documentList![ind].isUploaded == 0 ? "Pending" : "Completed",
                                                                    style: TextStyle(
                                                                      color: contextCtr.documentsNewList[index].documentList![ind].isUploaded == 0 ? pendingCl : completeCl,
                                                                      fontFamily: medium,
                                                                      fontWeight: FontWeight.w500,
                                                                      fontStyle: FontStyle.normal,
                                                                      fontSize: 8,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(width: 4),
                                                      GestureDetector(
                                                        onTap: () {
                                                          if (contextCtr.documentsNewList[index].documentList![ind].isUploaded == 0) {
                                                            galleryBottomSheet(context, contextCtr.documentsNewList[index].documentList![ind].id.toString());
                                                          } else {
                                                            contextCtr.leadDocumentDelete(contextCtr.documentsNewList[index].documentList![ind].id.toString(), widget.leadId);
                                                          }
                                                        },
                                                        child: Container(
                                                          height: 60,
                                                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                                                          width: MediaQuery.of(context).size.width * 0.14,
                                                          decoration: BoxDecoration(
                                                            color: whiteColor,
                                                            border: Border.all(color: contextCtr.documentsNewList[index].documentList![ind].isUploaded == 0 ? borderNewCl : rejectCl, width: 1),
                                                            borderRadius: BorderRadius.circular(4),
                                                          ),
                                                          child: Center(
                                                              child: Image.asset(
                                                            contextCtr.documentsNewList[index].documentList![ind].isUploaded == 0 ? addOutline : deleteIcNew,
                                                            height: 26,
                                                            width: 26,
                                                            fit: BoxFit.fill,
                                                          )),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 12)
                                                ],
                                              );
                                            }),
                                      ),
                                    ],
                                  );
                                }),
                          );
                        }
                      ),
                      /* const Text(
                        "Finance Details",
                        style: TextStyle(
                          color: draKText,
                          fontFamily: medium,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 14),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 11),
                            width: MediaQuery.of(context).size.width * 0.78,
                            decoration: BoxDecoration(color: whiteColor, border: Border.all(color: borderNewCl, width: 1), borderRadius: BorderRadius.circular(4)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: const Text(
                                    "In publishing and graphic design, ..." + demoString,
                                    style: TextStyle(
                                      color: draKText,
                                      fontFamily: medium,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(color: lightGreenSec, borderRadius: BorderRadius.circular(4)),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        completeIc,
                                        height: 10,
                                        width: 10,
                                      ),
                                      SizedBox(width: 6),
                                      const Text(
                                        "Complete",
                                        style: TextStyle(
                                          color: completeCl,
                                          fontFamily: medium,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(width: 4),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 11),
                            width: MediaQuery.of(context).size.width * 0.13,
                            decoration: BoxDecoration(color: whiteColor, border: Border.all(color: greenSec, width: 1), borderRadius: BorderRadius.circular(4)),
                            child: Center(
                                child: Image.asset(
                              completeIc,
                              height: 24,
                              width: 24,
                              fit: BoxFit.fill,
                            )),
                          ),
                        ],
                      ),*/
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  void galleryBottomSheet(BuildContext ctx, String id) {
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
                    _getImage(ImageSource.gallery, ctx, id);
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
                    _getImage(ImageSource.camera, ctx, id);
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

  void _getImage(ImageSource source, BuildContext context, String id) async {
    //bool? status = await checkAndRequestCameraPermissions(source == ImageSource.gallery ? "gal" : "cam", context);
   // if (status != null && status) {
      try {
        final XFile? pickedFile = await picker.pickImage(
          source: source,
        );
        setState(() {
          pickedImageFile = File(pickedFile!.path);
        });
        await cropImage(id);
      } catch (e) {
        Log.console("Error while picking image $e");
      }
    }
  //}

  Future<void> cropImage(String id) async {
    try {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedImageFile!.path,
        aspectRatioPresets: Platform.isAndroid
            ? [CropAspectRatioPreset.square, CropAspectRatioPreset.ratio3x2, CropAspectRatioPreset.original, CropAspectRatioPreset.ratio4x3, CropAspectRatioPreset.ratio16x9]
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
          image1 = File(croppedFile.path);
          if (image1 != null) {
            var ids = [];
            var images = [];
            ids.clear();
            images.clear();
            ids.add(id);
            images.add(image1);
            controller.uploadDocuments(ids, images, widget.leadId);
          } else {
            errorToast("Please select image ");
          }
        });
      }
    } catch (e) {
      Log.console("Crash error ${e.toString()}");
    }
  }

 /* Future<bool?> checkAndRequestCameraPermissions(String source, BuildContext context) async {
    Permission permission = source == "gal" ? Permission.storage : Permission.camera;
    // Permission permission = source == "gal" ? Platform.isIOS ? Permission.photos : Permission.mediaLibrary : Permission.camera;
    PermissionStatus permissionStatus = await permission.request();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await permission.request();
      if (permissionStatus == PermissionStatus.denied) {
        // ignore: use_build_context_synchronously
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Alert', style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold)),
                content:
                    Text(source == "gal" ? "In profile to add photo, you have to give storage permission to this app!" : "In profile to add photo, you have to give camera permission to this app!"),
                actions: <Widget>[
                  TextButton(
                    child: const Text('Ok'),
                    onPressed: () {
                      Navigator.of(context).pop();
                      permission.request();
                    },
                  ),
                ],
              );
            });
        return false;
      }
      if (permissionStatus == PermissionStatus.permanentlyDenied) {
        // ignore: use_build_context_synchronously
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Alert', style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold)),
                content:
                    Text(source == "gal" ? "In profile to add photo, you have to give storage permission to this app!" : "In profile to add photo, you have to give camera permission to this app!"),
                actions: <Widget>[
                  Center(
                    child: TextButton(
                      child: const Text('Ok'),
                      onPressed: () => openAppSettings().then((value) async {
                        Navigator.pop(context);
                      }),
                    ),
                  ),
                ],
              );
            });
        return false;
      } else {
        return true;
      }
    } else if (permissionStatus == PermissionStatus.permanentlyDenied) {
      // ignore: use_build_context_synchronously
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Alert', style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold)),
              content: Text(source == "gal" ? "In profile to add photo, you have to give storage permission to this app!" : "In profile to add photo, you have to give camera permission to this app!"),
              actions: [
                TextButton(
                    child: const Text('Cancel'),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                TextButton(
                    child: const Text('Settings'),
                    onPressed: () {
                      Navigator.pop(context);
                      openAppSettings();
                    }),
              ],
            );
          });
      return false;
    } else {
      return true;
    }
  }*/
  Widget imageDialog(text, path, context) {
    return Dialog(
      backgroundColor: Colors.white,
      // elevation: 0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25)
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                     text,
                      style: const TextStyle(
                        color: draKText,
                        fontFamily: medium,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: 12,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.close_rounded),
                    color: Colors.redAccent,
                  ),
                ],
              ),
            ),
            Container(
              width: 220,
              height: 200,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10)
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: path != ""
                    ? CachedNetworkImage(
                  errorWidget: (context, url, error) => Image.asset(
                    defult,
                    fit: BoxFit.fill,
                  ),
                  fit: BoxFit.fill,
                  height: GetDeviceType().getDeviceType(context) ? 300 : 200,
                  width: GetDeviceType().getDeviceType(context) ? 320 : 220,
                  imageUrl:path.toString(),
                  placeholder: (a, b) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
                    : Image.asset(
                  defult,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );}
}
