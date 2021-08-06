
import 'package:flutter/material.dart';

class CheckPainter extends CustomPainter {
  double checkLine;
  var pathPaint;

  CheckPainter(this.checkLine) {
    pathPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2.0;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(Offset(size.width / 2 - checkLine, size.height / 2),
        Offset(size.width / 2, size.height / 2 + checkLine), pathPaint);

    canvas.drawLine(
        Offset(size.width / 2 - checkLine / 6 * 1, size.height / 2 + checkLine),
        Offset(size.width / 2 + checkLine / 6 * 8,
            size.height / 2 - checkLine / 6 * 4),
        pathPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
