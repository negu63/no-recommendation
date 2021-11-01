import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:norecommendation/core/utils/responsive.dart';
import 'package:norecommendation/global_widgets/menu_drawer.dart';
import 'package:norecommendation/global_widgets/text_title.dart';
import 'package:norecommendation/modules/history/controller.dart';
import 'package:norecommendation/modules/home/local_widgets/search_input.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    Get.put(HistoryController());

    return Scaffold(
      key: _scaffoldKey,
      drawer: MenuDrawer(),
      body: Responsive(
        mobile: Stack(
          children: [
            Positioned(
              top: 30,
              left: 15,
              child: IconButton(
                icon: Icon(Icons.menu),
                iconSize: 30,
                color: Colors.blue,
                onPressed: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
              ),
            ),
            Positioned(
              top: 30,
              right: 15,
              child: IconButton(
                icon: Icon(Icons.history),
                iconSize: 30,
                color: Colors.blue,
                onPressed: () {
                  Get.toNamed('/history');
                },
              ),
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
