import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:norecommendation/core/theme/color_theme.dart';

class FunctionButton extends StatelessWidget {
  const FunctionButton({
    Key? key,
    required this.icon,
    required this.title,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final String label;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(flex: 1, child: Icon(icon)),
          Expanded(flex: 4, child: Text(title)),
          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () {
                Get.defaultDialog(
                  title: 'buttonClearTitle'.tr,
                  radius: 4,
                  content: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'buttonClearMessage'.tr,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  confirm: TextButton(
                    onPressed: () {
                      onPressed();
                      Get.back();
                      if (!Get.isSnackbarOpen!) {
                        Get.showSnackbar(
                          GetBar(
                            title: 'snackbarClearTitle'.tr,
                            message: 'snackbarClearMessage'.tr,
                            snackPosition: SnackPosition.BOTTOM,
                            duration: const Duration(seconds: 2),
                            isDismissible: true,
                          ),
                        );
                      }
                    },
                    style: TextButton.styleFrom(
                      primary: darkGrey30,
                    ),
                    child: Text(
                      'buttonClearConfirm'.tr,
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  cancel: TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      'buttonClearCancel'.tr,
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1!.color!,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      primary: darkGrey30,
                    ),
                  ),
                );
              },
              child: Text(
                label,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).textTheme.bodyText1!.color!,
                primary: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
