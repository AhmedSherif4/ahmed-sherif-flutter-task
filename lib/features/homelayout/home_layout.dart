import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:injectable/injectable.dart';
import 'package:otex_app_test/core/responsive_manager/spacing_facade.dart';
import 'package:otex_app_test/core/text_styling/extensions/app_text_theme.dart';
import 'package:otex_app_test/core/theme_manager/service/app_colors.dart';
import 'package:otex_app_test/features/plans/view/plans_screen.dart';
import 'package:otex_app_test/my_app/app_reference.dart';

import '../../app_assets/app_assets.dart';
import '../home/view/home_screen.dart';

part 'view/bottom_nav_bar_widget.dart';
part 'view/home_layout_screen.dart';
part 'view_model/home_layout_bloc.dart';
part 'view_model/home_layout_event.dart';
part 'view_model/home_layout_state.dart';
