import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchInputController extends GetxController {
  RxString query = ''.obs;

  void changeQuery(String value) {
    query.value = value;
  }

  void search() {
    launch('https://www.youtube.com/results?search_query=$query');
  }
}
