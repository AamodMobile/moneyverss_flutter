import 'dart:math' as math;

import 'package:intl/intl.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/widget/my_button.dart';
import 'package:wireframe/widget/text_filled_widget.dart';

class CalculatorTenureScreen extends StatefulWidget {
  const CalculatorTenureScreen({super.key});

  @override
  State<CalculatorTenureScreen> createState() => _CalculatorTenureScreenState();
}

class _CalculatorTenureScreenState extends State<CalculatorTenureScreen> {
  String tenure = "";
  String _totalInterest = "";
  String _totalAmount = "";
  final TextEditingController principalAmount = TextEditingController();
  final TextEditingController emiAmount = TextEditingController();
  final TextEditingController _interestRate = TextEditingController();

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
                    "Tenure Calculator",
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
                    "Principal Amount",
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
                  controller: principalAmount,
                  hint: "Enter Principal Amount",
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
                    "EMI Amount",
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
                  controller: emiAmount,
                  hint: "Enter EMI Amount",
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
                    "Interest Rate (%)",
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
                  controller: _interestRate,
                  hint: "Enter Interest Rate",
                  fillColor: Colors.white,
                  keyboardType: TextInputType.number,
                  obscureText: false,
                  readOnly: false,
                  border: primaryCl,
                ),
                const SizedBox(height: 24),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: MyButton(
                    onPressed: _handleCalculation,
                    color: primaryClNew,
                    child: const Text(
                      "Calculate",
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
                emiResultsWidget(tenure, _totalInterest, _totalAmount)
              ],
            ),
          )),
    );
  }

  String formatCurrency(double amount) {
    try {
      final numberFormatter = NumberFormat("#,##,##0.00", "en_IN");
      return numberFormatter.format(amount);
    } catch (e) {
      return "N/A";
    }
  }

  void _handleCalculation() {
    double P = double.parse(principalAmount.text);
    double E = double.parse(emiAmount.text);
    double r = double.parse(_interestRate.text) / 12 / 100;

    // Calculate tenure in months
    int n = (math.log(E / (E - P * r)) / math.log(1 + r)).ceil();

    double totalAmountPayable = E * n;
    double totalInterestPayable = totalAmountPayable - P;

    tenure = n.toString();
    _totalAmount = totalAmountPayable.toStringAsFixed(2);
    _totalInterest = totalInterestPayable.toStringAsFixed(2);

    setState(() {});
  }

  Widget emiResultsWidget(String tenure, String totalInterest, String totalAmount) {
    bool canShow = false;
    // Convert tenure in months to years
    double tenureInYears = double.tryParse(tenure) ?? 0.0;
    String tenureDisplay = tenureInYears > 0 ? '${(tenureInYears / 12).toStringAsFixed(1)} year' : 'N/A';

    if (tenure.isNotEmpty) {
      canShow = true;
    }
    return canShow
        ? Container(
            padding: const EdgeInsets.all(15),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: borderNew, width: 0.4),
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.only(top: 40.0),
            child: Column(
              children: [
                const SizedBox(height: 15),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: homeBgCl,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        emiCalculator,
                        color: primaryClNew,
                        height: 20,
                        width: 20,
                      ),
                    ),
                    const SizedBox(width: 25),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "EMI Per Month",
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                            color: greyNew,
                            fontFamily: medium,
                          ),
                        ),
                        Text(
                          "₹ ${formatCurrency(double.parse(emiAmount.text))}",
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                            fontFamily: semiBold,
                            fontStyle: FontStyle.normal,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Principal Amount:",
                      style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600, color: greyNew, fontFamily: medium),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      "₹ ${formatCurrency(double.parse(principalAmount.text))}",
                      style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, fontFamily: semiBold, fontStyle: FontStyle.normal),
                    )
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Tenure (In Months):",
                      style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600, color: greyNew, fontFamily: medium),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      "$tenure($tenureDisplay)",
                      style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, fontFamily: semiBold, fontStyle: FontStyle.normal),
                    )
                  ],
                ),
                const SizedBox(height: 15),
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
                          const SizedBox(height: 10),
                          const Text(
                            "Total Interest Payable",
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                              color: greyNew,
                              fontFamily: medium,
                            ),
                          ),
                          Text(
                            "₹ ${formatCurrency(double.parse(totalInterest))}",
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
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          const Text(
                            "Total Amount Payable",
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                              color: greyNew,
                              fontFamily: medium,
                            ),
                          ),
                          Text(
                            "₹ ${formatCurrency(double.parse(totalAmount))}",
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
                )
              ],
            ),
          )
        : Container();
  }
}
