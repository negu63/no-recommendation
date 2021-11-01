import 'package:get/get.dart';
import 'package:norecommendation/modules/history/page.dart';
import 'package:norecommendation/modules/home/page.dart';
import 'package:norecommendation/modules/search/page.dart';
import 'package:norecommendation/modules/setting/page.dart';
import 'package:norecommendation/modules/web/page.dart';

import 'routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.HOME, page: () => HomePage()),
    GetPage(name: Routes.WEB, page: () => WebPage()),
    GetPage(
      name: Routes.SEARCH,
      page: () => SearchPage(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.SETTING,
      page: () => SettingPage(),
    ),
    GetPage(
      name: Routes.HISTORY,
      page: () => HistoryPage(),
    ),
  ];
}
