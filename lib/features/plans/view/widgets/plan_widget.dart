import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otex_app_test/core/models/plan_model.dart';
import 'package:otex_app_test/core/responsive_manager/app_borders.dart';
import 'package:otex_app_test/core/responsive_manager/app_padding.dart';
import 'package:otex_app_test/core/responsive_manager/spacing_facade.dart';
import 'package:otex_app_test/core/text_styling/extensions/app_text_theme.dart';
import 'package:otex_app_test/core/theme_manager/service/app_colors.dart';
import 'package:otex_app_test/features/plans/view/widgets/custom_paint_for_offer_widget.dart';
import 'package:otex_app_test/features/plans/view_model/plan_bloc.dart';

class PlanWidget extends StatelessWidget {
  final bool selected;
  final PlanModel plan;
  const PlanWidget({super.key, required this.plan, required this.selected});

  @override
  Widget build(BuildContext context) {
    final WIDTH = 1500.0;
    return Stack(
      clipBehavior: Clip.none, // علشان الزرار يطلع برا حدود الStack
      alignment: AlignmentDirectional.topStart,
      children: [
        plan.offerLabel != null
            ? Positioned(
                top: 10,
                child: SvgBackgroundText(text: '${plan.offerLabel}'),
              )
            : SizedBox.shrink(),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(AppPadding.screenPaddingP16),
          margin: EdgeInsets.symmetric(vertical: AppPadding.screenPaddingP16),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: context.colors.grayOpacity10),
              borderRadius: BorderRadius.circular(AppBorders.appBorderWidthR15),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x0A090F1F),
                blurRadius: 5,
                offset: Offset(0, 4),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            spacing: Spacing.s16,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 4,
                children: [
                  Icon(
                    selected
                        ? Icons.check_box_rounded
                        : Icons.check_box_outline_blank,
                    size: Spacing.iconSize,
                    color: selected
                        ? context.colors.purple
                        : context.colors.black,
                  ),
                  Text(
                    plan.name,
                    style: context.typography.titleMedium.copyWith(
                      color: selected
                          ? context.colors.purple
                          : context.colors.black,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '${plan.price}ج.م',
                    style: context.typography.titleMedium.copyWith(
                      color: context.colors.darkOrange,
                      decoration: TextDecoration.underline,
                      decorationColor: context.colors.darkOrange,
                      decorationThickness: 30,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: AppBorders.appBorderWidthR7,
                ),
                child: Divider(
                  color: context.colors.grayOpacity10,
                  thickness: 1,
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(plan.details.length, (index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            height: Spacing.iconSize,
                            width: Spacing.iconSize,
                            child: SvgPicture.asset(
                              plan.details[index]['icon']!,
                              height: Spacing.iconSize,
                              width: Spacing.iconSize,
                            ),
                          ),
                          Spacing.spaceSW10,
                          Text.rich(
                            TextSpan(
                              children: () {
                                final value = plan.details[index]['text']!;
                                final parts = value.split('\n');
                                return [
                                  TextSpan(
                                    text: parts.first,
                                    style: context.typography.bodyMedium,
                                  ),
                                  if (parts.length > 1)
                                    TextSpan(
                                      text:
                                          '\n${parts.sublist(1).join('\n')}', // لو فيه أكتر من \n
                                      style: context.typography.bodyMedium
                                          .copyWith(color: context.colors.red),
                                    ),
                                ];
                              }(),
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                  NumberOfViews(viewsMultiplier: plan.viewsMultiplier),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class NumberOfViews extends StatelessWidget {
  final int viewsMultiplier;
  const NumberOfViews({super.key, required this.viewsMultiplier});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Spacing.s70,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: Spacing.s5,
        children: [
          Container(
            width: double.infinity,
            height: Spacing.s44,
            padding: EdgeInsets.symmetric(
              vertical: AppPadding.screenPaddingP10,
            ),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: const Color(0x0C3A813F),
              border: const Border(
                top: BorderSide(width: 1, color: Color(0xFF3A813F)),
                left: BorderSide(width: 1, color: Color(0xFF3A813F)),
                right: BorderSide(width: 1, color: Color(0xFF3A813F)),
                bottom: BorderSide.none,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppBorders.appBorderWidthR33),
                topRight: Radius.circular(AppBorders.appBorderWidthR33),
              ),
            ),
            child: Text(
              '$viewsMultiplier',
              textAlign: TextAlign.center,
              style: context.typography.bodyMedium.copyWith(
                color: const Color(0xFF3A813F),
              ),
            ),
          ),
          Text(
            'ضعف عدد المشاهدات',
            textAlign: TextAlign.center,
            maxLines: 2,
            style: context.typography.caption.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}

class PlansList extends StatelessWidget {
  final List<PlanModel> plans;
  const PlansList({super.key, required this.plans});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: plans.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            context.read<PlanBloc>().add(ChangePlanEvent(index));
          },
          child: PlanWidget(
            selected: context.read<PlanBloc>().state.planIndex == index,
            plan: plans[index],
          ),
        );
      },
    );
  }
}

class PlansBlocView extends StatelessWidget {
  const PlansBlocView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlanBloc, PlanState>(
      builder: (context, state) {
        return PlansList(plans: state.plans);
      },
    );
  }
}
