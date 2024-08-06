import 'package:flutter/material.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/screens/calculator_emi_screen.dart';
import 'package:wireframe/screens/calculator_gst_screen.dart';
import 'package:wireframe/screens/calculator_invest_screen.dart';
import 'package:wireframe/screens/calculator_loan_screen.dart';
import 'package:wireframe/screens/calculator_sip_screen.dart';
import 'package:wireframe/screens/tenure_calculator_screen.dart';

class AllCalculatorScreen extends StatefulWidget {
  const AllCalculatorScreen({super.key});

  @override
  State<AllCalculatorScreen> createState() => _AllCalculatorScreenState();
}

class _AllCalculatorScreenState extends State<AllCalculatorScreen> {
  var myCategory = [
    {
      'title': 'EMI Calculator',
      'image': emiCalculator,
    },
    {
      'title': 'Loan Calculator',
      'image': emiCalculator,
    },
    {
      'title': 'Tenure Calculator',
      'image': emiCalculator,
    },
    {
      'title': 'SIP Calculator',
      'image': emiCalculator,
    },
   /* {
      'title': 'GST Calculator',
      'image': emiCalculator,
    },
    {
      'title': 'Invest Calculator',
      'image': emiCalculator,
    },*/

  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: screenBgCl,
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
                const SizedBox(width: 5,),
                const Text(
                  "Financial Calculator",
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
        body: Column(children: [
          const SizedBox(height: 14),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: myCategory.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 100,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 10,
                    crossAxisCount: 1),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      myCategory[index]["title"].toString() == "EMI Calculator"
                          ? Navigator.push(context, MaterialPageRoute(builder: (context) => const CalculatorEMIScreen()))
                          : myCategory[index]["title"].toString() == "Loan Calculator"
                          ? Navigator.push(context, MaterialPageRoute(builder: (context) => const CalculatorLoanScreen()))
                          : myCategory[index]["title"].toString() == "SIP Calculator"
                          ? Navigator.push(context, MaterialPageRoute(builder: (context) => const CalculatorSIPScreen()))
                          : myCategory[index]["title"].toString() == "Invest Calculator"
                          ? Navigator.push(context, MaterialPageRoute(builder: (context) => const CalculatorInvestScreen())):
                           myCategory[index]["title"].toString() == "Tenure Calculator"
                          ? Navigator.push(context, MaterialPageRoute(builder: (context) => const CalculatorTenureScreen()))
                          : Navigator.push(context, MaterialPageRoute(builder: (context) => const CalculatorGSTScreen()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF000000).withOpacity(0.15),
                            offset: const Offset(0, 0),
                            blurRadius: 17,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          ImageIcon(
                            AssetImage(
                              myCategory[index]["image"].toString(),
                            ),
                            size: 30,
                            color: myCategory[index]["title"].toString() == "EMI Calculator"
                                ? Colors.red
                                : myCategory[index]["title"].toString() == "Loan Calculator"
                                    ? Colors.blue
                                    : myCategory[index]["title"].toString() == "SIP Calculator"
                                        ? Colors.amber
                                        : myCategory[index]["title"].toString() == "Invest Calculator"
                                            ? Colors.green
                                            : Colors.brown,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              myCategory[index]["title"].toString(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black,
                                fontFamily: medium,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SizedBox(width: 50,)
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
