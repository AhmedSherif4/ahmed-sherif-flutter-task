import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:otex_app_test/app_assets/app_assets.dart';
import 'package:otex_app_test/core/responsive_manager/app_borders.dart';
import 'package:otex_app_test/core/responsive_manager/responsive_extensions.dart';
import 'package:otex_app_test/core/responsive_manager/spacing_facade.dart';
import 'package:otex_app_test/core/shared_widgets/button_widget.dart';
import 'package:otex_app_test/core/text_styling/extensions/app_text_theme.dart';
import 'package:otex_app_test/core/theme_manager/service/app_colors.dart';
import 'package:otex_app_test/features/filter/view/widgets/header.dart';
import 'package:otex_app_test/features/filter/view/widgets/selectable_chips.dart';
import 'package:otex_app_test/features/filter/view_model/filter_bloc.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderFilterScreen(),
              Spacing.spaceHS32,
              TitleWidget(title: 'الفئة'),
              Spacing.spaceHS16,
              _ChangeWidget(),
              Spacing.spaceHS24,
              Divider(color: context.colors.grayOpacity10, thickness: 1),
              Spacing.spaceHS24,
              _LocationWidget(),
              Spacing.spaceHS24,
              Divider(color: context.colors.grayOpacity10, thickness: 1),
              TitleWidget(title: 'الأقساط الشهرية'),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: Spacing.s50,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: '',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              AppBorders.appBorderWidthR7,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Spacing.spaceSW10,
                  Expanded(
                    child: SizedBox(
                      height: Spacing.s50,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: '',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              AppBorders.appBorderWidthR7,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              TitleWidget(title: 'النوع'),
              SelectableChips(
                options: ['الكل', 'توين هاوس', 'فيلا منفصلة', 'تاون هاوس'],
                onTap: (int index) {
                  context.read<FilterBloc>().add(ChangeTypeEvent(index));
                },
                selectedIndex: context.select(
                  (FilterBloc bloc) => bloc.state.typeIndex,
                ),
              ),
              TitleWidget(title: 'عدد الغرف'),
              SelectableChips(
                options: ['4 غرف', '5 غرف+', 'الكل', 'غرفتين', '3 غرف'],
                onTap: (int index) {
                  context.read<FilterBloc>().add(ChangeRoomCountEvent(index));
                },
                selectedIndex: context.select(
                  (FilterBloc bloc) => bloc.state.roomCountIndex,
                ),
              ),
              TitleWidget(title: 'السعر'),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: Spacing.s50,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'أقل سعر',
                          hintStyle: context.typography.bodyMedium.copyWith(
                            color: context.colors.gray,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              AppBorders.appBorderWidthR7,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Spacing.spaceSW10,
                  Expanded(
                    child: SizedBox(
                      height: Spacing.s50,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'أقصى سعر',
                          hintStyle: context.typography.bodyMedium.copyWith(
                            color: context.colors.gray,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              AppBorders.appBorderWidthR7,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              TitleWidget(title: 'طريقة الدفع'),
              SelectableChips(
                options: ['أى', 'تقسيط', 'كاش'],
                onTap: (int index) {
                  context.read<FilterBloc>().add(
                    ChangePaymentMethodEvent(index),
                  );
                },
                selectedIndex: context.select(
                  (FilterBloc bloc) => bloc.state.paymentMethodIndex,
                ),
              ),
              TitleWidget(title: 'حالة العقار'),
              SelectableChips(
                options: ['أى', 'جاهز', 'قيد الأنشاء'],
                onTap: (int index) {
                  context.read<FilterBloc>().add(
                    ChangePropertyConditionEvent(index),
                  );
                },
                selectedIndex: context.select(
                  (FilterBloc bloc) => bloc.state.propertyConditionIndex,
                ),
              ),
              Spacing.spaceHS50,
              DefaultButtonWidget(
                label: 'شاهد 10,000+ نتائج',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ).paddingBody(),
    );
  }
}

class _LocationWidget extends StatelessWidget {
  const _LocationWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          Assets.iconsLocationOn,
          height: Spacing.iconSize,
          width: Spacing.iconSize,
          colorFilter: ColorFilter.mode(context.colors.black, BlendMode.srcIn),
        ),
        Spacing.spaceSW16,
        Column(
          children: [
            Text('الموقع', style: context.typography.bodyMedium),
            Text(
              'مصر',
              style: context.typography.caption.copyWith(
                color: context.colors.gray,
              ),
            ),
          ],
        ),
        Spacer(),
        TextButton(
          onPressed: () {},
          child: Icon(
            Icons.arrow_forward_ios_rounded,
            size: Spacing.iconSize,
            color: context.colors.black,
          ),
        ),
      ],
    );
  }
}

class _ChangeWidget extends StatelessWidget {
  const _ChangeWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          Assets.iconsCars,
          height: Spacing.iconSize,
          width: Spacing.iconSize,
        ),
        Spacing.spaceSW16,
        Column(
          children: [
            Text('عقارات', style: context.typography.bodyMedium),
            Text(
              'فلل البيع',
              style: context.typography.caption.copyWith(
                color: context.colors.gray,
              ),
            ),
          ],
        ),
        Spacer(),
        TextButton(
          onPressed: () {},
          child: Text(
            'تغيير',
            style: context.typography.bodyMedium.copyWith(
              color: context.colors.purple,
            ),
          ),
        ),
      ],
    );
  }
}

class TitleWidget extends StatelessWidget {
  final String title;
  const TitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacing.spaceHS24,
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            title,
            style: context.typography.titleMedium.copyWith(
              color: context.colors.gray,
            ),
          ),
        ),
        Spacing.spaceHS10,
      ],
    );
  }
}
