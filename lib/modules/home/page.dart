import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:norecommendation/core/theme/color_theme.dart';
import 'package:norecommendation/core/utils/responsive.dart';
import 'package:norecommendation/global_widgets/menu_drawer.dart';
import 'package:norecommendation/global_widgets/text_title.dart';
import 'package:norecommendation/modules/history/controller.dart';
import 'package:norecommendation/modules/home/local_widgets/search_input.dart';
import 'package:norecommendation/modules/home/local_widgets/spotlight.dart';
import 'package:norecommendation/modules/search/controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    Get.put(SearchInputController());
    Get.put(HistoryController());

    return Scaffold(
      backgroundColor: colorBackground,
      key: _scaffoldKey,
      drawer: MenuDrawer(),
      body: Responsive(
        mobile: Stack(
          children: [
            Positioned(
              top: 30,
              left: 4,
              child: IconButton(
                icon: const Icon(Icons.menu),
                iconSize: 30,
                color: Colors.white,
                onPressed: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
              ),
            ),
            Positioned(
              top: 30,
              right: 4,
              child: IconButton(
                icon: const Icon(Icons.history),
                iconSize: 30,
                color: Colors.white,
                onPressed: () {
                  Get.toNamed('/history');
                },
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Spotlight(),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextTitle(),
                SearchInput(),
              ],
            ),
          ],
        ),
        tablet: Container(),
        desktop: Container(),
      ),
    );
  }
}
