import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:norecommendation/core/utils/box_manager.dart';
import 'package:norecommendation/modules/setting/controller.dart';

import 'routes/routes.dart';
import 'routes/pages.dart';
import 'core/theme/app_theme.dart';
import 'modules/home/page.dart';

void main() async {
  await Hive.initFlutter().then((value) => _initSetting());
  runApp(const NoRecommendationApp());
}

class NoRecommendationApp extends StatelessWidget {
  const NoRecommendationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SettingController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.home,
      theme: appThemeData,
      defaultTransition: Transition.fade,
      getPages: AppPages.pages,
      home: const SafeArea(
        child: HomePage(),
      ),
    );
  }
}

void _initSetting() async {
  debugPrint((await Hive.boxExists('setting')).toString());
  if (!(await Hive.boxExists('setting'))) {
    saveToHive('setting', 'query', true);
    saveToHive('setting', 'comment', false);
  }
}
