import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:norecommendation/core/utils/responsive.dart';
import 'package:norecommendation/modules/home/controller.dart';
import 'package:norecommendation/modules/home/local_widgets/search_input.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SearchInputController searchInputController =
        Get.put(SearchInputController());

    return Scaffold(
      body: Responsive(
        mobile: Column(
          children: [
            SearchInput(),
          ],
        ),
        tablet: Container(),
        desktop: Container(),
      ),
    );
  }
}
