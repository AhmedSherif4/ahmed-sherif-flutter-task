import 'package:flutter/material.dart';
import 'package:otex_app_test/core/responsive_manager/app_borders.dart';
import 'package:otex_app_test/core/text_styling/extensions/app_text_theme.dart';
import 'package:otex_app_test/core/theme_manager/service/app_colors.dart';

class ContactWithSupport extends StatelessWidget {
  const ContactWithSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppBorders.appBorderWidthR7),
      decoration: ShapeDecoration(
        color: const Color(0xFFF7F7F7),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Colors.black.withValues(alpha: 0.05),
          ),
          borderRadius: BorderRadius.circular(AppBorders.appBorderWidthR7),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'باقات مخصصة لك',
            textAlign: TextAlign.right,
            style: context.typography.bodyLarge,
          ),
          Text(
            'تواصل معنا لأختيار الباقة المناسبة لك',
            textAlign: TextAlign.right,
            style: context.typography.caption,
          ),
          Text(
            'فريق المبيعات',
            textAlign: TextAlign.center,
            style: context.typography.titleLarge.copyWith(
              color: context.colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
