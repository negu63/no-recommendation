import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({Key? key, required this.appbar}) : super(key: key);

  final AppBar appbar;

  @override
  Size get preferredSize => Size.fromHeight(appbar.preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        // backgroundColor: Colors.transparent,
        );
  }
}
