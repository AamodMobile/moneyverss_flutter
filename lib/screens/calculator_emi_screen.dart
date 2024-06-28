import 'dart:math' as math;

import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/service/api_logs.dart';
import 'package:wireframe/widget/my_button.dart';
import 'package:wireframe/widget/text_filled_widget.dart';

class CalculatorEMIScreen extends StatefulWidget {
  const CalculatorEMIScreen({super.key});

  @override
  State<CalculatorEMIScreen> createState() => _CalculatorEMIScreenState();
}

class _CalculatorEMIScreenState extends State<CalculatorEMIScreen> {
  final List _tenureTypes = ['Month(s)', 'Year(s)'];
  String _tenureType = "Year(s)";
  String _emiResult = "";

  final TextEditingController _principalAmount = TextEditingController();
  final TextEditingController _interestRate = TextEditingController();
  final TextEditingController _tenure = TextEditingController();

  bool _switchValue = true;

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
                    "EMI Calculator",
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
                    "Enter Principal Amount",
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
                  hint: "Enter Principal Amount",
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
                    "Interest Rate",
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
                  hint: "Interest Rate",
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
                    Flexible(
                      flex: 4,
                      fit: FlexFit.tight,
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Tenure",
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
                            controller: _tenure,
                            hint: "Tenure",
                            fillColor: Colors.white,
                            keyboardType: TextInputType.number,
                            obscureText: false,
                            readOnly: false,
                            border: primaryCl,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                        flex: 1,
                        child: Column(children: [
                          Text(_tenureType, style: const TextStyle(fontWeight: FontWeight.bold)),
                          Switch(
                              activeColor: primaryClNew,
                              value: _switchValue,
                              onChanged: (bool value) {
                                Log.console(value);

                                if (value) {
                                  _tenureType = _tenureTypes[1];
                                } else {
                                  _tenureType = _tenureTypes[0];
                                }

                                setState(() {
                                  _switchValue = value;
                                });
                              })
                        ]))
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  width: 200,
                  child: MyButton(
                      onPressed: _handleCalculation,
                      color: primaryClNew,
                      child: const Text(
                        "Calculate",
                        style: TextStyle(color: whiteColor, fontFamily: semiBold, fontSize: 18),
                      )),
                ),
                emiResultsWidget(_emiResult)
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
    int n = _tenureType == "Year(s)" ? int.parse(_tenure.text) * 12 : int.parse(_tenure.text);
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
                const Text("Your Monthly EMI is", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                Text(emiResult0, style: const TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold))
              ])
            : Container());
  }
}
