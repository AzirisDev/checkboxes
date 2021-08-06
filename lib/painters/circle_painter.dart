
import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter {
  final double waveAnimatedRadius;
  var circlePaint;

  CirclePainter(this.waveAnimatedRadius) {
    circlePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    canvas.drawCircle(
        Offset(centerX, centerY), waveAnimatedRadius, circlePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
