import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:norecommendation/core/utils/box_manager.dart';
import 'package:norecommendation/data/model/model.dart';

class HistoryController extends GetxController {
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
    var _histories = await loadFromHive('db', 'histories');
    if (_histories != null) histories.value = _histories;
  }

  void addHistory(History history) async {
    int index = histories
        .indexWhere((element) => (element as History).url == history.url);
    debugPrint(index.toString());
    if (index != -1) {
      histories.removeAt(index);
    }
    histories.add(history);

    saveToHive('db', 'histories', histories);
  }

  void removeAtHistory(int index) async {
    histories.removeAt(index);

    saveToHive('db', 'histories', histories);
  }
}
