import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:norecommendation/modules/search/controller.dart';
import 'package:norecommendation/modules/setting/controller.dart';

late InAppWebViewController inAppWebViewController;

class WebPage extends StatelessWidget {
  const WebPage({Key? key, required this.isSearch}) : super(key: key);

  final bool isSearch;

  @override
  Widget build(BuildContext context) {
    final SettingController settingController = Get.find();
    final SearchInputController searchInputController = Get.find();
    final url = isSearch
        ? 'https://youtube.com/results?search_query=${searchInputController.query}'
        : 'https://m.youtube.com/feed/library';

    return Scaffold(
      body: Column(
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
                    if (!settingController.showingComment.value) {
                      _injectCSS(controller, 'assets/css/remove_comment.css');
                    }
                  },
                ),
              ),
            ),
          )
        ],
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
