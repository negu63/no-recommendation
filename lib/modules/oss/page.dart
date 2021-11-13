import 'package:flutter/material.dart';
import 'package:norecommendation/core/theme/color_theme.dart';

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
      child: const LicensePage(
        applicationName: 'Spotlight',
        applicationVersion: '1.0.0',
        applicationIcon: Icon(
          Icons.light,
        ),
        applicationLegalese: 'Copyright 2021 negu63 <negu6633@gmail.com>',
      ),
    );
  }
}
