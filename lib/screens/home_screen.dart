import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/controllers/dashboard_controller.dart';
import 'package:wireframe/recy_items/item_loan_type.dart';
import 'package:wireframe/recy_items/item_testimonial.dart';
import 'package:wireframe/screens/all_blog_screen.dart';
import 'package:wireframe/screens/all_calculator_screen.dart';
import 'package:wireframe/screens/blog_details_screen.dart';
import 'package:wireframe/screens/digi_locker_screen.dart';
import 'package:wireframe/screens/my_application_screen.dart';
import 'package:wireframe/screens/my_appointment/my_appointment.dart';

import '../constants/get_device_type.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DashboardController controller = Get.put(DashboardController());
  CarouselController carouselController = CarouselController();
  int selectedIndex = 0;
  int selectedIndexPre = 0;
  var imageList = [bannerImg, bannerImg, bannerImg];
  static const String calculator = calculatorIc;
  static const String track = trackIc;
  static const String locker = safeIc;
    var essentials = [
      {
        'title': 'Calculator',
        'image': calculator,
      },
      {
        'title': 'Track Application',
        'image': track,
      },
      {
        'title': 'DG Locker',
        'image': locker,
      },
    ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<DashboardController>(),
      initState: (state) {
        Get.find<DashboardController>().dashboard();
        Get.find<DashboardController>().blogListGet();
      },
      builder: (contextCtrl) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: screenBgCl,
            body: Builder(
              builder: (context) {
                if (controller.loading) {
                  return const LoaderClass();
                }
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: GetDeviceType().getDeviceType(context)? 20 : 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: CarouselSlider(
                          carouselController: carouselController,
                          options: CarouselOptions(
                            aspectRatio: 16 / 4.7,
                            autoPlay: true,
                            enlargeCenterPage: true,
                            viewportFraction: 1,
                            padEnds: false,
                            pauseAutoPlayOnTouch: true,
                            enableInfiniteScroll: false,
                            onPageChanged: (index, reason) {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                          ),
                          items: List.generate(
                            contextCtrl.bannerList.length,
                                (ind) => InkWell(
                              onTap: () {},
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: GetDeviceType().getDeviceType(context)? 20 : 10),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [BoxShadow(offset: const Offset(0, 1), blurRadius: 10, spreadRadius: 0, color: Colors.grey.withOpacity(0.05))],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: contextCtrl.bannerList[ind].image != ""
                                      ? CachedNetworkImage(
                                    errorWidget: (context, url, error) => Image.asset(
                                      bannerImg,
                                      fit: BoxFit.contain,
                                    ),
                                    fit: BoxFit.contain,
                                    imageUrl: contextCtrl.bannerList[ind].image.toString(),
                                    placeholder: (a, b) => const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  )
                                      : Image.asset(
                                    imageList[ind],
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: GetDeviceType().getDeviceType(context)? 20 : 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          contextCtrl.bannerList.length,
                              (ind) => Container(
                            margin: EdgeInsets.symmetric(horizontal: GetDeviceType().getDeviceType(context)? 4: 2),
                            padding: EdgeInsets.all(GetDeviceType().getDeviceType(context)? 8 : 5),
                            height: 6,
                            width: ind == selectedIndex ? 11 : 6,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: ind == selectedIndex ? primaryClNew : borderNewCl),
                          ),
                        ),
                      ),
                      SizedBox(height: GetDeviceType().getDeviceType(context)? 24 : 14),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: GetDeviceType().getDeviceType(context)? 17 : 12),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.circular(10), border: Border.all(color: borderNewCl)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: GetDeviceType().getDeviceType(context)?18 : 14,
                                  width: GetDeviceType().getDeviceType(context)? 14: 10,
                                  color: primaryClNew,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  "Loan products".capitalize!,
                                  style: TextStyle(
                                    color: draKText,
                                    fontFamily: semiBold,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    fontSize: GetDeviceType().getDeviceType(context)? 16 : 14,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.symmetric(horizontal: 20),
                              child: GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: contextCtrl.loanTypeList.length,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: GetDeviceType().getDeviceType(context)? 1/1.1 : 1/1.5,
                                  crossAxisSpacing: 25,
                                  crossAxisCount: 3,
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  return ItemLoanType(loanTypeList: contextCtrl.loanTypeList[index], lastLoanType: contextCtrl.loanMainTypeList[contextCtrl.loanTypeList.length],);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: GetDeviceType().getDeviceType(context)? 22 : 12),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: GetDeviceType().getDeviceType(context)? 19 : 14 ),
                        child: Text(
                          "Essentials".capitalize!,
                          style: TextStyle(
                            color: draKText,
                            fontFamily: semiBold,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontSize: GetDeviceType().getDeviceType(context)? 18 : 14,
                          ),
                        ),
                      ),
                      SizedBox(height: GetDeviceType().getDeviceType(context)? 22 : 12),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: GetDeviceType().getDeviceType(context)? 18 : 13),
                        width: MediaQuery.of(context).size.width,
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: essentials.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: GetDeviceType().getDeviceType(context)? 1/1.1 : 1/1.3,
                            crossAxisSpacing: GetDeviceType().getDeviceType(context)?20: 5,
                            mainAxisSpacing: 20,
                            crossAxisCount: 3,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                if (essentials[index]["title"] == "Calculator") {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const AllCalculatorScreen()));
                                } else if (essentials[index]["title"] == "DG Locker") {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const DigitalLocker()));
                                } else if (essentials[index]["title"] == "Track Application") {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const MyApplicationScreen()));
                                }
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 5, top: 2, bottom: 2),
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: const Color(0xFFB5D1EA)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.15),
                                      offset: const Offset(0, 2),
                                      blurRadius: 1,
                                      spreadRadius: 0,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding : EdgeInsets.symmetric(horizontal: GetDeviceType().getDeviceType(context)?30 : 10, vertical: GetDeviceType().getDeviceType(context)?15 : 5),
                                      child: Image.asset(
                                        essentials[index]["image"].toString(),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: Text(
                                        essentials[index]["title"]!,
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: textHeading,
                                          overflow: TextOverflow.ellipsis,
                                          fontFamily: semiBold,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.normal,
                                          fontSize: GetDeviceType().getDeviceType(context)? 14 : 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: GetDeviceType().getDeviceType(context)? 22 : 12),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: GetDeviceType().getDeviceType(context)? 20: 15 ),
                        child: Image.asset(
                          checkSocureImg,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: GetDeviceType().getDeviceType(context)? 22 : 12),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: GetDeviceType().getDeviceType(context)? 20: 15 ,
                        ),
                        child: Text(
                          "Testimonials".capitalize!,
                          style: TextStyle(
                            color: draKText,
                            fontFamily: semiBold,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontSize: GetDeviceType().getDeviceType(context)? 18 : 14,
                          ),
                        ),
                      ),
                      SizedBox(height: GetDeviceType().getDeviceType(context)? 20 : 10),
                      Container(
                        height: GetDeviceType().getDeviceType(context)? 352 : 212,
                        margin: EdgeInsets.only(left: GetDeviceType().getDeviceType(context)? 20 : 15 ),
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: controller.testimonialList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ItemTestimonial(testimonialList: contextCtrl.testimonialList[index]);
                          },
                        ),
                      ),
                      SizedBox(height: GetDeviceType().getDeviceType(context)? 26 : 16),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: GetDeviceType().getDeviceType(context)? 20 : 16),
                        child: Text(
                          "Book Free Financial Consultancy",
                          style: TextStyle(
                            color: draKText,
                            fontFamily: semiBold,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontSize: GetDeviceType().getDeviceType(context)? 18 : 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: InkWell(
                          onTap: () {
                            Get.to(() => const MyAppointment(
                              isNew: true,
                              id: "",
                            ));
                          },
                          child: Image.asset(
                            componentImg,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: GetDeviceType().getDeviceType(context)? 22 : 17),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Blogs",
                              style: TextStyle(
                                color: draKText,
                                fontFamily: semiBold,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: GetDeviceType().getDeviceType(context)? 18 : 14,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(() => const AllBolgScreen());
                              },
                              child: Text(
                                "View All",
                                style: TextStyle(
                                  color: primaryClNew,
                                  fontSize: GetDeviceType().getDeviceType(context)? 16 : 12,
                                  fontFamily: medium,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 11),
                      Container(
                        margin: EdgeInsets.only(left: GetDeviceType().getDeviceType(context)? 15: 10 ),
                        height: (MediaQuery.of(context).size.width * 0.38)+(GetDeviceType().getDeviceType(context)
                            ? 95
                            : 70),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: contextCtrl.blogList.length,
                          itemBuilder: (BuildContext context, int index) {
                            String createdAtString = contextCtrl.blogList[index].createdAt.toString();
                            DateTime createdAt = DateTime.parse(createdAtString);
                            String formattedDate = "${createdAt.day}-${createdAt.month}-${createdAt.year}";
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 6),
                              width: MediaQuery.of(context).size.width * 0.55,
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() => BlogDetailsScreen(id: contextCtrl.blogList[index].id.toString(), tittle: contextCtrl.blogList[index].title.toString()));
                                },
                                child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(GetDeviceType().getDeviceType(context)? 20 : 10)),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height : MediaQuery.of(context).size.width * 0.38,
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(GetDeviceType().getDeviceType(context)? 20 : 10)),
                                          width: MediaQuery.of(context).size.width,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(GetDeviceType().getDeviceType(context)?20 : 10),
                                            child: contextCtrl.blogList[index].image != ""
                                                ? CachedNetworkImage(
                                              errorWidget: (context, url, error) => Image.asset(
                                                bannerImg,
                                                fit: BoxFit.fill,
                                              ),
                                              fit: BoxFit.fill,
                                              height: 30,
                                              width: 30,
                                              imageUrl: contextCtrl.blogList[index].image.toString(),
                                              placeholder: (a, b) => const Center(
                                                child: CircularProgressIndicator(),
                                              ),
                                            )
                                                : Image.asset(
                                              bannerImg,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                          child: Text(
                                            contextCtrl.blogList[index].title.toString(),
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: GetDeviceType().getDeviceType(context)? 16 : 12,
                                              color: Colors.black,
                                            ),
                                            maxLines: 2,
                                          ),
                                        ),
                                        SizedBox(height: GetDeviceType().getDeviceType(context)? 20 : 10),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.calendar_month,
                                                size: GetDeviceType().getDeviceType(context)? 20 : 10,
                                              ),
                                              SizedBox(
                                                width: GetDeviceType().getDeviceType(context)? 16 : 8,
                                              ),
                                              Text(
                                                formattedDate,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: GetDeviceType().getDeviceType(context)? 16 : 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    )),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: GetDeviceType().getDeviceType(context)? 24 : 14),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: GetDeviceType().getDeviceType(context)? 20 : 15),
                        child: InkWell(
                          onTap: () {
                            shareApp();
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.asset(
                              referImage,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: GetDeviceType().getDeviceType(context)? 25 : 15 ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  Future<void> shareApp() async {
    String packageName = 'com.aamod.moneyverss';
    String appStoreUrl = 'https://apps.apple.com/app/$packageName';
    String playStoreUrl = 'https://play.google.com/store/apps/details?id=$packageName';
    if (!Platform.isAndroid) {
      await Share.share("Hi! I'm inviting you to use moneyverss ."
          "Use my referral code <moneyverss20> or tap the link below to take loan."
          "moneyverss  App Download From App Store:-"
          '\n $appStoreUrl"');
    } else if (Platform.isAndroid) {
      await Share.share("Hi! I'm inviting you to use moneyverss ."
          "Use my referral code <moneyverss20> or tap the link below to take loan."
          "moneyverss App Download From Play Store:-"
          '\n $playStoreUrl"');
    } else {
      throw 'Could not launch store';
    }
  }
}
