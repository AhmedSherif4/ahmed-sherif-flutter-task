import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otex_app_test/core/responsive_manager/responsive_extensions.dart';
import 'package:otex_app_test/core/responsive_manager/spacing_facade.dart';
import 'package:otex_app_test/features/home/view/widgets/header_widget.dart';
import 'package:otex_app_test/features/home/view/widgets/on_selection_chip.dart';
import 'package:otex_app_test/features/home/view/widgets/product_widget.dart';
import 'package:otex_app_test/features/home/view/widgets/sub_category_widget.dart';
import 'package:otex_app_test/features/home/view_model/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Spacing.spaceHS32,
                HeaderWidget(),
                Spacing.spaceHS10,
                OneSelectionChipList(),
                Spacing.spaceHS32,
                CategoriesBlocListView(),
                Spacing.spaceHS32,
                ProductsBlocGridView(),
              ],
            ),
          ),
        );
      },
    ).paddingBody();
  }
}
