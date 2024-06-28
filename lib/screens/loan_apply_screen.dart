import 'package:get/get.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/controllers/loan_apply_controller.dart';
import 'package:wireframe/loan_type_flow/current_residence_type.dart';
import 'package:wireframe/loan_type_flow/select_city_page.dart';
import 'package:wireframe/loan_type_flow/select_loanamt_page.dart';
import 'package:wireframe/loan_type_flow/select_state_page.dart';
import 'package:wireframe/loan_type_flow/step1.dart';
import 'package:wireframe/loan_type_flow/step2.dart';
import 'package:wireframe/loan_type_flow/step3.dart';
import 'package:wireframe/screens/business_loan/business_city.dart';
import 'package:wireframe/screens/business_loan/company_type.dart';
import 'package:wireframe/screens/business_loan/select_business_loan_amt_page.dart';
import 'package:wireframe/screens/business_loan/year_in_current_business.dart';
import 'package:wireframe/screens/car_loan/vehicle_details_screen.dart';
import 'package:wireframe/screens/gold_loan/gold_weight_screen.dart';
import 'package:wireframe/screens/home_loan/home_loan_first.dart';
import 'package:wireframe/screens/home_loan/home_loan_second.dart';
import 'package:wireframe/screens/home_loan/home_loan_third.dart';
import 'package:wireframe/screens/home_loan_tranfer/past_loan_time_screen.dart';
import 'package:wireframe/screens/home_loan_tranfer/require_topup_amount_screen.dart';
import 'package:wireframe/screens/mortage_loan/mortage_loan_first.dart';
import 'package:wireframe/screens/mortage_loan/mortage_loan_second.dart';
import 'package:wireframe/screens/mortage_loan/mortage_loan_third.dart';
import 'package:wireframe/screens/pre_approved_loans_screen.dart';

class LoanApplyScreen extends StatefulWidget {
  final String title;
  final String loanTypeId;

  const LoanApplyScreen({
    Key? key,
    required this.title,
    required this.loanTypeId,
  }) : super(key: key);

  @override
  State<LoanApplyScreen> createState() => _LoanApplyScreenState();
}

class _LoanApplyScreenState extends State<LoanApplyScreen> {
  int _currentStep = 0;
  late final int _totalSteps;
  late PageController _pageController;
  LoanApplyController controller = Get.put(LoanApplyController());

