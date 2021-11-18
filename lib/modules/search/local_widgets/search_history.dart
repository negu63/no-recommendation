import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:norecommendation/core/utils/space_replacer.dart';
import 'package:norecommendation/modules/search/controller.dart';
import 'package:norecommendation/modules/search/local_widgets/remove_button.dart';
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
            return ListTile(
              onTap: () {
                searchInputController.query.value =
                    searchInputController.queries[reverseIndex];
                searchInputController.search(
                  replaceStringSpace(
                    searchInputController.queries[reverseIndex],
                  ),
                  settingController.savingQuery.value,
                );
              },
              title: Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 0, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        replaceURLSpace(
                          searchInputController.queries[reverseIndex],
                        ),
                        maxLines: null,
                      ),
                    ),
                    RemoveButton(
                      onPressed: () {
                        searchInputController.removeAtQuery(reverseIndex);
                      },
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
