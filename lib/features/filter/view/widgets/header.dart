import 'package:flutter/material.dart';
import 'package:otex_app_test/config/routes/route_manager.dart';
import 'package:otex_app_test/core/responsive_manager/spacing_facade.dart';
import 'package:otex_app_test/core/text_styling/extensions/app_text_theme.dart';
import 'package:otex_app_test/core/theme_manager/service/app_colors.dart';

class HeaderFilterScreen extends StatelessWidget {
  const HeaderFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.close_sharp, size: Spacing.s20, color: context.colors.black),
        Spacing.spaceSW16,
        Text('فلترة', style: context.typography.headlineLarge),
        Spacer(),
        TextButton(
          onPressed: () {
            RouteManager.rPopRoute(context);
          },
          child: Text(
            'رجوع للأفتراضى',
            style: context.typography.titleLarge.copyWith(
              color: context.colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
