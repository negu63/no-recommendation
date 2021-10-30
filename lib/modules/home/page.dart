import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:norecommendation/core/utils/responsive.dart';
import 'package:norecommendation/data/model/model.dart';
import 'package:norecommendation/global_widgets/menu_drawer.dart';
import 'package:norecommendation/modules/home/controller.dart';
import 'package:norecommendation/modules/home/local_widgets/home_appbar.dart';
import 'package:norecommendation/modules/home/local_widgets/search_history.dart';
import 'package:norecommendation/modules/home/local_widgets/search_input.dart';
import 'package:norecommendation/modules/web/controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SearchInputController searchInputController =
        Get.put(SearchInputController());
    final WebViewController webViewController = Get.put(WebViewController());

    return Scaffold(
      appBar: HomeAppBar(
        appbar: AppBar(),
      ),
      drawer: MenuDrawer(),
      body: Responsive(
        mobile: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            searchInputController.focusOut();
            FocusScope.of(context).unfocus();
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SearchInput(),
              Obx(
                () => searchInputController.isFocused.value == true
                    ? SearchHistory()
                    : Container(),
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
