part of '../home_layout.dart';

abstract class HomeLayoutEvent extends Equatable {}

class ChangeBottomNavBarIndexEvent extends HomeLayoutEvent {
  final int index;

  ChangeBottomNavBarIndexEvent(this.index);

  @override
  List<Object?> get props => [index];
}
