import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:norecommendation/core/theme/color_theme.dart';

class RemoveButton extends StatelessWidget {
  const RemoveButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.clear,
        color: Theme.of(context).textTheme.bodyText1!.color!,
      ),
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
              primary: darkGrey46,
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
              primary: Theme.of(context).textTheme.bodyText1!.color!,
            ),
          ),
        );
      },
    );
  }
}
