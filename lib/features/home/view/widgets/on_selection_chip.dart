import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otex_app_test/core/responsive_manager/app_borders.dart';
import 'package:otex_app_test/core/responsive_manager/spacing_facade.dart';
import 'package:otex_app_test/core/text_styling/extensions/app_text_theme.dart';
import 'package:otex_app_test/core/theme_manager/service/app_colors.dart';
import 'package:otex_app_test/features/home/view_model/home_bloc.dart';

class OneSelectionChips extends StatelessWidget {
  final bool selected;
  final String label;

  const OneSelectionChips({
    super.key,
    required this.selected,
    required this.label,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Spacing.s44,
      padding: EdgeInsets.symmetric(
        horizontal: Spacing.s12,
        vertical: Spacing.s8,
      ),
      decoration: ShapeDecoration(
        color: selected ? context.colors.whiteOrange : context.colors.primary0,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: context.colors.borderGray),
          borderRadius: BorderRadius.circular(AppBorders.appBorderWidthR7),
        ),
      ),
      child: Text(
        label,
        style: context.typography.bodyMedium.copyWith(
          color: selected ? context.colors.darkOrange : context.colors.gray,
        ),
      ),
    );
  }
}

class OneSelectionChipList extends StatefulWidget {
  const OneSelectionChipList({super.key});

  @override
  State<OneSelectionChipList> createState() => _OneSelectionChipListState();
}

class _OneSelectionChipListState extends State<OneSelectionChipList> {
  List<String> options = [
    'كل العروض',
    'ملابس',
    'أكسسوارات',
    'إلكترونيات',
    'كل العروض',
    'ملابس',
    'أكسسوارات',
    'إلكترونيات',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Spacing.s44,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: options.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              context.read<HomeBloc>().add(ChangeBaseCategoryEvent(index));
            },
            child: Padding(
              padding: EdgeInsets.only(right: Spacing.s8),
              child: OneSelectionChips(
                selected:
                    context.read<HomeBloc>().state.baseCategoryIndex == index,
                label: options[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
