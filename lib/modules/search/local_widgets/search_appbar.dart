import 'package:flutter/material.dart';
import 'package:norecommendation/modules/search/local_widgets/search_input.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchAppBar({Key? key, required this.appbar}) : super(key: key);

  final AppBar appbar;

  @override
  Size get preferredSize => appbar.preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: SearchInput(),
    );
  }
}