  @override
  void initState() {
    super.initState();
    controller.reset();
    if (widget.title != "") {
      if (widget.title == "Personal Loan") {
        _totalSteps = 6;
      } else if (widget.title == "Business Loan") {
        _totalSteps = 7;
      } else if (widget.title == "Gold Loan") {
        _totalSteps = 6;
      } else if (widget.title == "Reused Car Loan") {
        _totalSteps = 6;
      } else if (widget.title == "Topup") {
        _totalSteps = 6;
      } else if (widget.title == "Transfer Personal Loan") {
        _totalSteps = 8;
      } else {
        _totalSteps = 6;
      }
      _pageController = PageController(initialPage: _currentStep);
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _incrementStep() {
    if (_currentStep < _totalSteps - 1) {
      setState(() {
        _currentStep++;
      });
      _pageController.animateToPage(
        _currentStep,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PreApprovedLoanScreen(
            loanTypeId: widget.loanTypeId,
            controller: controller,
            loanType: widget.title,
          ),
        ),
      );
    }
  }

  void _decrementedStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
      _pageController.animateToPage(
        _currentStep,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool willLeave = false;
        if (_currentStep > 0) {
          setState(() {
            _currentStep--;
          });
          _pageController.animateToPage(
            _currentStep,
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
          );
          return false;
        } else {
          Navigator.pop(context);
          return willLeave;
        }
      },
      child: Scaffold(
        backgroundColor: screenBgCl,
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: whiteColor,
            centerTitle: false,
            bottom: PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width, 2),
              child: ProgressIndicatorWidget(
                  currentStep: _currentStep, totalSteps: _totalSteps),
            ),
            title: Stack(children: [
              Row(
                children: [
                  InkWell(
                      onTap: () {
                        if (_currentStep > 0) {
                          setState(() {
                            _currentStep--;
                          });
                          _pageController.animateToPage(
                            _currentStep,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        } else {
                          Navigator.pop(context);
                        }
                      },
                      child: Image.asset(
                        icBack,
                        height: 24,
                        width: 24,
                      )),
                  SizedBox(width: 10),
                  Image.asset(
                    imgCommonLogo,
                    height: 25,
                    fit: BoxFit.contain,
                  )
                ],
              ),
            ])),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      color: textGeryCl,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      fontFamily: medium,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    'Steps ${_currentStep + 1}/$_totalSteps',
                    style: const TextStyle(
                      color: textGeryCl,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      fontFamily: medium,
                      fontSize: 12,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 8),
              Expanded(
                child: widget.title == "Personal Loan"
                    ? PageView(
                        controller: _pageController,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          Step1(
                            onNext: _incrementStep,
                            onPrevious: _decrementedStep,
                            controller: controller,
                            loanTypeId: widget.loanTypeId,
                            isPersonal: true,
                            isBusiness: false,
                          ),
                          SelectLoanAmountPage(
                            onNext: _incrementStep,
                            onPrevious: _decrementedStep,
                            controller: controller,
                            loanTypeId: widget.loanTypeId,
                          ),
                          Step2(
                            onNext: _incrementStep,
                            onPrevious: _decrementedStep,
                            controller: controller,
                            loanTypeId: widget.loanTypeId,
                            employmentId: controller.employmentId.value,
                          ),
                          SelectStatePage(
                            onNext: _incrementStep,
                            onPrevious: _decrementedStep,
                            controller: controller,
                            loanTypeId: widget.loanTypeId,
                          ),
                          SelectCityPage(
                            onNext: _incrementStep,
                            onPrevious: _decrementedStep,
                            controller: controller,
                            loanTypeId: widget.loanTypeId,
                          ),
                          CurrentResidenceType(
                            onNext: _incrementStep,
                            onPrevious: _decrementedStep,
                            controller: controller,
                            loanTypeId: widget.loanTypeId,
                          ),
                        ],
                      )
                    : widget.title == "Home Loan"
                        ? PageView(
                            controller: _pageController,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              Step1(
                                onNext: _incrementStep,
                                onPrevious: _decrementedStep,
                                controller: controller,
                                loanTypeId: widget.loanTypeId,
                                isPersonal: false,
                                isBusiness: false,
                              ),
                              HomeLoan1(
                                onNext: _incrementStep,
                                onPrevious: _decrementedStep,
                                loanTypeId: widget.loanTypeId,
                                controller: controller,
                              ),
                              Step2(
                                onNext: _incrementStep,
                                onPrevious: _decrementedStep,
                                controller: controller,
                                loanTypeId: widget.loanTypeId,
                                employmentId: controller.employmentId.value,
                              ),
                              SelectStatePage(
                                onNext: _incrementStep,
                                onPrevious: _decrementedStep,
                                controller: controller,
                                loanTypeId: widget.loanTypeId,
                              ),
                              HomeLoan2(
                                onNext: _incrementStep,
                                onPrevious: _decrementedStep,
                                loanTypeId: widget.loanTypeId,
                                controller: controller,
                              ),
                              HomeLoan3(
                                onNext: _incrementStep,
                                onPrevious: _decrementedStep,
                                loanTypeId: widget.loanTypeId,
                                controller: controller,
                              ),
                            ],
                          )
                        : widget.title == "Business Loan"
                            ? PageView(
                                controller: _pageController,
                                physics: const NeverScrollableScrollPhysics(),
                                children: [
                                  Step1(
                                    onNext: _incrementStep,
                                    onPrevious: _decrementedStep,
                                    controller: controller,
                                    loanTypeId: widget.loanTypeId,
                                    isPersonal: false,
                                    isBusiness: true,
                                  ),
                                  SelectBusinessLoanAmountPage(
                                    onNext: _incrementStep,
                                    loanTypeId: widget.loanTypeId,
                                    controller: controller,
                                    onPrevious: _decrementedStep,
                                  ),
                                  Step2(
                                    onNext: _incrementStep,
                                    onPrevious: _decrementedStep,
                                    controller: controller,
                                    loanTypeId: widget.loanTypeId,
                                    employmentId: controller.employmentId.value,
                                  ),
                                  SelectStatePage(
                                    onNext: _incrementStep,
                                    onPrevious: _decrementedStep,
                                    controller: controller,
                                    loanTypeId: widget.loanTypeId,
                                  ),
                                  CurrentBusinessCity(
                                    onNext: _incrementStep,
                                    loanTypeId: widget.loanTypeId,
                                    controller: controller,
                                    onPrevious: _decrementedStep,
                                  ),
                                  YearInCurrentBusiness(
                                    onNext: _incrementStep,
                                    loanTypeId: widget.loanTypeId,
                                    controller: controller,
                                    onPrevious: _decrementedStep,
                                  ),
                                  CompanyType(
                                    onNext: _incrementStep,
                                    loanTypeId: widget.loanTypeId,
                                    controller: controller,
                                    onPrevious: _decrementedStep,
                                  ),
                                ],
                              )
                            : widget.title == "Gold Loan"
                                ? PageView(
                                    controller: _pageController,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    children: [
                                      Step1(
                                        onNext: _incrementStep,
                                        onPrevious: _decrementedStep,
                                        controller: controller,
                                        loanTypeId: widget.loanTypeId,
                                        isPersonal: false,
                                        isBusiness: false,
                                      ),
                                      SelectStatePage(
                                        onNext: _incrementStep,
                                        onPrevious: _decrementedStep,
                                        controller: controller,
                                        loanTypeId: widget.loanTypeId,
                                      ),
                                      SelectCityPage(
                                        onNext: _incrementStep,
                                        onPrevious: _decrementedStep,
                                        controller: controller,
                                        loanTypeId: widget.loanTypeId,
                                      ),
                                      GoldWeightScreen(
                                        onNext: _incrementStep,
                                        onPrevious: _decrementedStep,
                                        controller: controller,
                                        loanTypeId: widget.loanTypeId,
                                      ),
                                      SelectLoanAmountPage(
                                        onNext: _incrementStep,
                                        onPrevious: _decrementedStep,
                                        controller: controller,
                                        loanTypeId: widget.loanTypeId,
                                      ),
                                      HomeLoan3(
                                        onNext: _incrementStep,
                                        onPrevious: _decrementedStep,
                                        loanTypeId: widget.loanTypeId,
                                        controller: controller,
                                      ),
                                    ],
                                  )
                                : widget.title == "Topup"
                                    ? PageView(
                                        controller: _pageController,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        children: [
                                          Step1(
                                            onNext: _incrementStep,
                                            onPrevious: _decrementedStep,
                                            controller: controller,
                                            loanTypeId: widget.loanTypeId,
                                            isPersonal: false,
                                            isBusiness: false,
                                          ),
                                          SelectLoanAmountPage(
                                            onNext: _incrementStep,
                                            onPrevious: _decrementedStep,
                                            controller: controller,
                                            loanTypeId: widget.loanTypeId,
                                          ),
                                          RequireTopUpAmountScreen(
                                            onNext: _incrementStep,
                                            onPrevious: _decrementedStep,
                                            controller: controller,
                                            loanTypeId: widget.loanTypeId,
                                          ),
                                          Step3(
                                            onNext: _incrementStep,
                                            onPrevious: _decrementedStep,
                                            controller: controller,
                                            loanTypeId: widget.loanTypeId,
                                            tittle:
                                                "Select your existing home loan bank",
                                          ),
                                          PastLoanTimeScreen(
                                            onNext: _incrementStep,
                                            onPrevious: _decrementedStep,
                                            controller: controller,
                                            loanTypeId: widget.loanTypeId,
                                            tittle:
                                                "How old is your existing home loan?",
                                          ),
                                          HomeLoan3(
                                            onNext: _incrementStep,
                                            onPrevious: _decrementedStep,
                                            loanTypeId: widget.loanTypeId,
                                            controller: controller,
                                          ),
                                        ],
                                      )
                                    : widget.title == "Transfer Personal Loan"
                                        ? PageView(
                                            controller: _pageController,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            children: [
                                              Step1(
                                                onNext: _incrementStep,
                                                onPrevious: _decrementedStep,
                                                controller: controller,
                                                loanTypeId: widget.loanTypeId,
                                                isPersonal: false,
                                                isBusiness: false,
                                              ),
                                              Step2(
                                                onNext: _incrementStep,
                                                onPrevious: _decrementedStep,
                                                controller: controller,
                                                loanTypeId: widget.loanTypeId,
                                                employmentId: controller
                                                    .employmentId.value,
                                              ),
                                              Step3(
                                                onNext: _incrementStep,
                                                onPrevious: _decrementedStep,
                                                controller: controller,
                                                loanTypeId: widget.loanTypeId,
                                                tittle:
                                                    "Select your salary bank account",
                                              ),
                                              SelectStatePage(
                                                onNext: _incrementStep,
                                                onPrevious: _decrementedStep,
                                                controller: controller,
                                                loanTypeId: widget.loanTypeId,
                                              ),
                                              SelectCityPage(
                                                onNext: _incrementStep,
                                                onPrevious: _decrementedStep,
                                                controller: controller,
                                                loanTypeId: widget.loanTypeId,
                                              ),
                                              CurrentResidenceType(
                                                onNext: _incrementStep,
                                                onPrevious: _decrementedStep,
                                                controller: controller,
                                                loanTypeId: widget.loanTypeId,
                                              ),
                                              SelectLoanAmountPage(
                                                onNext: _incrementStep,
                                                onPrevious: _decrementedStep,
                                                controller: controller,
                                                loanTypeId: widget.loanTypeId,
                                              ),
                                              HomeLoan3(
                                                onNext: _incrementStep,
                                                onPrevious: _decrementedStep,
                                                loanTypeId: widget.loanTypeId,
                                                controller: controller,
                                              ),
                                            ],
                                          )
                                        : widget.title == "Reused Car Loan"
                                            ? PageView(
                                                controller: _pageController,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                children: [
                                                  Step1(
                                                    onNext: _incrementStep,
                                                    onPrevious:
                                                        _decrementedStep,
                                                    controller: controller,
                                                    loanTypeId:
                                                        widget.loanTypeId,
                                                    isPersonal: false,
                                                    isBusiness: false,
                                                  ),
                                                  SelectStatePage(
                                                    onNext: _incrementStep,
                                                    onPrevious:
                                                        _decrementedStep,
                                                    controller: controller,
                                                    loanTypeId:
                                                        widget.loanTypeId,
                                                  ),
                                                  SelectCityPage(
                                                    onNext: _incrementStep,
                                                    onPrevious:
                                                        _decrementedStep,
                                                    controller: controller,
                                                    loanTypeId:
                                                        widget.loanTypeId,
                                                  ),
                                                  VehicleDetailsScreen(
                                                    onNext: _incrementStep,
                                                    onPrevious:
                                                        _decrementedStep,
                                                    controller: controller,
                                                    loanTypeId:
                                                        widget.loanTypeId,
                                                  ),
                                                  SelectLoanAmountPage(
                                                    onNext: _incrementStep,
                                                    onPrevious:
                                                        _decrementedStep,
                                                    controller: controller,
                                                    loanTypeId:
                                                        widget.loanTypeId,
                                                  ),
                                                  HomeLoan3(
                                                    onNext: _incrementStep,
                                                    onPrevious:
                                                        _decrementedStep,
                                                    loanTypeId:
                                                        widget.loanTypeId,
                                                    controller: controller,
                                                  ),
                                                ],
                                              )
                                            : PageView(
                                                controller: _pageController,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                children: [
                                                  Step1(
                                                    onNext: _incrementStep,
                                                    onPrevious:
                                                        _decrementedStep,
                                                    controller: controller,
                                                    loanTypeId:
                                                        widget.loanTypeId,
                                                    isPersonal: false,
                                                    isBusiness: false,
                                                  ),
                                                  MortageLoan1(
                                                    onNext: _incrementStep,
                                                    onPrevious:
                                                        _decrementedStep,
                                                    loanTypeId:
                                                        widget.loanTypeId,
                                                    controller: controller,
                                                  ),
                                                  Step2(
                                                    onNext: _incrementStep,
                                                    onPrevious:
                                                        _decrementedStep,
                                                    controller: controller,
                                                    loanTypeId:
                                                        widget.loanTypeId,
                                                    employmentId: controller
                                                        .employmentId.value,
                                                  ),
                                                  SelectStatePage(
                                                    onNext: _incrementStep,
                                                    onPrevious:
                                                        _decrementedStep,
                                                    controller: controller,
                                                    loanTypeId:
                                                        widget.loanTypeId,
                                                  ),
                                                  MortageLoan2(
                                                    onNext: _incrementStep,
                                                    onPrevious:
                                                        _decrementedStep,
                                                    loanTypeId:
                                                        widget.loanTypeId,
                                                    controller: controller,
                                                  ),
                                                  MortageLoan3(
                                                    onNext: _incrementStep,
                                                    onPrevious:
                                                        _decrementedStep,
                                                    loanTypeId:
                                                        widget.loanTypeId,
                                                    controller: controller,
                                                  ),
                                                ],
                                              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProgressIndicatorWidget extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const ProgressIndicatorWidget({
    Key? key,
    required this.currentStep,
    required this.totalSteps,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double progress = (currentStep / totalSteps).clamp(0.0, 1.0);
    return RoundedLinearProgressIndicator(
      value: progress,
      color: primaryClNew,
      backgroundColor: otherCl,
      height: 2.0,
      borderRadius: BorderRadius.circular(10.0),
    );
  }
}

class RoundedLinearProgressIndicator extends StatelessWidget {
  final double value;
  final Color color;
  final Color backgroundColor;
  final double height;
  final BorderRadius borderRadius;

  const RoundedLinearProgressIndicator({
    Key? key,
    required this.value,
    this.color = secondaryCl,
    this.backgroundColor = otherCl,
    this.height = 10.0,
    this.borderRadius = const BorderRadius.all(Radius.circular(10.0)),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: LinearProgressIndicator(
        value: value,
        valueColor: AlwaysStoppedAnimation<Color>(color),
        backgroundColor: backgroundColor,
        minHeight: height,
      ),
    );
  }
}
