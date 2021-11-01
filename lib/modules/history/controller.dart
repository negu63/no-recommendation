import 'package:get/get.dart';
import 'package:norecommendation/core/utils/box_manager.dart';
import 'package:norecommendation/data/model/model.dart';

class HistoryController extends GetxController {
  RxList histories = [].obs;

  @override
  void onInit() {
    getHistories();
    super.onInit();
  }

  Future getHistories() async {
    var _histories = await loadFromHive('db', 'histories');
    if (_histories != null) histories.value = _histories;
  }

  void addHistory(History history) async {
    histories.add(history);

    saveToHive('db', 'histories', histories);
  }

  void removeAtHistory(int index) async {
    histories.removeAt(index);

    saveToHive('db', 'histories', histories);
  }
}
