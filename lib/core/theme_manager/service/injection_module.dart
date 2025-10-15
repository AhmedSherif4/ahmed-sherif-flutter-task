import 'package:injectable/injectable.dart';

import '../factory/app_theme_factory.dart';

@module
abstract class ThemeInjectionModule {
  @lazySingleton
  IAppThemeFactory get themeFactory => AppThemeFactory();
}
