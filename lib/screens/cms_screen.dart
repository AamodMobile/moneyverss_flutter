import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:wireframe/constants/constants.dart';
import 'package:wireframe/controllers/cms_controller.dart';

class CMSScreen extends StatefulWidget {
  final String tittle;

  const CMSScreen({super.key, required this.tittle});

  @override
  State<CMSScreen> createState() => _CMSScreenState();
}

class _CMSScreenState extends State<CMSScreen> {
  CMSController cms = Get.put(CMSController());
  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onHttpError: (HttpResponseError error) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://moneyverss.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse('https://moneyverss.com/about-us'));

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: Get.find<CMSController>(),
        initState: (state) {
          if (widget.tittle == "About Us") {
            Get.find<CMSController>().cmsGet("about_us");
          }
          if (widget.tittle == "Privacy policy") {
            Get.find<CMSController>().cmsGet("privacy_policy");
          }
          if (widget.tittle == "Term and conditions") {
            Get.find<CMSController>().cmsGet("terms_condition");
          }
        },
        builder: (contextCtr) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: homeBgCl,
              appBar: PreferredSize(
                preferredSize: Size(MediaQuery.of(context).size.width, 60),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
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
                            padding:
                                EdgeInsets.only(top: 8, bottom: 8, right: 8),
                            child: Image.asset(
                              icBack,
                              height: 24,
                              width: 24,
                            ),
                          )),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.tittle,
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
              body: Builder(builder: (context) {
                if (contextCtr.isLoading) {
                  return const LoaderClass();
                }
                return widget.tittle == "About Us"
                    ? WebViewWidget(controller: controller) : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                            children: [
                              const SizedBox(
                                height: 14,
                              ),
                              Html(
                                data: cms.contant.toString(),
                                style: {
                                  "body": Style(
                                    fontSize: FontSize(14),
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: regular,
                                    color: textGeryCl,
                                  ),
                                },
                              ),
                            ],
                          ),
                  ),
                );
              }),
            ),
          );
        });
  }
}
