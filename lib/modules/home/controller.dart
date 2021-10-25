import 'package:get/get.dart';

class SearchInputController extends GetxController {
  RxString query = ''.obs;

  void changeQuery(String value) {
    query.value = value;
  }

  void search() {
    Get.toNamed('/web/$query');
  }
}
