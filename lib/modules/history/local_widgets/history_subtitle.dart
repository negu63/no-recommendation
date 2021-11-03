import 'package:flutter/material.dart';

class HistorySubtitle extends StatelessWidget {
  const HistorySubtitle({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 8, 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.subtitle1!.copyWith(
              color: Theme.of(context).primaryColor,
            ),
      ),
    );
  }
}
