import 'package:flutter/material.dart';
import 'package:otex_app_test/core/theme_manager/models/semantic_colors.dart';

class AppColorsTheme extends ThemeExtension<AppColorsTheme> {
  final SemanticColors semantic;

  const AppColorsTheme({required this.semantic});

  @override
  AppColorsTheme copyWith({SemanticColors? semantic}) {
    return AppColorsTheme(semantic: semantic ?? this.semantic);
  }

  @override
  AppColorsTheme lerp(ThemeExtension<AppColorsTheme>? other, double t) {
    if (other is! AppColorsTheme) return this;

    return AppColorsTheme(
      semantic: SemanticColors(
        whiteBlue: Color.lerp(semantic.whiteBlue, other.semantic.whiteBlue, t)!,
        purple: Color.lerp(semantic.purple, other.semantic.purple, t)!,
        blue: Color.lerp(semantic.blue, other.semantic.blue, t)!,
        primary0: Color.lerp(semantic.primary0, other.semantic.primary0, t)!,
        primary1: Color.lerp(semantic.primary1, other.semantic.primary1, t)!,
        primary2: Color.lerp(semantic.primary2, other.semantic.primary2, t)!,
        grayOpacity10: Color.lerp(
          semantic.grayOpacity10,
          other.semantic.grayOpacity10,
          t,
        )!,
        grayOpacity5: Color.lerp(
          semantic.grayOpacity5,
          other.semantic.grayOpacity5,
          t,
        )!,
        darkOrange: Color.lerp(
          semantic.darkOrange,
          other.semantic.darkOrange,
          t,
        )!,
        borderGray: Color.lerp(
          semantic.borderGray,
          other.semantic.borderGray,
          t,
        )!,
        whiteOrange: Color.lerp(
          semantic.whiteOrange,
          other.semantic.whiteOrange,
          t,
        )!,
        gray: Color.lerp(semantic.gray, other.semantic.gray, t)!,
        black: Color.lerp(semantic.black, other.semantic.black, t)!,
        green: Color.lerp(semantic.green, other.semantic.green, t)!,
        red: Color.lerp(semantic.red, other.semantic.red, t)!,
      ),
    );
  }
}
