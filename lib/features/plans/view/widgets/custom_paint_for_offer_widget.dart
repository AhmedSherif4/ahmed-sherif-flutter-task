import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, 6.10352);
    path_0.lineTo(-5, -5);
    path_0.lineTo(135, -5);
    path_0.lineTo(135, 31.0001);
    path_0.lineTo(0, 31.0001);
    path_0.lineTo(9.5, 16.174);
    path_0.lineTo(0, 6.10352);
    path_0.lineTo(-5, -5);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xffFFDBDB).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
