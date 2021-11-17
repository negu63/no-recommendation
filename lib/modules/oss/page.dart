import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:norecommendation/core/theme/color_theme.dart';
import 'package:get/get.dart';

class OssPage extends StatelessWidget {
  const OssPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          foregroundColor: darkGrey18,
          shadowColor: Colors.transparent,
        ),
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: darkGrey18,
              secondary: darkGrey18,
            ),
      ),
      child: LicensePage(
        applicationName: 'appTitle'.tr,
        applicationVersion: '1.0.0',
        applicationIcon: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          margin: const EdgeInsets.all(8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SvgPicture.asset(
              'assets/images/blinker_icon_1024.svg',
              semanticsLabel: 'blinker logo',
              clipBehavior: Clip.antiAlias,
              width: 64,
              height: 64,
            ),
          ),
        ),
        applicationLegalese: 'Copyright 2021 negu63 <negu6633@gmail.com>',
      ),
    );
  }
}
