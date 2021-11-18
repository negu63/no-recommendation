import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:norecommendation/core/utils/box_manager.dart';

class ToggleButton extends StatelessWidget {
  const ToggleButton({
    Key? key,
    required this.icon,
    required this.title,
    required this.name,
    required this.state,
    this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final String name;
  final RxBool state;
  final Function()? onPressed;

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
                  if (onPressed != null) {
                    onPressed!();
                  }
                  state.value = value;
                  saveToHive('setting', name, value);
                  if (!Get.isSnackbarOpen!) {
                    Get.showSnackbar(
                      GetBar(
                        title: 'snackbarToggleTitle'.tr,
                        message: 'snackbarToggleMessage'.tr,
                        snackPosition: SnackPosition.BOTTOM,
                        duration: const Duration(seconds: 2),
                        isDismissible: true,
                      ),
                    );
                  }
                },
                activeColor: Theme.of(context).toggleableActiveColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
