import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SearchInputController extends GetxController {
  RxList queries = [].obs;

  @override
  void onInit() {
    getQueries();
    super.onInit();
  }

  void search(String query) async {
    addQuery(query);
    Get.toNamed('/web/$query');
  }

  void searchByHistory(int index) async {
    String query = queries[index];
    addQuery(query);
    removeAtQuery(index);
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

  void addQuery(String query) async {
    int index = queries.indexOf(query);

    if (index != -1) {
      queries.removeAt(index);
    }
    queries.add(query);

    Box box = await Hive.openBox('db');
    box.put('queries', queries);
  }

  void removeAtQuery(int index) async {
    queries.removeAt(index);

    Box box = await Hive.openBox('db');
    box.put('queries', queries);
  }
}
