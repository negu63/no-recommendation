import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class OssPage extends StatelessWidget {
  const OssPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        appBarTheme: AppBarTheme(
          foregroundColor: Theme.of(context).textTheme.bodyText1!.color,
          backgroundColor: Theme.of(context).canvasColor,
          shadowColor: Colors.transparent,
        ),
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: Theme.of(context).textTheme.bodyText1!.color,
              secondary: Theme.of(context).textTheme.bodyText1!.color,
            ),
        cardColor: Theme.of(context).canvasColor,
      ),
      child: LicensePage(
        applicationName: 'appTitle'.tr,
        applicationVersion: '1.2.0+6',
        applicationIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: SvgPicture.asset(
                'assets/images/blinker_icon_1024.svg',
                semanticsLabel: 'blinker logo',
                clipBehavior: Clip.antiAlias,
                width: 64,
                height: 64,
              ),
            ),
          ),
        ),
        applicationLegalese: 'Copyright 2021 negu63 <negu6633@gmail.com>',
      ),
    );
  }
}
