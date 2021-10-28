import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:norecommendation/modules/home/controller.dart';

class SearchHistory extends StatelessWidget {
  const SearchHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SearchInputController searchInputController = Get.find();

    // return Text(searchInputController.queries.toString());
    return SizedBox(
      height: 200,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: searchInputController.queries.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(searchInputController.queries[index]),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.clear),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
