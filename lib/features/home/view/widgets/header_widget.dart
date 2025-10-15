import 'package:flutter/material.dart';
import 'package:otex_app_test/config/routes/route_manager.dart';
import 'package:otex_app_test/config/routes/routes_names.dart';
import 'package:otex_app_test/core/responsive_manager/spacing_facade.dart';
import 'package:otex_app_test/core/text_styling/extensions/app_text_theme.dart';
import 'package:otex_app_test/core/theme_manager/service/app_colors.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'أستكشف العروض',
          style: context.typography.titleMedium.copyWith(
            color: context.colors.black,
          ),
        ),
        InkWell(
          onTap: () {
            RouteManager.rPushNamed(
              context: context,
              rName: AppRoutesNames.rFilterScreen,
            );
          },
          child: Row(
            children: [
              Text(
                'الكل',
                style: context.typography.titleMedium.copyWith(
                  color: context.colors.gray,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                Icons.arrow_forward,
                size: Spacing.iconSize,
                color: context.colors.gray,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
