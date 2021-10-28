import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
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
    Box box;
    try {
      box = Hive.box('db');
    } catch (error) {
      box = await Hive.openBox('db');
      debugPrint(error.toString());
    }

    var _histories = box.get('histories');
    if (_histories != null) histories.value = _histories;
  }

  void addHistory(History history) async {
    histories.add(history);
    Box box = await Hive.openBox('db');
    box.put('histories', histories);
  }
}
