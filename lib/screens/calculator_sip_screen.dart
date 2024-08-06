import 'dart:math' as math;

import 'package:intl/intl.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/widget/my_button.dart';
import 'package:wireframe/widget/text_filled_widget.dart';

class CalculatorSIPScreen extends StatefulWidget {
  const CalculatorSIPScreen({super.key});

  @override
  State<CalculatorSIPScreen> createState() => _CalculatorSIPScreenState();
}

class _CalculatorSIPScreenState extends State<CalculatorSIPScreen> {
  TextEditingController monthlySIPAmountController = TextEditingController();
  TextEditingController returnTimeController = TextEditingController();
  TextEditingController rateController = TextEditingController();

  double requiredInvestment = 0.0;
  int numberOfSIPs = 0;
  double wealthGained = 0.0;
  double investedAmount = 0.0;
  double totalWealth = 0.0;

  String formatCurrency(double amount) {
    try {
      final numberFormatter = NumberFormat("#,##,##0.00", "en_IN");
      return numberFormatter.format(amount);
    } catch (e) {
      return "N/A";
    }
  }

  void calculateInvestment() {
    double sipAmount = double.parse(monthlySIPAmountController.text);
    int returnTimeInYears = int.parse(returnTimeController.text);
    double annualRate = double.parse(rateController.text) / 100;

    double monthlyRate = annualRate / 12;
    int numberOfMonths = returnTimeInYears * 12;

    double futureValue = sipAmount * (math.pow(1 + monthlyRate, numberOfMonths) - 1) / monthlyRate * (1 + monthlyRate);

    investedAmount = sipAmount * numberOfMonths;
    totalWealth = futureValue;
    wealthGained = futureValue - investedAmount;

    setState(() {
      requiredInvestment = futureValue;
      numberOfSIPs = numberOfMonths;
    });
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
            padding: const EdgeInsets.symmetric(horizontal: 16),
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
                  "SIP Calculator",
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
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(height: 14),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Monthly SIP Amount",
                  style: TextStyle(
                    color: textColorSec,
                    fontFamily: medium,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              MyTextFormField(
                controller: monthlySIPAmountController,
                hint: "Monthly SIP Amount",
                fillColor: Colors.white,
                obscureText: false,
                readOnly: false,
                keyboardType: TextInputType.number,
                border: primaryCl,
              ),
              const SizedBox(height: 14),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Interest %",
                  style: TextStyle(
                    color: textColorSec,
                    fontFamily: medium,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              MyTextFormField(
                controller: rateController,
                hint: "Interest %",
                fillColor: Colors.white,
                keyboardType: TextInputType.number,
                obscureText: false,
                readOnly: false,
                border: primaryCl,
              ),
              const SizedBox(height: 14),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Years",
                  style: TextStyle(
                    color: textColorSec,
                    fontFamily: medium,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              MyTextFormField(
                controller: returnTimeController,
                hint: "Years",
                fillColor: Colors.white,
                keyboardType: TextInputType.number,
                obscureText: false,
                readOnly: false,
                border: primaryCl,
              ),
              const SizedBox(height: 24),
              Container(
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                width: MediaQuery.of(context).size.width,
                child: MyButton(
                  onPressed: calculateInvestment,
                  color: primaryClNew,
                  child: const Text(
                    "Calculate",
                    style: TextStyle(
                      color: whiteColor,
                      fontFamily: semiBold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              sipResultsWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget sipResultsWidget() {
    bool canShow = investedAmount > 0;

    return canShow
        ? Container(
            padding: const EdgeInsets.all(15),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: borderNew, width: 0.4),
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.only(top: 20.0),
            child: Column(
              children: [
                const SizedBox(height: 7),
                const Divider(
                  color: greyNew,
                  height: 2,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Wealth Gained",
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                              color: greyNew,
                              fontFamily: medium,
                            ),
                          ),
                          Text(
                            "₹ ${formatCurrency(wealthGained)}",
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              fontFamily: semiBold,
                              fontStyle: FontStyle.normal,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                      width: 1,
                      child: VerticalDivider(color: greyNew),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Invested Amount",
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                              color: greyNew,
                              fontFamily: medium,
                            ),
                          ),
                          Text(
                            "₹ ${formatCurrency(investedAmount)}",
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              fontFamily: semiBold,
                              fontStyle: FontStyle.normal,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: greyNew,
                  height: 2,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Total Wealth",
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                              color: greyNew,
                              fontFamily: medium,
                            ),
                          ),
                          Text(
                            "₹ ${formatCurrency(totalWealth)}",
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              fontFamily: semiBold,
                              fontStyle: FontStyle.normal,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                      width: 1,
                      child: VerticalDivider(color: greyNew),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Total SIP Installments",
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                              color: greyNew,
                              fontFamily: medium,
                            ),
                          ),
                          Text(
                            "$numberOfSIPs",
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              fontFamily: semiBold,
                              fontStyle: FontStyle.normal,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: greyNew,
                  height: 2,
                ),
                const SizedBox(height: 7),
              ],
            ),
          )
        : Container();
  }
}
