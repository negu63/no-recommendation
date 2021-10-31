import 'package:get/get.dart';
import 'package:norecommendation/core/utils/box_manager.dart';

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
    var _queries = loadFromHive('db', 'queries');
    if (_queries != null) queries.value = _queries;
  }

  void addQuery(String query) async {
    int index = queries.indexOf(query);

    if (index != -1) {
      queries.removeAt(index);
    }
    queries.add(query);

    saveToHive('db', 'queries', queries);
  }

  void removeAtQuery(int index) async {
    queries.removeAt(index);

    saveToHive('db', 'queries', queries);
  }
}
