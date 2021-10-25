import 'package:get/get.dart';
import 'package:norecommendation/modules/home/page.dart';
import 'package:norecommendation/modules/web/page.dart';

import 'routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.HOME, page: () => HomePage()),
    GetPage(name: Routes.WEB, page: () => WebPage()),
  ];
}
