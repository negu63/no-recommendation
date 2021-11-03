import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:norecommendation/data/model/model.dart';
import 'package:norecommendation/global_widgets/simple_appbar.dart';
import 'package:norecommendation/modules/history/controller.dart';
import 'package:norecommendation/modules/history/local_widgets/history_subtitle.dart';
import 'package:norecommendation/modules/history/local_widgets/watch_history.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HistoryController historyController = Get.find();
    String date =
        '${DateTime.now().year}${DateTime.now().month}${DateTime.now().day}';

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
          physics: const BouncingScrollPhysics(),
          itemCount: historyController.histories.length,
          itemBuilder: (BuildContext context, int index) {
            int reverseIndex = historyController.histories.length - 1 - index;
            History history = historyController.histories[reverseIndex];
            if (date != history.date) {
              date = history.date;
              return Column(
                children: [
                  HistorySubtitle(title: history.date),
                  InkWell(
                    onTap: () {
                      historyController.view(history);
                    },
                    child: WatchHistory(
                      history: history,
                    ),
                  ),
                ],
              );
            } else {
              return InkWell(
                onTap: () {
                  historyController.view(history);
                },
                child: WatchHistory(
                  history: history,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
