import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:otex_app_test/config/database/database_helper.dart';

part 'filter_event.dart';
part 'filter_state.dart';

@Injectable()
class FilterBloc extends Bloc<FilterEvent, FilterState> {
  final db = DatabaseHelper.instance;

  FilterBloc() : super(const FilterState()) {
    on<ChangeTypeEvent>(_changeType);
    on<ChangeRoomCountEvent>(_changeRoomCount);
    on<ChangePaymentMethodEvent>(_changePaymentMethod);
    on<ChangePropertyConditionEvent>(_changePropertyCondition);
  }

  void _changeType(ChangeTypeEvent event, Emitter<FilterState> emit) {
    emit(state.copyWithState(typeIndex: event.typeIndex));
  }

  void _changeRoomCount(ChangeRoomCountEvent event, Emitter<FilterState> emit) {
    emit(state.copyWithState(roomCountIndex: event.roomCountIndex));
  }

  void _changePaymentMethod(
    ChangePaymentMethodEvent event,
    Emitter<FilterState> emit,
  ) {
    emit(state.copyWithState(paymentMethodIndex: event.paymentMethodIndex));
  }

  void _changePropertyCondition(
    ChangePropertyConditionEvent event,
    Emitter<FilterState> emit,
  ) {
    emit(
      state.copyWithState(propertyConditionIndex: event.propertyConditionIndex),
    );
  }
}
