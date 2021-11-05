import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:norecommendation/global_widgets/simple_appbar.dart';
import 'package:norecommendation/modules/history/controller.dart';
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
        title: 'Setting',
        iconColor: Colors.black,
        foreColor: Colors.black,
        backgroundColor: Theme.of(context).canvasColor,
        shadowColor: Colors.transparent,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          SettingSubtitle(title: '기록'),
          ToggleButton(
            icon: Icons.search,
            title: '검색 기록',
            name: 'query',
            state: settingController.savingQuery,
          ),
          Divider(),
          ToggleButton(
            icon: Icons.history,
            title: '시청 기록',
            name: 'history',
            state: settingController.savingHistory,
          ),
          SettingSubtitle(title: '삭제'),
          FunctionButton(
            icon: Icons.search_off,
            title: '검색 기록 전체 삭제',
            label: '삭제',
            onPressed: () {
              final SearchInputController searchInputController = Get.find();
              searchInputController.clearQuery();
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
