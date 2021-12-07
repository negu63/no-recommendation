import 'package:get/get.dart';
import 'package:norecommendation/core/utils/box_manager.dart';

class SettingController extends GetxController {
  RxBool savingQuery = true.obs;
  RxBool showingTab = true.obs;
  RxBool showingComment = true.obs;
  RxBool isDark = true.obs;
  RxBool backgroundPlay = false.obs;

  @override
  void onInit() async {
    loadSetting();
    super.onInit();
  }

  void loadSetting() async {
    savingQuery.value = await loadFromHive('setting', 'query');
    showingTab.value = await loadFromHive('setting', 'tab');
    showingComment.value = await loadFromHive('setting', 'comment');
    isDark.value = await loadFromHive('setting', 'isDark');
    backgroundPlay.value = await loadFromHive('setting', 'backgroundPlay');
  }
}
