import 'package:flutter/material.dart';
import 'package:otex_app_test/core/responsive_manager/app_borders.dart';
import 'package:otex_app_test/core/responsive_manager/spacing_facade.dart';
import 'package:otex_app_test/core/text_styling/extensions/app_text_theme.dart';
import 'package:otex_app_test/core/theme_manager/service/app_colors.dart';

class DefaultButtonWidget extends StatelessWidget {
  final String label;
  final Function() onPressed;
  final IconData? icon;
  const DefaultButtonWidget({
    super.key,
    required this.label,
    required this.onPressed,

    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: context.colors.blue,
      minWidth: double.infinity,
      height: Spacing.buttonHeight,
      padding: EdgeInsetsDirectional.symmetric(
        vertical: AppBorders.appBorderWidthR7,
        horizontal: AppBorders.appBorderWidthR15,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppBorders.appBorderWidthR30),
        side: BorderSide(color: context.colors.blue),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            textAlign: TextAlign.center,
            maxLines: 1,
            style: context.typography.titleMedium.copyWith(
              color: context.colors.primary0,
            ),
          ),
          if (icon != null) ...[
            Spacing.spaceSW5,
            Icon(icon, size: Spacing.iconSize, color: context.colors.primary0),
          ],
        ],
      ),
    );
  }
}
