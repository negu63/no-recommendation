import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  const TextTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "LIMELIGHT",
      style: Theme.of(context).textTheme.headline5,
    );
  }
}
