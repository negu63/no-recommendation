import 'package:get/get.dart';
import 'package:norecommendation/core/utils/box_manager.dart';

class SearchInputController extends GetxController {
  RxString query = ''.obs;
  RxList queries = [].obs;

  @override
  void onInit() {
    getQueries();
    super.onInit();
  }

  void search(String query, bool saving) async {
    saving == true ? addQuery(query) : null;
    Get.toNamed('/web/search');
  }

  Future getQueries() async {
    var _queries = await loadFromHive('db', 'queries');
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

  void clearQuery() {
    queries.clear();

    saveToHive('db', 'queries', queries);
  }
}
