import 'package:get/get.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/controllers/dashboard_controller.dart';
import 'package:wireframe/screens/blog_details_screen.dart';

class AllBolgScreen extends StatefulWidget {
  const AllBolgScreen({super.key});

  @override
  State<AllBolgScreen> createState() => _AllBolgScreenState();
}

class _AllBolgScreenState extends State<AllBolgScreen> {
  DashboardController dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: Get.find<DashboardController>(),
        initState: (state) {
          Get.find<DashboardController>().blogListGet();
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
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        "Blogs",
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
                child: Builder(builder: (context) {
                  if (contextCtr.loading) {
                    return const LoaderClass();
                  }
                  if (contextCtr.blogList.isEmpty) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height - 200,
                      child: const Center(
                        child: Text(
                          "No Blog Found",
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
                      const SizedBox(
                        height: 6,
                      ),
                      MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        removeBottom: true,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: contextCtr.blogList.length,
                          itemBuilder: (BuildContext context, int index) {
                            String createdAtString = contextCtr.blogList[index].createdAt.toString();
                            DateTime createdAt = DateTime.parse(createdAtString);
                            String formattedDate = "${createdAt.day}-${createdAt.month}-${createdAt.year}";
                            return GestureDetector(
                                onTap: () {
                                  Get.to(() => BlogDetailsScreen(
                                        id: contextCtr.blogList[index].id.toString(),
                                        tittle: contextCtr.blogList[index].title.toString(),
                                      ));
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: const Color.fromRGBO(255, 255, 255, 1),
                                    border: Border.all(color: primaryClNew.withOpacity(0.43)),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  margin: const EdgeInsets.symmetric(horizontal: 17, vertical: 6),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 56,
                                            width: 72,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(8),
                                              child: contextCtr.blogList[index].image != ""
                                                  ? Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors.transparent,
                                                        borderRadius: BorderRadius.circular(6),
                                                        image: DecorationImage(image: NetworkImage(contextCtr.blogList[index].image.toString()), fit: BoxFit.fill),
                                                      ),
                                                    )
                                                  : Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors.transparent,
                                                        borderRadius: BorderRadius.circular(6),
                                                        image: const DecorationImage(image: AssetImage(bannerImg), fit: BoxFit.fill),
                                                      ),
                                                    ),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  contextCtr.blogList[index].title.toString(),
                                                  overflow: TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12,
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
                                                      formattedDate,
                                                      style: const TextStyle(
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Container(
                                        height: 1,
                                        width: MediaQuery.of(context).size.width,
                                        color: appBarClNew1,
                                      ),
                                      const SizedBox(height: 8),
                                      SizedBox(
                                        child: Text(
                                          contextCtr.blogList[index].shortDes.toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: Color.fromRGBO(104, 104, 104, 1)),
                                          maxLines: 3,
                                        ),
                                      ),
                                      /* Html(
                                                      shrinkWrap: true,
                                                      data: contextCtrl.blogList[index].shortDes.toString(),
                                                      style: {
                                                        '#': Style(fontSize: FontSize(10),
                                                        fontWeight: FontWeight.w500,
                                                         maxLines: 3,
                                                        color: const Color.fromRGBO(104, 104, 104, 1)),
                                                      },
                                                    ),*/
                                    ],
                                  ),
                                ));
                          },
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.011),
                    ],
                  );
                }),
              ),
            ),
          );
        });
  }
}
