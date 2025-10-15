import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otex_app_test/config/bloc/bloc_observer.dart';
import 'package:otex_app_test/config/database/database_helper.dart';
import 'package:otex_app_test/config/database/database_seed.dart';
import 'package:otex_app_test/core/services/services_locator.dart';
import 'package:otex_app_test/my_app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  await DatabaseHelper.instance.database;
  await DatabaseSeeder.seedDatabase();

  runApp(const MyApp());

  Bloc.observer = MyBlocObserver();
}
