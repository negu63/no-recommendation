import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:norecommendation/core/theme/color_theme.dart';
import 'package:norecommendation/global_widgets/text_title.dart';
import 'package:norecommendation/modules/home/local_widgets/search_input.dart';
import 'package:norecommendation/modules/home/local_widgets/spotlight.dart';
import 'package:norecommendation/modules/search/controller.dart';
import 'package:norecommendation/modules/setting/controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SearchInputController());
    final SettingController settingController = Get.find();

    return Scaffold(
      backgroundColor: darkGrey30,
      body: Stack(
        children: [
          Obx(
            () => Align(
              alignment: Alignment.topCenter,
              child: settingController.isDark.value
                  ? Container()
                  : const Spotlight(),
            ),
          ),
          const Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(bottom: 300),
              child: TextTitle(),
            ),
          ),
          const Center(
            child: SearchInput(),
          ),
          Positioned(
            top: 0,
            left: 4,
            child: IconButton(
              icon: const Icon(Icons.settings),
              iconSize: 30,
              color: Colors.white,
              onPressed: () {
                Get.toNamed('/setting');
              },
            ),
          ),
          Positioned(
            top: 0,
            right: 4,
            child: IconButton(
              icon: const Icon(Icons.video_library_sharp),
              iconSize: 30,
              color: Colors.white,
              onPressed: () {
                Get.toNamed('/web/library');
              },
            ),
          ),
        ],
      ),
    );
  }
}
