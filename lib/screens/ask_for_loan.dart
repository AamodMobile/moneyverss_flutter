import 'package:flutter/cupertino.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/widget/text_filled_widget.dart';

class AskForLoan extends StatefulWidget {
  const AskForLoan({super.key});

  @override
  State<AskForLoan> createState() => _AskForLoanState();
}

class _AskForLoanState extends State<AskForLoan> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: homeBgCl,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: appBarClNew,
          centerTitle: false,
          title: Row(
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
                "Ask To Expert",
                style: TextStyle(
                  color: draKText,
                  fontFamily: semiBold,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              SizedBox(width: MediaQuery.of(context).size.width,height: 44,),
              Image.asset(
                expertIMg,
                height: 193,
                width: 163,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 14),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Ask To Expert",
                  style: TextStyle(
                    color: draKText,
                    fontFamily: semiBold,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the",
                style: TextStyle(
                  color: primaryCl,
                  fontFamily: regular,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 14),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Select available Date",
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
                hint: 'DD/mM/YYYY',
                obscureText: false,
                readOnly: false,
                border: borderNewCl,
                validator: (v) {
                  if (v!.isEmpty) {
                    return "Enter date";
                  }
                  return null;
                },
                fillColor: whiteColor,
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Material(
                    child: Image.asset(
                      calendarAlt,
                      height: 18,
                      width: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Select available Time",
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
                hint: '11:00',
                obscureText: false,
                readOnly: false,
                border: borderNewCl,
                validator: (v) {
                  if (v!.isEmpty) {
                    return "Enter Time";
                  }
                  return null;
                },
                fillColor: whiteColor,
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Material(
                    child: Image.asset(
                      calendarAlt,
                      height: 18,
                      width: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
