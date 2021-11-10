import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:norecommendation/core/theme/color_theme.dart';

class Spotlight extends StatelessWidget {
  const Spotlight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          CustomPaint(
            size: Size(Get.width, Get.height),
            painter: DrawTriangle(),
          ),
        ],
      ),
    );
  }
}

class DrawTriangle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(40, size.height / 1.9);
    path.cubicTo(
        size.width / 5,
        size.height / 1.55,
        size.width - (size.width / 5),
        size.height / 1.55,
        size.width - 40,
        size.height / 1.9);

    canvas.drawPath(path, Paint()..color = Color.fromRGBO(255, 255, 255, 1));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
