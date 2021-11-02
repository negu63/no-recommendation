import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metadata_fetch/metadata_fetch.dart';
import 'package:norecommendation/core/utils/responsive.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:norecommendation/data/model/model.dart';
import 'package:norecommendation/modules/history/controller.dart';
import 'package:norecommendation/modules/setting/controller.dart';

late InAppWebViewController inAppWebViewController;

class WebPage extends StatelessWidget {
  const WebPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final url =
        'https://youtube.com/results?search_query=${Get.parameters['query']}';

    final HistoryController historyController = Get.find();
    final SettingController settingController = Get.find();

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
                      if (settingController.savingHistory.value) {
                        Uri? uri = await controller.getUrl();
                        if (uri != null && uri.path == '/watch') {
                          DateTime now = DateTime.now();
                          var data =
                              await MetadataFetch.extract(uri.toString());
                          debugPrint('#########' + data.toString());
                          historyController.addHistory(History(
                            data!.title!,
                            data.url!,
                            data.image!,
                            '${now.year}${now.month}${now.day}',
                          ));
                        }
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
