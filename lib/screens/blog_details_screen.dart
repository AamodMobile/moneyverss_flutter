import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/controllers/dashboard_controller.dart';

class BlogDetailsScreen extends StatefulWidget {
  final String tittle;
  final String id;

  const BlogDetailsScreen({super.key, required this.tittle, required this.id});

  @override
  State<BlogDetailsScreen> createState() => _BlogDetailsScreenState();
}

class _BlogDetailsScreenState extends State<BlogDetailsScreen> {
  DashboardController dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: Get.find<DashboardController>(),
        initState: (state) {
          Get.find<DashboardController>().blogDetailsGet(widget.id);
        },
        builder: (state) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: screenBgCl,
              appBar: PreferredSize(
                preferredSize: Size(MediaQuery.of(context).size.width, 60),
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 14,),
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
                      Expanded(
                        child: Text(
                          widget.tittle,
                          maxLines: 1,
                          style: TextStyle(
                            color: draKText,
                            fontFamily: medium,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: SingleChildScrollView(
                  child: Builder(builder: (context) {
                    if (state.loading) {
                      return const LoaderClass();
                    }
                    if (state.blogDetailsModel == null) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height - 200,
                        child: const Center(
                          child: Text(
                            "No Blog Details",
                            style: TextStyle(
                              color: mainColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: medium,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                      );
                    }
                    return Column(
                      children: [
                        const SizedBox(height: 15),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: state.blogDetailsModel!.bannerImage != ""
                                ? CachedNetworkImage(
                                    errorWidget: (context, url, error) => Image.asset(
                                      bannerImg,
                                      fit: BoxFit.contain,
                                    ),
                              fit: BoxFit.contain,
                              width: MediaQuery.of(context).size.width,
                                    imageUrl: state.blogDetailsModel!.bannerImage.toString(),
                                    placeholder: (a, b) => const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  )
                                : Image.asset(
                                    width: MediaQuery.of(context).size.width,
                                    sliderOneImg,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          state.blogDetailsModel!.title.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            fontFamily: medium,
                            color: Colors.black,
                          ),
                          maxLines: 2,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.calendar_month,
                              size: 10,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              formatDate(state.blogDetailsModel!.createdAt.toString()),
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Divider(color: appBarClNew1),
                        const SizedBox(height: 14),
                        Text(
                          state.blogDetailsModel!.shortDes.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Color.fromRGBO(104, 104, 104, 1)),
                          maxLines: 3,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Html(
                          shrinkWrap: true,
                          data: state.blogDetailsModel!.description.toString(),
                          style: {
                            '#': Style(
                              fontSize: FontSize(12),
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(104, 104, 104, 1),
                            ),
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),
          );
        });
  }

  String formatDate(String date) {
    DateTime createdAt = DateTime.parse(date);
    String formattedDate = "${createdAt.day}-${createdAt.month}-${createdAt.year}";
    return formattedDate;
  }
}
