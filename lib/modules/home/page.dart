import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:norecommendation/core/utils/responsive.dart';
import 'package:norecommendation/global_widgets/menu_drawer.dart';
import 'package:norecommendation/global_widgets/text_title.dart';
import 'package:norecommendation/modules/home/controller.dart';
import 'package:norecommendation/modules/home/local_widgets/search_history.dart';
import 'package:norecommendation/modules/home/local_widgets/search_input.dart';
import 'package:norecommendation/modules/web/controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    final SearchInputController searchInputController =
        Get.put(SearchInputController());
    final WebViewController webViewController = Get.put(WebViewController());

    return Scaffold(
      key: _scaffoldKey,
      drawer: MenuDrawer(),
      body: Responsive(
        mobile: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            searchInputController.focusOut();
            FocusScope.of(context).unfocus();
          },
          child: Stack(
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextTitle(),
                  SearchInput(),
                  Obx(
                    () => searchInputController.isFocused.value == true
                        ? SearchHistory()
                        : Container(),
                  ),
                ],
              ),
            ],
          ),
        ),
        tablet: Container(),
        desktop: Container(),
      ),
    );
  }
}
