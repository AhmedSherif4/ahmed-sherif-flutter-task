import 'package:flutter/material.dart';
import 'package:otex_app_test/core/responsive_manager/responsive_extensions.dart';
import 'package:otex_app_test/core/responsive_manager/spacing_facade.dart';
import 'package:otex_app_test/core/shared_widgets/button_widget.dart';
import 'package:otex_app_test/core/text_styling/extensions/app_text_theme.dart';
import 'package:otex_app_test/core/theme_manager/service/app_colors.dart';
import 'package:otex_app_test/features/plans/view/widgets/contact_with_support_widget.dart';
import 'package:otex_app_test/features/plans/view/widgets/plan_widget.dart';

class PlansScreen extends StatelessWidget {
  const PlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: Spacing.iconSize,
                  color: Colors.black,
                ),
                Spacing.spaceSW10,

                Text(
                  'أختر الباقات اللى تناسبك',
                  style: context.typography.headlineMedium.copyWith(),
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'أختار من باقات التمييز بل أسفل اللى تناسب أحتياجاتك',
                style: context.typography.bodySmall.copyWith(
                  color: context.colors.gray,
                ),
              ),
            ),
            Spacing.spaceHS24,
            PlansBlocView(),
            Spacing.spaceHS32,
            ContactWithSupport(),
            Spacing.spaceHS32,
            DefaultButtonWidget(
              label: 'التالي',
              onPressed: () {},
              icon: Icons.arrow_forward,
            ),
          ],
        ),
      ),
    ).paddingBody();
  }
}
