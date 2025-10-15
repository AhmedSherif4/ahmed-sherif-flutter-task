import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otex_app_test/features/filter/view/filter_screen.dart';
import 'package:otex_app_test/features/filter/view_model/filter_bloc.dart';
import 'package:otex_app_test/features/homelayout/home_layout.dart';

import 'routes_names.dart';
import 'un_defined_route.dart';

class AppRouteGenerator {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesNames.rHomeLayout:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) {
            return const HomeLayoutScreen();
          },
        );

      case AppRoutesNames.rFilterScreen:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) {
            return BlocProvider(
              create: (context) => FilterBloc(),
              child: const FilterScreen(),
            );
          },
        );

      default:
        return unDefinedRoute();
    }
  }
}
