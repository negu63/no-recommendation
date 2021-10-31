import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:norecommendation/core/utils/responsive.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:norecommendation/data/model/model.dart';
import 'package:norecommendation/modules/web/controller.dart';

late InAppWebViewController inAppWebViewController;

class WebPage extends StatelessWidget {
  const WebPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final url =
        'https://youtube.com/results?search_query=${Get.parameters['query']}';

    final WebViewController webViewController = Get.find();

    return Scaffold(
      body: Responsive(
        mobile: Column(
          children: [
            Expanded(
              child: SafeArea(
                child: WillPopScope(
                  onWillPop: _goBack,
                  child: InAppWebView(
                    initialUrlRequest: URLRequest(
                      url: Uri.parse(url),
                    ),
                    onWebViewCreated: (controller) {
                      inAppWebViewController = controller;
                    },
                    onLoadStop: (controller, url) {
                      _injectCSS(controller, 'assets/css/remove_recommend.css');
                      // injectCSS(controller, 'assets/css/remove_comment.css');
                    },
                    onTitleChanged: (controller, title) async {
                      Uri? uri = await controller.getUrl();
                      if (uri != null && uri.path == '/watch') {
                        DateTime now = DateTime.now();
                        webViewController.addHistory(History(
                            title!,
                            uri.toString(),
                            '${now.year}${now.month}${now.day}'));
                      }
                    },
                  ),
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

Future<bool> _goBack() async {
  if (await inAppWebViewController.canGoBack()) {
    inAppWebViewController.goBack();
    return Future.value(false);
  } else {
    return Future.value(true);
  }
}

void _injectCSS(InAppWebViewController controller, String path) {
  controller.injectCSSFileFromAsset(assetFilePath: path);
}
