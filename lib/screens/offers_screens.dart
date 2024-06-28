import 'dart:math' as math;
import 'dart:math';

import 'package:get/get.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/constants/util.dart';
import 'package:wireframe/controllers/bank_offers_controller.dart';
import 'package:wireframe/service/api_logs.dart';

import '../widget/text_filled_widget.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({super.key});

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  BankOfferListController controller = Get.put(BankOfferListController());
  String accountType = "";
  double valueMonthly = 20000;
  double valueOtherEmi = 0;
  int valueLoanTenure = 5;
  double valueInterestRate = 9;
  double emi = 0;
  double loanAmount = 0;
  double totalPayable = 0;
  bool isEligible = true;

  @override
  void initState() {
    checkEligibility(valueMonthly, valueOtherEmi, valueInterestRate, valueLoanTenure);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<BankOfferListController>(),
      initState: (state) {
        Get.find<BankOfferListController>().getEmploymentList("");
      },
      builder: (cont) {
        return Scaffold(
          backgroundColor: whiteColor,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 14,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 17),
                  child: Text(
                    "How much are you looking for?",
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: textHeading,
                      overflow: TextOverflow.ellipsis,
                      fontFamily: semiBold,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 17),
                  child: Text(
                    "Select your loan amount above and elevate your Loan.",
                    maxLines: 2,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: textHeading,
                      overflow: TextOverflow.ellipsis,
                      fontFamily: regular,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Monthly Income",
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: textHeading,
                          overflow: TextOverflow.ellipsis,
                          fontFamily: semiBold,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(color: appBarClNew1, borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          "₹ ${valueMonthly.toInt()}",
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: textHeading,
                            overflow: TextOverflow.ellipsis,
                            fontFamily: medium,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      /*MyTextFormField(
                        controller: controller.monthlyIncome,
                        counterText: "",
                        hint: 'Enter mobile number',
                        obscureText: false,
                        readOnly: false,
                        border: borderNewCl,
                        fillColor: whiteColor,
                        validator: (v) {
                          if (v!.isEmpty) {
                            return "Enter Mobile No.";
                          } else if (v.length > 7) {
                            return "Enter valid monthly income";
                          } else if(v.length ==7 && v!="1000000"){
                            return "Max monthly income should be 1000000";
                          }
                          return null;
                        },
                        onChanged: (v) {
                          setState(() {
                            valueMonthly = double.parse(v);
                          });
                        },
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                      )*/
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 8.0,
                    trackShape: const RoundedRectSliderTrackShape(),
                    activeTrackColor: primaryClNew,
                    inactiveTrackColor: const Color(0xFFE8E8E8),
                    thumbShape: const CustomSliderThumbShape(
                      thumbWidth: 18.93,
                      thumbHeight: 18.93,
                      thumbColor: Colors.black,
                      shadowX: 0,
                      shadowY: 2,
                      shadowBlur: 4,
                      shadowSpread: 0,
                      shadowColor: Colors.black,
                      borderWidth: 1,
                      borderColor: Colors.white,
                    ),
                    overlayColor: Colors.pink.withOpacity(0.2),
                    overlayShape: const RoundSliderOverlayShape(overlayRadius: 17.0),
                    tickMarkShape: const RoundSliderTickMarkShape(),
                    activeTickMarkColor: Colors.pinkAccent,
                    inactiveTickMarkColor: Colors.white,
                    valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
                    valueIndicatorColor: Colors.black,
                    valueIndicatorTextStyle: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  child: Slider(
                    min: 5000.0,
                    max: 1000000.0,
                    value: valueMonthly,
                    label: '${valueMonthly.round()}',
                    onChanged: (value) {
                      setState(() {
                        valueMonthly = value;
                        checkEligibility(valueMonthly, valueOtherEmi, valueInterestRate, valueLoanTenure);
                      });
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 17),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "₹5000",
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: textHeading,
                          overflow: TextOverflow.ellipsis,
                          fontFamily: semiBold,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          fontSize: 8,
                        ),
                      ),
                      Text(
                        "₹1000000",
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: textHeading,
                          overflow: TextOverflow.ellipsis,
                          fontFamily: semiBold,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          fontSize: 8,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Other Existing EMIs (Monthly)",
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: textHeading,
                          overflow: TextOverflow.ellipsis,
                          fontFamily: semiBold,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 8),
                        decoration: BoxDecoration(color: appBarClNew1, borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          "₹ ${valueOtherEmi.toInt()}",
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: textHeading,
                            overflow: TextOverflow.ellipsis,
                            fontFamily: medium,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 8.0,
                    trackShape: const RoundedRectSliderTrackShape(),
                    activeTrackColor: primaryClNew,
                    inactiveTrackColor: const Color(0xFFE8E8E8),
                    thumbShape: const CustomSliderThumbShape(
                      thumbWidth: 18.93,
                      thumbHeight: 18.93,
                      thumbColor: Colors.black,
                      shadowX: 0,
                      shadowY: 2,
                      shadowBlur: 4,
                      shadowSpread: 0,
                      shadowColor: Colors.black,
                      borderWidth: 1,
                      borderColor: Colors.white,
                    ),
                    overlayColor: Colors.pink.withOpacity(0.2),
                    overlayShape: const RoundSliderOverlayShape(overlayRadius: 17.0),
                    tickMarkShape: const RoundSliderTickMarkShape(),
                    activeTickMarkColor: Colors.pinkAccent,
                    inactiveTickMarkColor: Colors.white,
                    valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
                    valueIndicatorColor: Colors.black,
                    valueIndicatorTextStyle: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  child: Slider(
                    min: 0.0,
                    max: 1000000.0,
                    value: valueOtherEmi,
                    label: '${valueOtherEmi.round()}',
                    onChanged: (value) {
                      setState(() {
                        valueOtherEmi = value;
                        checkEligibility(valueMonthly, valueOtherEmi, valueInterestRate, valueLoanTenure);
                        if (isEligible == false) {
                          errorToast("Sorry, we are unable to show any eligibility as the current EMI being served is higher than the eligible EMI");
                        } else {}
                      });
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 17),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "₹0",
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: textHeading,
                          overflow: TextOverflow.ellipsis,
                          fontFamily: semiBold,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          fontSize: 8,
                        ),
                      ),
                      Text(
                        "₹1000000",
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: textHeading,
                          overflow: TextOverflow.ellipsis,
                          fontFamily: semiBold,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          fontSize: 8,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Loan Tenure",
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: textHeading,
                          overflow: TextOverflow.ellipsis,
                          fontFamily: semiBold,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 8),
                        decoration: BoxDecoration(color: appBarClNew1, borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          "${valueLoanTenure.toInt()} Years",
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: textHeading,
                            overflow: TextOverflow.ellipsis,
                            fontFamily: medium,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 8.0,
                    trackShape: const RoundedRectSliderTrackShape(),
                    activeTrackColor: primaryClNew,
                    inactiveTrackColor: const Color(0xFFE8E8E8),
                    thumbShape: const CustomSliderThumbShape(
                      thumbWidth: 18.93,
                      thumbHeight: 18.93,
                      thumbColor: Colors.black,
                      shadowX: 0,
                      shadowY: 2,
                      shadowBlur: 4,
                      shadowSpread: 0,
                      shadowColor: Colors.black,
                      borderWidth: 1,
                      borderColor: Colors.white,
                    ),
                    overlayColor: Colors.pink.withOpacity(0.2),
                    overlayShape: const RoundSliderOverlayShape(overlayRadius: 17.0),
                    tickMarkShape: const RoundSliderTickMarkShape(),
                    activeTickMarkColor: Colors.pinkAccent,
                    inactiveTickMarkColor: Colors.white,
                    valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
                    valueIndicatorColor: Colors.black,
                    valueIndicatorTextStyle: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  child: Slider(
                    min: 0.0,
                    max: 30.0,
                    value: valueLoanTenure.toDouble(),
                    label: '${valueLoanTenure.round()}',
                    onChanged: (value) {
                      setState(() {
                        valueLoanTenure = value.toInt();
                        checkEligibility(valueMonthly, valueOtherEmi, valueInterestRate, valueLoanTenure);
                      });
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 17),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "3 Years",
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: textHeading,
                          overflow: TextOverflow.ellipsis,
                          fontFamily: semiBold,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          fontSize: 8,
                        ),
                      ),
                      Text(
                        "30 Years",
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: textHeading,
                          overflow: TextOverflow.ellipsis,
                          fontFamily: semiBold,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          fontSize: 8,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Interest rate",
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: textHeading,
                          overflow: TextOverflow.ellipsis,
                          fontFamily: semiBold,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 8),
                        decoration: BoxDecoration(color: appBarClNew1, borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          "${valueInterestRate}%",
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: textHeading,
                            overflow: TextOverflow.ellipsis,
                            fontFamily: medium,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 8.0,
                    trackShape: const RoundedRectSliderTrackShape(),
                    activeTrackColor: primaryClNew,
                    inactiveTrackColor: const Color(0xFFE8E8E8),
                    thumbShape: const CustomSliderThumbShape(
                      thumbWidth: 18.93,
                      thumbHeight: 18.93,
                      thumbColor: Colors.black,
                      shadowX: 0,
                      shadowY: 2,
                      shadowBlur: 4,
                      shadowSpread: 0,
                      shadowColor: Colors.black,
                      borderWidth: 1,
                      borderColor: Colors.white,
                    ),
                    overlayColor: Colors.pink.withOpacity(0.2),
                    overlayShape: const RoundSliderOverlayShape(overlayRadius: 17.0),
                    tickMarkShape: const RoundSliderTickMarkShape(),
                    activeTickMarkColor: Colors.pinkAccent,
                    inactiveTickMarkColor: Colors.white,
                    valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
                    valueIndicatorColor: Colors.black,
                    valueIndicatorTextStyle: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  child: Slider(
                    min: 7.0,
                    max: 18.0,
                    value: double.parse(valueInterestRate.toStringAsFixed(2)),
                    label: '${double.parse(valueInterestRate.toStringAsFixed(2))}',
                    onChanged: (value) {
                      setState(() {
                        valueInterestRate = double.parse(value.toStringAsFixed(2));
                        checkEligibility(valueMonthly, valueOtherEmi, valueInterestRate, valueLoanTenure);
                      });
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 17),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "7%",
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: textHeading,
                          overflow: TextOverflow.ellipsis,
                          fontFamily: semiBold,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          fontSize: 8,
                        ),
                      ),
                      Text(
                        "18%",
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: textHeading,
                          overflow: TextOverflow.ellipsis,
                          fontFamily: semiBold,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          fontSize: 8,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                  decoration: const BoxDecoration(color: appBarClNew1),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 14),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: primaryClNew.withOpacity(0.43), width: 1)),
                        child: Column(
                          children: [
                            const Text(
                              "You Are Eligible For Total amount",
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: textHeading,
                                overflow: TextOverflow.ellipsis,
                                fontFamily: semiBold,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "₹${loanAmount.toInt()}",
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: primaryClNew,
                                overflow: TextOverflow.ellipsis,
                                fontFamily: semiBold,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 14),
                      const Text(
                        "Equated monthly installment",
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: textHeading,
                          overflow: TextOverflow.ellipsis,
                          fontFamily: semiBold,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        "₹${emi.toInt()}",
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: primaryClNew,
                          overflow: TextOverflow.ellipsis,
                          fontFamily: semiBold,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: primaryClNew.withOpacity(0.43), width: 1)),
                        child: Column(
                          children: [
                            const Text(
                              "Total Payable with Principal And Tenure",
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: textHeading,
                                overflow: TextOverflow.ellipsis,
                                fontFamily: semiBold,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "₹${totalPayable.toInt()}",
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: primaryClNew,
                                overflow: TextOverflow.ellipsis,
                                fontFamily: semiBold,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }

  double calculateLoanAmount(double monthlyIncome) {
    const double incomeFactor = 26.49535;
    return monthlyIncome * incomeFactor;
  }

  void checkEligibility(double monthlyIncome, double otherEmi, double interestRate, int loanTenure) {
    double maxEmi = (monthlyIncome*0.5) - otherEmi;
    //double loanAmount = calculateLoanAmount(monthlyIncome);

    //double emi = calculateEMI(loanAmount, interestRate, loanTenure);

    if(otherEmi>monthlyIncome*0.5){
      //double totalPayable = emi * loanTenure * 12;
      setState(() {
        isEligible = false;
        this.loanAmount = 0;
        this.emi = 0;
        this.totalPayable = 0;
      });
      return;
    }else{
      double loanAmount = calculateMaxLoanAmount(maxEmi, interestRate, loanTenure);
      double totalPayable = maxEmi * loanTenure * 12;
      setState(() {
        this.loanAmount = loanAmount;
        this.emi = maxEmi;
        this.totalPayable = totalPayable;
        isEligible = true;
      });
    }
  }

  /*double calculateEMI(double principal, double annualInterestRate, int loanTermInYears) {
    double monthlyInterestRate = (annualInterestRate / 12) / 100;
    int loanTermInMonths = loanTermInYears * 12;
    double emi = (principal * monthlyInterestRate * math.pow(1 + monthlyInterestRate, loanTermInMonths)) / (math.pow(1 + monthlyInterestRate, loanTermInMonths) - 1);
    return emi;
  }*/

  double calculateMaxLoanAmount(double maxEmi, double annualInterestRate, int tenureInYears) {
    double monthlyInterestRate = annualInterestRate / 12 / 100;
    int tenureInMonths = tenureInYears * 12;

    double denominator = monthlyInterestRate * pow((1 + monthlyInterestRate), tenureInMonths);
    double numerator = maxEmi * (pow((1 + monthlyInterestRate), tenureInMonths) - 1);

    double maxLoanAmount = numerator / denominator;
    return maxLoanAmount;
  }
}

class CustomSliderThumbShape extends SliderComponentShape {
  final double thumbWidth;
  final double thumbHeight;
  final Color thumbColor;
  final double shadowX;
  final double shadowY;
  final double shadowBlur;
  final double shadowSpread;
  final Color shadowColor;
  final double borderWidth;
  final Color borderColor;

  const CustomSliderThumbShape({
    this.thumbWidth = 18.93,
    this.thumbHeight = 18.93,
    this.thumbColor = Colors.pinkAccent,
    this.shadowX = 0,
    this.shadowY = 2,
    this.shadowBlur = 4,
    this.shadowSpread = 0,
    this.shadowColor = Colors.black,
    this.borderWidth = 1,
    this.borderColor = Colors.white,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(thumbWidth, thumbHeight);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required Size sizeWithOverflow,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double textScaleFactor,
    required double value,
  }) {
    final Canvas canvas = context.canvas;

    final rect = Rect.fromCenter(
      center: center,
      width: thumbWidth,
      height: thumbHeight,
    );

    final Paint paint = Paint()
      ..color = thumbColor
      ..style = PaintingStyle.fill;

    final Paint shadowPaint = Paint()
      ..color = shadowColor.withOpacity(0.2)
      ..maskFilter = MaskFilter.blur(
        BlurStyle.normal,
        shadowBlur,
      );

    final Paint borderPaint = Paint()
      ..color = borderColor
      ..strokeWidth = borderWidth
      ..style = PaintingStyle.stroke;

    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, Radius.circular(thumbWidth / 2)),
      shadowPaint,
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, Radius.circular(thumbWidth / 2)),
      paint,
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, Radius.circular(thumbWidth / 2)),
      borderPaint,
    );

    const double circleRadius = 4.0;
    final Paint circlePaint = Paint()..color = Colors.white;
    final Offset circleCenter = center;
    canvas.drawCircle(circleCenter, circleRadius, circlePaint);
  }
}
