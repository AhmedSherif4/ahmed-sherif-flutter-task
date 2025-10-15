import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:otex_app_test/config/routes/routes_generator.dart';
import 'package:otex_app_test/config/routes/routes_names.dart';
import 'package:otex_app_test/core/services/services_locator.dart';
import 'package:otex_app_test/features/homelayout/home_layout.dart';
import 'package:otex_app_test/features/plans/view_model/plan_bloc.dart';

import '../core/responsive_manager/responsive_context.dart';
import '../core/responsive_manager/responsive_manager.dart';
import '../core/theme_manager/factory/app_theme_factory.dart';
import '../features/home/view_model/home_bloc.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  late IAppThemeFactory _themeFactory;

  @override
  void initState() {
    super.initState();
  }

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    ResponsiveManager.init(context);
    _themeFactory = getIt<IAppThemeFactory>();

    SpacingContext.init(ResponsiveManager.deviceType);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              HomeLayoutBloc()..add(ChangeBottomNavBarIndexEvent(0)),
        ),
        BlocProvider(
          create: (context) => HomeBloc()
            ..add(GetCategoriesEvent())
            ..add(GetProductsEvent()),
        ),
        BlocProvider(create: (context) => PlanBloc()..add(GetPlansEvent())),
      ],
      child: MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [Locale('ar', 'SA')],
        locale: Locale('ar', 'SA'),
        theme: _themeFactory.buildTheme(context: context, isDark: false),
        themeMode: ThemeMode.light,
        navigatorObservers: [routeObserver],
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'OTEX',
        onGenerateRoute: AppRouteGenerator.onGenerateRoute,
        initialRoute: AppRoutesNames.rHomeLayout,
      ),
    );
  }
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
