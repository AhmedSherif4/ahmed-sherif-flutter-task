import 'package:flutter/material.dart';
import 'package:otex_app_test/core/responsive_manager/app_borders.dart';
import 'package:otex_app_test/core/responsive_manager/app_padding.dart';
import 'package:otex_app_test/core/responsive_manager/spacing_facade.dart';
import 'package:otex_app_test/core/text_styling/extensions/app_text_theme.dart';
import 'package:otex_app_test/core/theme_manager/service/app_colors.dart';

class SelectableChips extends StatefulWidget {
  final Function(int) onTap;
  final int selectedIndex;
  final List<String> options;
  const SelectableChips({
    super.key,
    required this.options,
    required this.onTap,
    required this.selectedIndex,
  });

  @override
  State<SelectableChips> createState() => _SelectableChipsState();
}

class _SelectableChipsState extends State<SelectableChips> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Wrap(
        spacing: Spacing.s12,
        runSpacing: Spacing.s12,
        children: List.generate(widget.options.length, (index) {
          final isSelected = widget.selectedIndex == index;
          return GestureDetector(
            onTap: () {
              widget.onTap(index);
            },
            child: Container(
              padding: EdgeInsets.all(AppPadding.screenPaddingP10),
              decoration: BoxDecoration(
                color: isSelected
                    ? context.colors.whiteBlue
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(
                  AppBorders.appBorderWidthR30,
                ),
                border: Border.all(
                  color: isSelected ? context.colors.blue : context.colors.gray,
                  width: 2,
                ),
              ),
              child: Text(
                widget.options[index],
                style: context.typography.bodyMedium.copyWith(
                  color: isSelected ? context.colors.blue : context.colors.gray,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
