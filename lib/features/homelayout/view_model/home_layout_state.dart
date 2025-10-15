part of '../home_layout.dart';

class HomeLayoutState extends Equatable {
  final List<Widget> appFlow;
  final int index;

  const HomeLayoutState({this.appFlow = const [Center()], this.index = 0});

  HomeLayoutState copyWithState({List<Widget>? appFlow, int? index}) {
    return HomeLayoutState(
      appFlow: appFlow ?? this.appFlow,
      index: index ?? this.index,
    );
  }

  @override
  List<Object?> get props => [index, appFlow];
}
