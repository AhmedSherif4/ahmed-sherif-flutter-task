// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:otex_app_test/config/database/database_seed.dart' as _i159;
import 'package:otex_app_test/core/theme_manager/domain/i_theme_repository.dart'
    as _i493;
import 'package:otex_app_test/core/theme_manager/factory/app_theme_factory.dart'
    as _i229;
import 'package:otex_app_test/core/theme_manager/service/injection_module.dart'
    as _i299;
import 'package:otex_app_test/core/theme_manager/theme_bloc/theme_bloc.dart'
    as _i192;
import 'package:otex_app_test/features/homelayout/home_layout.dart' as _i94;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final themeInjectionModule = _$ThemeInjectionModule();
    gh.factory<_i94.HomeLayoutBloc>(() => _i94.HomeLayoutBloc());
    gh.lazySingleton<_i159.DatabaseSeeder>(() => _i159.DatabaseSeeder());
    gh.lazySingleton<_i229.IAppThemeFactory>(
      () => themeInjectionModule.themeFactory,
    );
    gh.factory<_i192.ThemeBloc>(
      () => _i192.ThemeBloc(
        gh<_i229.IAppThemeFactory>(),
        gh<_i493.IThemeRepository>(),
      ),
    );
    return this;
  }
}

class _$ThemeInjectionModule extends _i299.ThemeInjectionModule {}
