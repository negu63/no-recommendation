import 'package:flutter/material.dart';
import 'package:norecommendation/core/theme/color_theme.dart';

class Menu extends StatelessWidget {
  const Menu({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        color: darkGrey46,
      ),
      title: Text(title),
    );
  }
}
