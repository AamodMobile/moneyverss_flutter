import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/widget/my_button.dart';
import 'package:wireframe/widget/text_filled_widget.dart';

class CalculatorGSTScreen extends StatefulWidget {
  const CalculatorGSTScreen({super.key});

  @override
  State<CalculatorGSTScreen> createState() => _CalculatorGSTScreenState();
}

class _CalculatorGSTScreenState extends State<CalculatorGSTScreen> {
  final TextEditingController amount = TextEditingController();
  final TextEditingController gst = TextEditingController();

  calculateTotalAmountGStAmount() {}

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
                  "GST Calculator",
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
                  "Amount",
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
                controller: amount,
                hint: "Amount",
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
                  "GST (%)",
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
                controller: gst,
                hint: "GST (%)",
                fillColor: Colors.white,
                keyboardType: TextInputType.number,
                obscureText: false,
                readOnly: false,
                border: primaryCl,
              ),
              const SizedBox(
                height: 14,
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 50,
                width: 200,
                child: MyButton(
                  onPressed: calculateTotalAmountGStAmount,
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
            ],
          ),
        ),
      ),
    );
  }
}
