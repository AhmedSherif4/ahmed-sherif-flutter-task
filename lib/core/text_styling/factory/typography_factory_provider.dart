import 'package:otex_app_test/core/text_styling/factory/tablet_typography_factory.dart';
import 'package:otex_app_test/core/theme_manager/models/semantic_colors.dart';

import '../../responsive_manager/responsive_manager.dart';
import 'i_typography_factory.dart';
import 'mobile_typography_factory.dart';

class TypographyFactoryProvider {
  static ITypographyFactory getFactory(SemanticColors colors) {
    switch (ResponsiveManager.deviceType) {
      case DeviceType.tablet:
        return TabletTypographyFactory(colors: colors);
      default:
        return MobileTypographyFactory(colors: colors);
    }
  }
}
