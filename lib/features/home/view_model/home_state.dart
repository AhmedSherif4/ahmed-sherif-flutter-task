part of 'home_bloc.dart';

class HomeState extends Equatable {
  final int baseCategoryIndex;
  final int categoryIndex;
  final List<CategoryModel> categories;
  final List<ProductModel> products;

  const HomeState({
    this.baseCategoryIndex = 0,
    this.categoryIndex = 0,
    this.categories = const [],
    this.products = const [],
  });

  HomeState copyWithState({
    int? baseCategoryIndex,
    int? categoryIndex,
    List<CategoryModel>? categories,
    List<ProductModel>? products,
  }) {
    return HomeState(
      baseCategoryIndex: baseCategoryIndex ?? this.baseCategoryIndex,
      categoryIndex: categoryIndex ?? this.categoryIndex,
      categories: categories ?? this.categories,
      products: products ?? this.products,
    );
  }

  @override
  List<Object?> get props => [
    baseCategoryIndex,
    categoryIndex,
    categories,
    products,
  ];
}
