part of 'filter_bloc.dart';

abstract class FilterEvent extends Equatable {}

class ChangeTypeEvent extends FilterEvent {
  final int typeIndex;

  ChangeTypeEvent(this.typeIndex);

  @override
  List<Object?> get props => [typeIndex];
}

class ChangeRoomCountEvent extends FilterEvent {
  final int roomCountIndex;

  ChangeRoomCountEvent(this.roomCountIndex);

  @override
  List<Object?> get props => [roomCountIndex];
}

class ChangePaymentMethodEvent extends FilterEvent {
  final int paymentMethodIndex;

  ChangePaymentMethodEvent(this.paymentMethodIndex);

  @override
  List<Object?> get props => [paymentMethodIndex];
}

class ChangePropertyConditionEvent extends FilterEvent {
  final int propertyConditionIndex;

  ChangePropertyConditionEvent(this.propertyConditionIndex);

  @override
  List<Object?> get props => [propertyConditionIndex];
}
