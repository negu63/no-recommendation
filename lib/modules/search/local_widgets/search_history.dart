import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:norecommendation/core/utils/space_replacer.dart';
import 'package:norecommendation/modules/search/controller.dart';
import 'package:norecommendation/modules/setting/controller.dart';

class SearchHistory extends StatelessWidget {
  const SearchHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SearchInputController searchInputController = Get.find();
    final SettingController settingController = Get.find();

    return Obx(
      () => ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: searchInputController.queries.length,
          itemBuilder: (BuildContext context, int index) {
            int reverseIndex = searchInputController.queries.length - 1 - index;
            return InkWell(
              onTap: () {
                searchInputController.search(
                  replaceStringSpace(
                      searchInputController.queries[reverseIndex]),
                  settingController.savingQuery.value,
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(replaceURLSpace(
                      searchInputController.queries[reverseIndex])),
                  IconButton(
                    onPressed: () {
                      searchInputController.removeAtQuery(reverseIndex);
                    },
                    icon: const Icon(Icons.clear),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
