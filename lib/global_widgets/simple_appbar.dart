import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SimpleAppbar extends StatelessWidget implements PreferredSizeWidget {
  const SimpleAppbar({
    Key? key,
    required this.appbar,
    required this.title,
    required this.iconColor,
    required this.foreColor,
    required this.backgroundColor,
    required this.shadowColor,
  }) : super(key: key);

  final AppBar appbar;
  final String title;
  final Color iconColor;
  final Color foreColor;
  final Color backgroundColor;
  final Color shadowColor;

  @override
  Size get preferredSize => appbar.preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Get.back(closeOverlays: true);
        },
        icon: Icon(
          Icons.arrow_back,
          color: iconColor,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(color: foreColor),
      ),
      backgroundColor: backgroundColor,
      shadowColor: shadowColor,
    );
  }
}
