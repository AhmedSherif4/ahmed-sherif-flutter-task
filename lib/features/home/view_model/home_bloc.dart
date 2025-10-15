import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:otex_app_test/config/database/database_helper.dart';
import 'package:otex_app_test/core/models/category_model.dart';
import 'package:otex_app_test/core/models/product_model.dart';

part 'home_event.dart';
part 'home_state.dart';

@Injectable()
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final db = DatabaseHelper.instance;

  HomeBloc() : super(const HomeState()) {
    on<ChangeBaseCategoryEvent>(_changeBaseCategory);
    on<ChangeCategoryEvent>(_changeCategory);
    on<GetCategoriesEvent>(_getCategories);
    on<GetProductsEvent>(_getProducts);
  }

  void _changeBaseCategory(
    ChangeBaseCategoryEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWithState(baseCategoryIndex: event.baseCategoryIndex));
  }

  void _changeCategory(
    ChangeCategoryEvent event,
    Emitter<HomeState> emit,
  ) async {
    final products = await db.getProductsByCategory(event.categoryId);
    emit(
      state.copyWithState(
        categoryIndex: event.categoryIndex,
        products: products,
      ),
    );
  }

  void _getCategories(GetCategoriesEvent event, Emitter<HomeState> emit) async {
    final categories = await db.getAllCategories();
    emit(state.copyWithState(categories: categories));
  }

  void _getProducts(GetProductsEvent event, Emitter<HomeState> emit) async {
    final products = await db.getAllProducts();
    emit(state.copyWithState(products: products));
  }
}
