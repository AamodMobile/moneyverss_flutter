import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/screens/cms_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 65),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xFF3E4D77),
                  width: 1,
                ),
              ),
              gradient: LinearGradient(
                colors: [Color(0xFF112049), Color(0xFF3E4D77)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            alignment: Alignment.center,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: whiteColor,
                    )),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "Setting",
                  style: TextStyle(
                      color: whiteColor,
                      fontFamily: medium,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 16),
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(height: 15,),
            cont("About Us"),
            const SizedBox(height: 15,),
            cont("Contact Us"),
            const SizedBox(height: 15,),
            cont("Privacy policy"),
            const SizedBox(height: 15,),
            cont("Term and conditions"),
          ],
        ),
      ),
    );
  }

  Widget cont(String tittle) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => CMSScreen(tittle: tittle)));
      },
      child:
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        height: 40,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(4),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0,1),
              blurRadius: 6,
              spreadRadius: 0,
              color: Color.fromRGBO(0, 0, 0, 0.15)
            )
          ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(tittle,
            style: const TextStyle(
              color: textHeading,
              fontFamily: semiBold,
              fontWeight: FontWeight.w600,
              fontSize: 12,
              fontStyle: FontStyle.normal,
            ),
            ),
            Icon(Icons.arrow_forward_ios,size: 20,color: textGeryCl,)
          ],
        ),
      ),
    );
  }
}
