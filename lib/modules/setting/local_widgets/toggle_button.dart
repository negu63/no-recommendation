import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:norecommendation/core/theme/color_theme.dart';
import 'package:norecommendation/core/utils/box_manager.dart';

class ToggleButton extends StatelessWidget {
  const ToggleButton({
    Key? key,
    required this.icon,
    required this.title,
    required this.name,
    required this.state,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final String name;
  final RxBool state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(flex: 1, child: Icon(icon)),
          Expanded(flex: 4, child: Text(title)),
          Expanded(
            flex: 1,
            child: Obx(
              () => Switch(
                value: state.value,
                onChanged: (value) {
                  state.value = value;
                  saveToHive('setting', name, value);
                  if (!Get.isSnackbarOpen!) {
                    Get.showSnackbar(
                      GetBar(
                        title: '설정 완료',
                        message: '설정이 저장되었습니다.',
                        snackPosition: SnackPosition.BOTTOM,
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  }
                },
                activeColor: darkGrey18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
