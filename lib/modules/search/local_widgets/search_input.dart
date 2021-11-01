import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:norecommendation/modules/search/controller.dart';
import 'package:norecommendation/modules/setting/controller.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();
    final SearchInputController searchInputController = Get.find();
    final SettingController settingController = Get.find();

    return SizedBox(
      width: Get.width,
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          prefixIcon: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back)),
          suffixIcon: IconButton(
            onPressed: () {
              searchInputController.search(textEditingController.text,
                  settingController.savingQuery.value);
            },
            icon: const Icon(Icons.search),
          ),
        ),
        onSubmitted: (value) {
          searchInputController.search(
              value, settingController.savingQuery.value);
        },
      ),
    );
  }
}
