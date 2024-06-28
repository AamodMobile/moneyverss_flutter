import 'dart:math' as math;

import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/widget/my_button.dart';
import 'package:wireframe/widget/text_filled_widget.dart';

class CalculatorInvestScreen extends StatefulWidget {
  const CalculatorInvestScreen({super.key});

  @override
  State<CalculatorInvestScreen> createState() => _CalculatorInvestScreenState();
}

class _CalculatorInvestScreenState extends State<CalculatorInvestScreen> {
  final TextEditingController principalAmount = TextEditingController();
  final TextEditingController interestRate = TextEditingController();
  final TextEditingController year = TextEditingController();
  final TextEditingController month = TextEditingController();

  double totalInvestmentAmount = 0.0;
  double totalMaturityAmount = 0.0;

  void calculateTotalAmount() {
    double principal = double.parse(principalAmount.text);
    double rate = double.parse(interestRate.text) / 100;
    int years = int.parse(year.text);
    int months = month.text.isEmpty ? 0 : int.parse(month.text);
    int totalMonths = years * 12 + months;

    double totalAmount = principal * math.pow(1 + rate / 12, totalMonths);
    double totalInvestment = principal * totalMonths;

    setState(() {
      totalInvestmentAmount = totalInvestment;
      totalMaturityAmount = totalAmount + totalInvestment;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: homeBgCl,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 65),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          decoration: const BoxDecoration(color: homeBgCl),
          alignment: Alignment.center,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 22,
                    width: 22,
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(color: primaryClNew, borderRadius: BorderRadius.circular(4)),
                    child: const Center(
                      child: Icon(
                        Icons.arrow_back,
                        color: whiteColor,
                        size: 14,
                      ),
                    ),
                  )),
              const SizedBox(width: 20),
              const Text(
                "Invest Calculator",
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
              controller: principalAmount,
              hint: "Loan EMI",
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
              controller: interestRate,
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
              children: <Widget>[
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
                SizedBox(width: 10),
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
                onPressed: calculateTotalAmount,
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
            const SizedBox(height: 14),
            Text(
              'Total  Investment amount: ${totalInvestmentAmount.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 14),
            Text(
              'Total  maturity  amount: ${totalMaturityAmount.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ));
  }
}
