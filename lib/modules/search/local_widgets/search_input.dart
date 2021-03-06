import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:norecommendation/core/theme/color_theme.dart';
import 'package:norecommendation/core/utils/space_replacer.dart';
import 'package:norecommendation/modules/search/controller.dart';
import 'package:norecommendation/modules/setting/controller.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();
    final SearchInputController searchInputController = Get.find();
    final SettingController settingController = Get.find();
    const border = UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    );

    return SizedBox(
      width: Get.width,
      child: TextField(
        cursorColor: darkGrey30,
        controller: textEditingController,
        decoration: InputDecoration(
          prefixIcon: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Theme.of(context).textTheme.bodyText1!.color!,
              )),
          suffixIcon: IconButton(
            onPressed: () {
              if (textEditingController.text.isNotEmpty) {
                searchInputController.query.value = textEditingController.text;
                searchInputController.search(
                    replaceStringSpace(textEditingController.text),
                    settingController.savingQuery.value);
                textEditingController.text = '';
              }
            },
            icon: Icon(
              Icons.search,
              color: Theme.of(context).textTheme.bodyText1!.color!,
            ),
          ),
          border: border,
          enabledBorder: border,
          focusedBorder: border,
          disabledBorder: border,
        ),
        onSubmitted: (value) {
          if (value.isNotEmpty) {
            searchInputController.query.value = value;
            searchInputController.search(
                replaceStringSpace(value), settingController.savingQuery.value);
            textEditingController.text = '';
          }
        },
      ),
    );
  }
}
