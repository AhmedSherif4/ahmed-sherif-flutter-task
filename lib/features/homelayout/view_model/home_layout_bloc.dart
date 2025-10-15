part of '../home_layout.dart';

@Injectable()
class HomeLayoutBloc extends Bloc<HomeLayoutEvent, HomeLayoutState> {
  HomeLayoutBloc() : super(const HomeLayoutState()) {
    on<ChangeBottomNavBarIndexEvent>(_changeBottomNavBar);
  }

  List<Widget> appFlow = [
    HomeScreen(),
    Center(child: Text('Chat')),
    Center(child: Text('Add Ad')),
    Center(child: Text('My Ads')),
    PlansScreen(),
  ];

  void _changeBottomNavBar(
    ChangeBottomNavBarIndexEvent event,
    Emitter<HomeLayoutState> emit,
  ) async {
    emit(state.copyWithState(index: event.index, appFlow: appFlow));
  }
}
