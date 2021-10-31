import 'package:flutter/material.dart';

class SettingSubtitle extends StatelessWidget {
  const SettingSubtitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 8, 8),
      child: Text(
        'subtitle',
        style: Theme.of(context).textTheme.subtitle1!.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
      ),
    );
  }
}
