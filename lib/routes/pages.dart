import 'package:get/get.dart';
import 'package:norecommendation/modules/home/page.dart';
import 'package:norecommendation/modules/oss/page.dart';
import 'package:norecommendation/modules/search/page.dart';
import 'package:norecommendation/modules/setting/page.dart';
import 'package:norecommendation/modules/web/page.dart';

import 'routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
    ),
    GetPage(
      name: Routes.webSearch,
      page: () => const WebPage(
        isSearch: true,
      ),
    ),
    GetPage(
      name: Routes.webWatch,
      page: () => const WebPage(
        isSearch: false,
      ),
    ),
    GetPage(
      name: Routes.search,
      page: () => const SearchPage(),
    ),
    GetPage(
      name: Routes.setting,
      page: () => const SettingPage(),
    ),
    GetPage(
      name: Routes.oss,
      page: () => const OssPage(),
    ),
  ];
}
