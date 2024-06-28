import 'package:get/get.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/controllers/onboarding_controller.dart';
import 'package:wireframe/screens/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);
  OnBoardingController con = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xFFF1F9FF),
          body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(onboardingBg), fit: BoxFit.cover)),
              child: _buildBody())),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.01, width: MediaQuery.of(context).size.width),
              InkWell(
                onTap: () {
                  Get.to(() => const LoginScreen());
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [BoxShadow(offset: const Offset(0, 1), blurRadius: 4, spreadRadius: 0, color: const Color(0xFF0C98FF).withOpacity(0.19))]),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    child: const Text(
                      "Skip",
                      style: TextStyle(
                        color: primaryClNew,
                        fontFamily: semiBold,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Image.asset(
                imgMoneyverssLogo,
                height: 65,
                width: 172,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.031,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.55,
                child: _buildPageView(),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        con.images.length,
                        (ind) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          padding: const EdgeInsets.all(5),
                          height: 6,
                          width: 6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: ind == con.currentPage.value ? primaryClNew : const Color(0xFFD9D9D9),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              GestureDetector(
                onTap: () {
                  if (con.currentPage.value < 3) {
                    con.currentPage.value++;
                    _pageController.animateToPage(con.currentPage.value, duration: const Duration(seconds: 1), curve: Curves.easeInOut);
                  } else {
                    Get.to(() => const LoginScreen());
                  }
                },
                child: Image.asset(
                  buttonOnBoarding,
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: 50,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPageView() {
    return PageView.builder(
      itemCount: con.totalPages.value,
      controller: _pageController,
      itemBuilder: (BuildContext context, int index) {
        return AnimatedBuilder(
          animation: _pageController,
          builder: (context, child) {
            double value = 1.0;
            if (_pageController.position.haveDimensions) {
              value = _pageController.page! - index;
              value = (1 - (value.abs() * 0.5)).clamp(0.0, 1.0);
            }
            return Opacity(
              opacity: value,
              child: Transform.translate(
                offset: Offset(0.0, 100 * (1 - value)),
                // Adjust the offset as needed
                child: child,
              ),
            );
          },
          child: Column(
            children: [
              Image.asset(
                con.images[index],
                height: MediaQuery.of(context).size.height * 0.35,
                width: MediaQuery.of(context).size.height * 0.95,
                fit: BoxFit.contain,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: index == 0
                    ?RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: "Unlock Your Financial Potential ",
                    style: TextStyle(
                      color: secondaryCl,
                      fontFamily: bold,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 18,
                    ),
                    children: [
                      TextSpan(
                        text: "With Us",
                        style: TextStyle(
                          color: primaryClNew,
                          fontFamily: bold,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                )
                    : index == 1
                        ? RichText(
                            textAlign: TextAlign.center,
                            text: const TextSpan(
                              text: "Take Informed & Best Decision ",
                              style: TextStyle(
                                color: secondaryCl,
                                fontFamily: bold,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 18,
                              ),
                              children: [
                                TextSpan(
                                  text: "With Us",
                                  style: TextStyle(
                                    color: primaryClNew,
                                    fontFamily: bold,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : index == 2
                            ? RichText(
                                textAlign: TextAlign.center,
                                text: const TextSpan(
                                  text: "Tailored Solutions As Per Your Financial ",
                                  style: TextStyle(
                                    color: secondaryCl,
                                    fontFamily: bold,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 18,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "Requirements.",
                                      style: TextStyle(
                                        color: primaryClNew,
                                        fontFamily: bold,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 18,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: "Transparency ",
                    style: TextStyle(
                      color: secondaryCl,
                      fontFamily: bold,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 18,
                    ),
                    children: [
                      TextSpan(
                        text: "First",
                        style: TextStyle(
                          color: primaryClNew,
                          fontFamily: bold,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                )
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
            ],
          ),
        );
      },
      onPageChanged: (int index) {
        _currentPageNotifier.value = index;
        con.currentPage.value = index;
      },
    );
  }
}
