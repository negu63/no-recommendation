import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:norecommendation/core/utils/box_manager.dart';
import 'package:norecommendation/core/values/languages/translation.dart';
import 'package:norecommendation/modules/setting/controller.dart';

import 'routes/routes.dart';
import 'routes/pages.dart';
import 'core/theme/app_theme.dart';
import 'modules/home/page.dart';

bool isDark = false;

void main() async {
  await Hive.initFlutter().then((value) => _initSetting());
  isDark = await loadFromHive('setting', 'isDark');
  runApp(const NoRecommendationApp());
}

class NoRecommendationApp extends StatelessWidget {
  const NoRecommendationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    Get.put(SettingController());

    return GetMaterialApp(
      translations: Messages(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.home,
      theme: appLightThemeData,
      darkTheme: appDarkThemeData,
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      defaultTransition: Transition.fade,
      getPages: AppPages.pages,
      home: const SafeArea(
        child: HomePage(),
      ),
    );
  }
}

void _initSetting() async {
  if (!(await Hive.boxExists('setting'))) {
    saveToHive('setting', 'query', true);
    saveToHive('setting', 'tab', false);
    saveToHive('setting', 'comment', false);
    saveToHive('setting', 'isDark', false);
  }
}
