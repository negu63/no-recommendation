import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:norecommendation/global_widgets/simple_appbar.dart';
import 'package:norecommendation/modules/search/controller.dart';
import 'package:norecommendation/modules/setting/controller.dart';
import 'package:norecommendation/modules/setting/local_widgets/function_button.dart';
import 'package:norecommendation/modules/setting/local_widgets/setting_subtitle.dart';
import 'package:norecommendation/modules/setting/local_widgets/toggle_button.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SettingController settingController = Get.find();

    return Scaffold(
      appBar: SimpleAppbar(
        appbar: AppBar(),
        title: 'settingTitle'.tr,
        iconColor: Theme.of(context).textTheme.bodyText1!.color!,
        foreColor: Theme.of(context).textTheme.bodyText1!.color!,
        backgroundColor: Theme.of(context).canvasColor,
        shadowColor: Colors.transparent,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          SettingSubtitle(
            title: 'settingSubtitleDisplay'.tr,
          ),
          ToggleButton(
            icon: Icons.comment,
            title: 'settingCommentBox'.tr,
            name: 'comment',
            state: settingController.showingComment,
          ),
          ToggleButton(
            icon: Icons.dark_mode,
            title: 'settingDarkTheme'.tr,
            name: 'isDark',
            state: settingController.isDark,
            onPressed: () {
              Get.changeThemeMode(
                !settingController.isDark.value
                    ? ThemeMode.dark
                    : ThemeMode.light,
              );
            },
          ),
          SettingSubtitle(title: 'settingSubtitleHistory'.tr),
          ToggleButton(
            icon: Icons.search,
            title: 'settingQueryHistory'.tr,
            name: 'query',
            state: settingController.savingQuery,
          ),
          SettingSubtitle(title: 'settingSubtitleDelete'.tr),
          FunctionButton(
            icon: Icons.search_off,
            title: 'settingQueryClear'.tr,
            label: 'settingButtonClear'.tr,
            onPressed: () {
              final SearchInputController searchInputController = Get.find();
              searchInputController.clearQuery();
            },
          ),
        ],
      ),
    );
  }
}
