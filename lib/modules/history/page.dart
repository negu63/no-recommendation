import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:norecommendation/data/model/model.dart';
import 'package:norecommendation/global_widgets/simple_appbar.dart';
import 'package:norecommendation/modules/history/controller.dart';
import 'package:norecommendation/modules/history/local_widgets/watch_history.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HistoryController historyController = Get.find();

    return Scaffold(
      appBar: SimpleAppbar(
        appbar: AppBar(),
        title: 'History',
        iconColor: Colors.black,
        foreColor: Colors.black,
        backgroundColor: Theme.of(context).canvasColor,
        shadowColor: Colors.transparent,
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: historyController.histories.length,
          itemBuilder: (BuildContext context, int index) {
            int reverseIndex = historyController.histories.length - 1 - index;
            History history = historyController.histories[reverseIndex];
            return InkWell(
              onTap: () {},
              child: WatchHistory(history: history),
            );
          },
        ),
      ),
    );
  }
}
