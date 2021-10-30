import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          InkWell(
            onTap: () {},
            child: Text("설정"),
          ),
          InkWell(
            onTap: () {},
            child: Text("정보"),
          ),
        ],
      ),
    );
  }
}
