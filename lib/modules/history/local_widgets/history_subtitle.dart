import 'package:flutter/material.dart';

class HistorySubtitle extends StatelessWidget {
  const HistorySubtitle({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 0, 8),
          child: Text(
            '${title.substring(0, 4)}년 ${title.substring(4, 6)}월 ${title.substring(6, 8)}일',
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: Colors.black,
                ),
          ),
        ),
      ],
    );
  }
}
