import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:norecommendation/core/theme/color_theme.dart';
import 'package:norecommendation/global_widgets/menu.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            color: colorBackground,
            child: const DrawerHeader(
              child: Text(
                'Spotlight',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Menu(
            title: '정보',
            icon: Icons.info,
            onTap: () {},
          ),
          Menu(
            title: '설정',
            icon: Icons.settings,
            onTap: () {
              Get.toNamed('/setting');
            },
          ),
        ],
      ),
    );
  }
}
