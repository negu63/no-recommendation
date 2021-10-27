import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SearchInputController extends GetxController {
  RxList histories = [].obs;
  RxString query = ''.obs;

  @override
  void onInit() {
    getQueries();
    super.onInit();
  }

  void changeQuery(String value) {
    query.value = value;
  }

  void search() async {
    addQuery();
    Get.toNamed('/web/$query');
  }

  Future getQueries() async {
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

  void addQuery() async {
    histories.add(query.value);
    Box box = await Hive.openBox('db');
    box.put('histories', histories);
  }
}
