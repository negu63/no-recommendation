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

  void view(History history) {
    addHistory(history);
    Get.toNamed(
        '/web/watch/${history.url.substring(history.url.indexOf('=') + 1)}');
  }

  Future getHistories() async {
    var _histories = await loadFromHive('db', 'histories');
    if (_histories != null) histories.value = _histories;
  }

  int findHistoryIndex(History history) {
    return histories
        .indexWhere((element) => (element as History).url == history.url);
  }

  void addHistory(History history) async {
    int index = findHistoryIndex(history);
    if (index != -1) {
      histories.removeAt(index);
    }
    histories.add(history);

    saveToHive('db', 'histories', histories);
  }

  void removeAtHistory(History history) async {
    int index = findHistoryIndex(history);
    if (index != -1) {
      histories.removeAt(index);
    }

    saveToHive('db', 'histories', histories);
  }

  void clearHistory() {
    histories.clear();

    saveToHive('db', 'histories', histories);
  }
}
