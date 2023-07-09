import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class GradientLine extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.007355175, size.height * 0.7578800),
        Offset(size.width * 0.04045624, size.height * 27.64025),
        [Color(0xffFBFE7D).withOpacity(1), Color(0xff5B5C07).withOpacity(1)],
        [0, 1]);
    canvas.drawRect(
        Rect.fromLTWH(0, 0, size.width * 1.0995840, size.height), paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
