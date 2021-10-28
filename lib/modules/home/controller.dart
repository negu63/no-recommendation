import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SearchInputController extends GetxController {
  RxList queries = [].obs;
  RxString query = ''.obs;
  RxBool isFocused = false.obs;

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

    var _queries = box.get('queries');
    if (_queries != null) queries.value = _queries;
  }

  void addQuery() async {
    queries.add(query.value);
    Box box = await Hive.openBox('db');
    box.put('queries', queries);
  }

  void focusIn() {
    isFocused.value = true;
  }

  void focusOut() {
    isFocused.value = false;
  }
}
