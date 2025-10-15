part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {}

class ChangeBaseCategoryEvent extends HomeEvent {
  final int baseCategoryIndex;

  ChangeBaseCategoryEvent(this.baseCategoryIndex);

  @override
  List<Object?> get props => [baseCategoryIndex];
}

class ChangeCategoryEvent extends HomeEvent {
  final int categoryId;
  final int categoryIndex;

  ChangeCategoryEvent({required this.categoryId, required this.categoryIndex});

  @override
  List<Object?> get props => [categoryId, categoryIndex];
}

class GetCategoriesEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class GetProductsEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}
