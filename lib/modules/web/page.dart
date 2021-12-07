import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:norecommendation/core/utils/box_manager.dart';
import 'package:norecommendation/modules/search/controller.dart';
import 'package:norecommendation/modules/setting/controller.dart';

late InAppWebViewController inAppWebViewController;
late bool backgroundPlay;

class WebPage extends StatefulWidget {
  const WebPage({Key? key, required this.isSearch}) : super(key: key);

  final bool isSearch;

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      backgroundPlay = await loadFromHive('setting', 'backgroundPlay');
    });
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance!.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive && !backgroundPlay) {
      inAppWebViewController.evaluateJavascript(
        source:
            '''var button = document.querySelector('button.icon-button[aria-pressed="false"]');
            if(button !== null) { button.click(); };''',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final SettingController settingController = Get.find();
    final SearchInputController searchInputController = Get.find();
    final url = widget.isSearch
        ? 'https://youtube.com/results?search_query=${searchInputController.query}'
        : 'https://m.youtube.com/feed/library';

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                    if (!settingController.showingTab.value) {
                      _injectCSS(controller, 'assets/css/remove_tab.css');
                    }
                    if (!settingController.showingComment.value) {
                      _injectCSS(controller, 'assets/css/remove_comment.css');
                    }
                  },
                  onEnterFullscreen: (controller) {
                    SystemChrome.setPreferredOrientations([
                      DeviceOrientation.landscapeRight,
                      DeviceOrientation.landscapeLeft,
                    ]);
                  },
                  onExitFullscreen: (controller) {
                    SystemChrome.setPreferredOrientations([
                      DeviceOrientation.portraitUp,
                      DeviceOrientation.portraitDown,
                    ]);
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
