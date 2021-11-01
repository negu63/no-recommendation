import 'package:flutter/material.dart';
import 'package:norecommendation/global_widgets/simple_appbar.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppbar(
        appbar: AppBar(),
        title: 'History',
        iconColor: Colors.black,
        foreColor: Colors.black,
        backgroundColor: Theme.of(context).canvasColor,
        shadowColor: Colors.transparent,
      ),
      body: Text('history page'),
    );
  }
}
