import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otex_app_test/core/models/category_model.dart';
import 'package:otex_app_test/core/responsive_manager/app_borders.dart';
import 'package:otex_app_test/core/responsive_manager/spacing_facade.dart';
import 'package:otex_app_test/core/text_styling/extensions/app_text_theme.dart';
import 'package:otex_app_test/core/theme_manager/service/app_colors.dart';
import 'package:otex_app_test/features/home/view_model/home_bloc.dart';

class SubCategoryCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  const SubCategoryCard({
    super.key,
    required this.title,
    required this.imageUrl,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: Spacing.s12),
      child: SizedBox(
        width: Spacing.subCategoryCardWidth,
        height: Spacing.subCategoryCardHeight,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: Spacing.s5,
          children: [
            Container(
              color: context.colors.grayOpacity10,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  AppBorders.appBorderWidthR7,
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  imageUrl,
                  width: double.infinity,
                  height: Spacing.s50,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            Text(title, style: context.typography.caption),
          ],
        ),
      ),
    );
  }
}

class CategoriesListView extends StatelessWidget {
  final List<CategoryModel> categories;
  final Function(int, int) onCategoryTap;
  final int selectedIndex;

  const CategoriesListView({
    super.key,
    required this.categories,
    required this.onCategoryTap,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Spacing.subCategoryCardHeight,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () => onCategoryTap(index, category.id!),
            child: SubCategoryCard(
              title: category.name,
              imageUrl: category.image!,
            ),
          );
        },
      ),
    );
  }
}

class CategoriesBlocListView extends StatelessWidget {
  const CategoriesBlocListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return CategoriesListView(
          categories: state.categories,
          selectedIndex: state.categoryIndex,
          onCategoryTap: (index, id) {
            context.read<HomeBloc>().add(
              ChangeCategoryEvent(categoryIndex: index, categoryId: id),
            );
          },
        );
      },
    );
  }
}
