import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:norecommendation/global_widgets/menu.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            color: Color.fromRGBO(36, 36, 36, 1),
            child: DrawerHeader(
              child: CircleAvatar(
                backgroundColor: Colors.white,
              ),
            ),
          ),
          Menu(
            title: '설정',
            icon: Icons.settings,
            onTap: () {
              Get.toNamed('/setting');
            },
          ),
          Menu(
            title: '정보',
            icon: Icons.info,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
