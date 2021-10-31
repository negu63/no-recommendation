import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SettingAppBar({Key? key, required this.appbar}) : super(key: key);

  final AppBar appbar;

  @override
  Size get preferredSize => appbar.preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
      title: Text(
        'Setting',
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Theme.of(context).canvasColor,
      shadowColor: Colors.transparent,
    );
  }
}
