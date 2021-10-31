import 'package:get/get.dart';
import 'package:norecommendation/core/utils/box_manager.dart';

class SettingController extends GetxController {
  RxBool savingQuery = true.obs;
  RxBool savingHistory = true.obs;

  @override
  void onInit() async {
    loadSetting();
    super.onInit();
  }

  void loadSetting() async {
    savingQuery.value = await loadFromHive('setting', 'query');
    savingHistory.value = await loadFromHive('setting', 'history');
  }
}