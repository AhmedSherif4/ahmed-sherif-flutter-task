import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:otex_app_test/core/models/product_model.dart';
import 'package:otex_app_test/core/responsive_manager/app_borders.dart';
import 'package:otex_app_test/core/responsive_manager/responsive_extensions.dart';
import 'package:otex_app_test/core/responsive_manager/spacing_facade.dart';
import 'package:otex_app_test/core/text_styling/extensions/app_text_theme.dart';
import 'package:otex_app_test/core/theme_manager/service/app_colors.dart';
import 'package:otex_app_test/features/home/view_model/home_bloc.dart';

import '../../../../app_assets/app_assets.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigate to product details by id
      },
      child: Container(
        width: Spacing.productWidth,
        height: Spacing.productHeight,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: context.colors.borderGray),
            borderRadius: BorderRadius.circular(AppBorders.appBorderWidthR7),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: context.colors.grayOpacity5,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppBorders.appBorderWidthR7),
                  topRight: Radius.circular(AppBorders.appBorderWidthR7),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  product.image,
                  width: double.infinity,
                  height: Spacing.productWidth,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    product.name,
                    style: context.typography.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                SvgPicture.asset(
                  Assets.iconsOffer,
                  width: Spacing.iconSize,
                  height: Spacing.iconSize,
                ),
              ],
            ).paddingBody(horizontal: 8, vertical: 0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text.rich(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    TextSpan(
                      children: [
                        TextSpan(
                          text:
                              '${NumberFormat('#,###', 'en').format(product.priceAfter)}جم/',
                          style: context.typography.bodyLarge.copyWith(
                            color: context.colors.darkOrange,
                          ),
                        ),
                        TextSpan(
                          text:
                              '${NumberFormat('#,###', 'en').format(product.priceBefore)}جم',
                          style: context.typography.labelLarge.copyWith(
                            color: context.colors.gray,
                            decoration: TextDecoration.lineThrough,
                            decorationThickness: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SvgPicture.asset(
                  Assets.iconsFavorite,
                  width: Spacing.iconSize,
                  height: Spacing.iconSize,
                ),
              ],
            ).paddingBody(horizontal: 8, vertical: 0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  Assets.iconsLocalFireDepartment,
                  width: Spacing.s12,
                  height: Spacing.s12,
                ),
                Spacing.spaceSW5,
                Text(
                  'تم بيع ${product.salesCount}k+',
                  style: context.typography.caption.copyWith(
                    color: context.colors.gray,
                  ),
                ),
              ],
            ).paddingBody(horizontal: 8, vertical: 0),
            Row(
              children: [
                SvgPicture.asset(
                  Assets.iconsCompanyBadge,
                  width: Spacing.iconSize,
                  height: Spacing.iconSize,
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    // Add to cart action
                  },
                  child: SvgPicture.asset(
                    Assets.iconsAddToCart,
                    width: Spacing.iconSize,
                    height: Spacing.iconSize,
                  ),
                ),
                Spacing.spaceSW10,
                Image.asset(
                  Assets.iconsTmg,
                  width: Spacing.iconSize,
                  height: Spacing.iconSize,
                  fit: BoxFit.contain,
                ),
              ],
            ).paddingBody(horizontal: 8, vertical: 0),
          ],
        ),
      ),
    );
  }
}

class ProductCardGrid extends StatelessWidget {
  final List<ProductModel> products;
  const ProductCardGrid({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: Spacing.s12,
        mainAxisSpacing: Spacing.s12,
        mainAxisExtent: Spacing.gridProductHeight,
      ),
      itemBuilder: (context, index) => ProductCard(product: products[index]),
    ).paddingBody(horizontal: 4);
  }
}

class ProductsBlocGridView extends StatelessWidget {
  const ProductsBlocGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return ProductCardGrid(products: state.products);
      },
    );
  }
}
