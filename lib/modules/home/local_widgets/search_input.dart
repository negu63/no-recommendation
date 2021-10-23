import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:norecommendation/modules/home/controller.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final SearchInputController searchInputController = Get.find();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: context.width * (2 / 3),
          child: TextField(
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: searchInputController.search,
                icon: const Icon(Icons.search),
              ),
            ),
            onChanged: (String value) {
              searchInputController.changeQuery(value);
            },
          ),
        ),
      ],
    );
  }
}
