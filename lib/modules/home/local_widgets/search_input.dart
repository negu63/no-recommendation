import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed('/search');
          },
          child: SizedBox(
            width: context.width * (2 / 3),
            child: const TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.search),
              ),
              enabled: false,
            ),
          ),
        ),
      ],
    );
  }
}
