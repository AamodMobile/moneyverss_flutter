import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/widget/my_button.dart';
import 'dart:math' as math;

import 'package:wireframe/widget/text_filled_widget.dart';

class CalculatorLoanScreen extends StatefulWidget {
  const CalculatorLoanScreen({super.key});

  @override
  State<CalculatorLoanScreen> createState() => _CalculatorLoanScreenState();
}

class _CalculatorLoanScreenState extends State<CalculatorLoanScreen> {
  String _emiResult = "";
  String moths = "";
  double emi = 0.0;
  final TextEditingController _principalAmount = TextEditingController();
  final TextEditingController _interestRate = TextEditingController();
  final TextEditingController year = TextEditingController();
  final TextEditingController month = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: homeBgCl,
          appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 60),
            child: Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 16,),
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
                  const Text(
                    "Loan Calculator",
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
                const SizedBox(
                  height: 14,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Loan EMI",
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
                  controller: _principalAmount,
                  hint: "Loan EMI",
                  fillColor: Colors.white,
                  obscureText: false,
                  readOnly: false,
                  keyboardType: TextInputType.number,
                  border: primaryCl,
                ),
                const SizedBox(
                  height: 14,
                ),
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
                  controller: _interestRate,
                  hint: "Interest %",
                  fillColor: Colors.white,
                  keyboardType: TextInputType.number,
                  obscureText: false,
                  readOnly: false,
                  border: primaryCl,
                ),
                const SizedBox(
                  height: 14,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Year",
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
                            controller: year,
                            hint: "Year",
                            fillColor: Colors.white,
                            keyboardType: TextInputType.number,
                            obscureText: false,
                            readOnly: false,
                            border: primaryCl,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Month",
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
                            controller: month,
                            hint: "Month",
                            fillColor: Colors.white,
                            keyboardType: TextInputType.number,
                            obscureText: false,
                            readOnly: false,
                            border: primaryCl,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                SizedBox(
                  height: 50,
                  width: 200,
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
                emiResultsWidget(_emiResult.toString())
              ],
            ),
          )),
    );
  }

  void _handleCalculation() {
    //  Amortization
    //  A = Payment amount per period
    //  P = Initial Practical (loan amount)
    //  r = interest rate
    //  n = total number of payments or periods

    double A = 0.0;
    int P = int.parse(_principalAmount.text);
    double r = int.parse(_interestRate.text) / 12 / 100;
    int n = int.parse(year.text) * 12 + int.parse(month.text);
    moths = n.toString();
    A = (P * r * math.pow((1 + r), n) / (math.pow((1 + r), n) - 1));
    _emiResult = A.toStringAsFixed(2);
    setState(() {});
  }

  Widget emiResultsWidget(emiResult) {
    bool canShow = false;
    String emiResult0 = emiResult;

    if (emiResult0.isNotEmpty) {
      canShow = true;
    }
    return Container(
        margin: const EdgeInsets.only(top: 40.0),
        child: canShow
            ? Column(children: [
                Text("Your Monthly $moths", style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                const Text("Your Monthly EMI is", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                Text(emiResult0, style: const TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold))
              ])
            : Container());
  }
}
