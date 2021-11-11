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
                onPressed();
                Get.showSnackbar(
                  GetBar(
                    title: '삭제 완료',
                    message: '삭제되었습니다.',
                    snackPosition: SnackPosition.BOTTOM,
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              child: Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: darkGrey18,
                primary: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
