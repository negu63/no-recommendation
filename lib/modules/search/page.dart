import 'package:flutter/material.dart';
import 'package:norecommendation/modules/search/local_widgets/search_appbar.dart';
import 'package:norecommendation/modules/search/local_widgets/search_history.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(appbar: AppBar()),
      body: const SearchHistory(),
    );
  }
}
