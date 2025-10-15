import 'package:flutter/material.dart';

import 'responsive_context.dart';
import 'responsive_extensions.dart';

/// Facade for easy spacing usage
class Spacing {
  Spacing._();

  static double get buttonHeight =>
      SpacingContext.instance.spacing.buttonHeight.h;
  static double get gridProductHeight =>
      SpacingContext.instance.spacing.gridProductHeight.h;
  static double get navBarH => SpacingContext.instance.spacing.navBarH.h;
  static double get iconSize => SpacingContext.instance.spacing.iconSize.h;
  static double get subCategoryCardWidth =>
      SpacingContext.instance.spacing.subCategoryCardWidth.w;
  static double get subCategoryCardHeight =>
      SpacingContext.instance.spacing.subCategoryCardHeight.h;

  static double get productWidth =>
      SpacingContext.instance.spacing.productWidth.w;
  static double get productHeight =>
      SpacingContext.instance.spacing.productHeight.h;

  static double get s16 => SpacingContext.instance.spacing.s16;
  static double get s24 => SpacingContext.instance.spacing.s24;
  static double get s32 => SpacingContext.instance.spacing.s32;
  static double get s50 => SpacingContext.instance.spacing.s50;
  static double get s10 => SpacingContext.instance.spacing.s10;
  static double get s12 => SpacingContext.instance.spacing.s12;
  static double get s5 => SpacingContext.instance.spacing.s5;
  static double get s20 => SpacingContext.instance.spacing.s20;

  static double get s8 => SpacingContext.instance.spacing.s8;
  static double get s28 => SpacingContext.instance.spacing.s28;
  static double get s44 => SpacingContext.instance.spacing.s44;
  static double get s70 => SpacingContext.instance.spacing.s70;
  static double get s100 => SpacingContext.instance.spacing.s100;

  static SizedBox get spaceHS16 => SizedBox(height: s16.h);
  static SizedBox get spaceHS5 => SizedBox(height: s5.h);

  static SizedBox get spaceSW16 => SizedBox(width: s16.w);
  static SizedBox get spaceSW5 => SizedBox(width: s5.w);
  static SizedBox get spaceHS24 => SizedBox(height: s24.h);
  static SizedBox get spaceSW24 => SizedBox(width: s24.w);
  static SizedBox get spaceHS32 => SizedBox(height: s32.h);
  static SizedBox get spaceSW32 => SizedBox(width: s32.w);
  static SizedBox get spaceHS10 => SizedBox(height: s10.h);
  static SizedBox get spaceSW10 => SizedBox(width: s10.w);
  static SizedBox get spaceHS50 => SizedBox(height: s50.h);
  static SizedBox get spaceSW50 => SizedBox(width: s50.w);
}
