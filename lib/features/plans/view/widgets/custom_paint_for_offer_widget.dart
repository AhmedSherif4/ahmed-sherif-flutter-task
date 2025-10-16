import 'package:flutter/material.dart';
import 'package:otex_app_test/core/text_styling/extensions/app_text_theme.dart';
import 'package:otex_app_test/core/theme_manager/service/app_colors.dart';

class SvgBackgroundText extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final double horizontalPadding;
  final double verticalPadding;

  const SvgBackgroundText({
    super.key,
    required this.text,
    this.backgroundColor = const Color(0xFFFFDBDB),
    this.horizontalPadding = 16.0,
    this.verticalPadding = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    // نحسب أبعاد النص
    final TextPainter tp = TextPainter(
      text: TextSpan(
        text: text,
        style: context.typography.caption.copyWith(color: context.colors.red),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    final double textWidth = tp.width;
    final double textHeight = tp.height;

    final double totalWidth = textWidth + horizontalPadding * 2;
    final double totalHeight = textHeight + verticalPadding * 2;

    return CustomPaint(
      size: Size(totalWidth, totalHeight),
      painter: _ResponsiveSvgPainter(fillColor: backgroundColor),
      child: Center(
        child: Text(
          text,
          style: context.typography.caption.copyWith(color: context.colors.red),
        ),
      ),
    );
  }
}

class _ResponsiveSvgPainter extends CustomPainter {
  final Color fillColor;
  _ResponsiveSvgPainter({required this.fillColor});

  @override
  void paint(Canvas canvas, Size size) {
    // بنرسم نفس الشكل لكن بنستخدم نسبة من width و height
    final Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(size.width * (9.5 / 135), size.height * (16.1739 / 31))
      ..lineTo(0, 0)
      ..close();

    final Paint paintFill = Paint()
      ..style = PaintingStyle.fill
      ..color = fillColor;

    canvas.drawPath(path, paintFill);
  }

  @override
  bool shouldRepaint(covariant _ResponsiveSvgPainter oldDelegate) =>
      oldDelegate.fillColor != fillColor;
}
