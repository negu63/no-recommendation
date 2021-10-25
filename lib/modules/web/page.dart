import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:norecommendation/core/utils/responsive.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

late InAppWebViewController inAppWebViewController;

class WebPage extends StatelessWidget {
  const WebPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final url =
        'https://youtube.com/results?search_query=${Get.parameters['query']}';
    return Scaffold(
      body: Responsive(
        mobile: Column(
          children: [
            Expanded(
              child: SafeArea(
                child: InAppWebView(
                  initialUrlRequest: URLRequest(
                    url: Uri.parse(url),
                  ),
                  onWebViewCreated: (controller) {
                    debugPrint('create');
                    inAppWebViewController = controller;
                  },
                ),
              ),
            )
          ],
        ),
        tablet: Container(),
        desktop: Container(),
      ),
    );
  }
}
