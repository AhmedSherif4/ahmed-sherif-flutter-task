/// Interface for spacing tokens (raw values only)
abstract class ISpacingConfig {
  double get s8;
  double get s16;
  double get s24;
  double get s28;
  double get s32;
  double get s50;
  double get s10;
  double get s12;
  double get s44;
  double get s5;
  double get s20;
  double get s40;
  double get s70;
  double get s100;
  double get navBarH;
  double get iconSize;
  double get subCategoryCardWidth;
  double get subCategoryCardHeight;
  double get productWidth;
  double get productHeight;
  double get buttonHeight;
  double get gridProductHeight;
}

class MobileSpacingConfig implements ISpacingConfig {
  @override
  double get gridProductHeight => 285.0;

  @override
  double get s100 => 100.0;
  @override
  double get s70 => 70.0;

  @override
  double get buttonHeight => 44.0;

  @override
  double get productWidth => 158.0;

  @override
  double get productHeight => 360.0;

  @override
  double get subCategoryCardWidth => 73.0;

  @override
  double get subCategoryCardHeight => 78.0;

  @override
  double get s16 => 16.0;
  @override
  double get s24 => 24.0;

  @override
  double get s32 => 32.0;

  @override
  double get s50 => 50.0;
  @override
  double get s10 => 10.0;
  @override
  double get s5 => 5.0;
  @override
  double get s20 => 20.0;

  @override
  @override
  double get s8 => 8.0;
  @override
  double get s28 => 28.0;

  @override
  double get s44 => 44.0;

  @override
  double get s40 => 40.0;

  @override
  double get s12 => 12.0;
  @override
  double get navBarH => 62.0;

  @override
  double get iconSize => 24.0;
}

class TabletSpacingConfig implements ISpacingConfig {
  @override
  double get gridProductHeight => 370.0;

  @override
  double get s100 => 110.0;

  @override
  double get s70 => 80.0;

  @override
  double get buttonHeight => 55.0;

  @override
  double get productWidth => 258.0;

  @override
  double get productHeight => 360.0;

  @override
  double get subCategoryCardWidth => 120.0;

  @override
  double get subCategoryCardHeight => 100.0;

  @override
  double get s16 => 24.0;
  @override
  double get s24 => 32.0;
  @override
  double get s32 => 40.0;
  @override
  double get s50 => 75.0;
  @override
  @override
  double get s10 => 15.0;
  @override
  double get s5 => 10.0;
  @override
  double get s20 => 20.0;

  @override
  double get s8 => 12.0;

  @override
  double get s28 => 42.0;
  @override
  double get s44 => 66.0;

  @override
  double get s12 => 15.0;

  @override
  double get s40 => 55;

  @override
  double get navBarH => 82.0;

  @override
  double get iconSize => 34.0;
}
