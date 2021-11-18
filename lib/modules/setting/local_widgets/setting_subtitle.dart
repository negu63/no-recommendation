import 'package:flutter/material.dart';

class SettingSubtitle extends StatelessWidget {
  const SettingSubtitle({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 8, 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.subtitle1!.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.bodyText1!.color!,
            ),
      ),
    );
  }
}
