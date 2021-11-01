import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:norecommendation/core/utils/box_manager.dart';
import 'package:norecommendation/data/model/model.dart';

class WebViewController extends GetxController {
  RxList histories = [].obs;

  @override
  void onInit() {
    try {
      Hive.registerAdapter(HistoryAdapter());
    } catch (error) {
      debugPrint(error.toString());
    }
    getHistories();
    super.onInit();
  }

  Future getHistories() async {
    var _histories = loadFromHive('db', 'histories');
    if (_histories != null) histories.value = _histories;
  }

  void addHistory(History history) async {
    histories.add(history);

    saveToHive('db', 'histories', histories);
  }
}
