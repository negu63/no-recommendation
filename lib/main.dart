import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'routes/routes.dart';
import 'routes/pages.dart';
import 'core/theme/app_theme.dart';
import 'modules/home/page.dart';

void main() async {
  await Hive.initFlutter();
  runApp(const NoRecommendationApp());
}

class NoRecommendationApp extends StatelessWidget {
  const NoRecommendationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.HOME,
      theme: appThemeData,
      defaultTransition: Transition.fade,
      getPages: AppPages.pages,
      home: HomePage(),
    );
  }
}
