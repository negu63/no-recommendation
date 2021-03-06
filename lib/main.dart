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
  await Hive.initFlutter().then((value) => _initSettings());
  isDark = await loadFromHive('setting', 'isDark') ?? false;
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

void _initSettings() async {
  _initSetting('setting', 'query', true);
  _initSetting('setting', 'tab', false);
  _initSetting('setting', 'comment', false);
  _initSetting('setting', 'isDark', false);
  _initSetting('setting', 'backgroundPlay', false);
}

void _initSetting(String name, String key, dynamic value) async {
  if ((await loadFromHive(name, key)) == null) {
    saveToHive(name, key, value);
  }
}
