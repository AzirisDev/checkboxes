import 'package:checkboxes/painters/check_painter.dart';
import 'package:checkboxes/painters/circle_painter.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    Key? key,
    required this.checkLine1,
    required this.waveRadius1,
    required this.color,
  }) : super(key: key);

  final double checkLine1;
  final double waveRadius1;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: color,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            foregroundPainter: CheckPainter(checkLine1),
          ),
          CustomPaint(
            foregroundPainter: CirclePainter(waveRadius1),
          ),
        ],
      ),
    );
  }
}