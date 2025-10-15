part of 'filter_bloc.dart';

class FilterState extends Equatable {
  final int typeIndex;
  final int roomCountIndex;
  final int paymentMethodIndex;
  final int propertyConditionIndex;

  const FilterState({
    this.typeIndex = 0,
    this.roomCountIndex = 0,
    this.paymentMethodIndex = 0,
    this.propertyConditionIndex = 0,
  });

  FilterState copyWithState({
    int? typeIndex,
    int? roomCountIndex,
    int? paymentMethodIndex,
    int? propertyConditionIndex,
  }) {
    return FilterState(
      typeIndex: typeIndex ?? this.typeIndex,
      roomCountIndex: roomCountIndex ?? this.roomCountIndex,
      paymentMethodIndex: paymentMethodIndex ?? this.paymentMethodIndex,
      propertyConditionIndex:
          propertyConditionIndex ?? this.propertyConditionIndex,
    );
  }

  @override
  List<Object?> get props => [
    typeIndex,
    roomCountIndex,
    paymentMethodIndex,
    propertyConditionIndex,
  ];
}
