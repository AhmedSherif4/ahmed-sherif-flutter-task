part of 'plan_bloc.dart';

abstract class PlanEvent extends Equatable {}

class ChangePlanEvent extends PlanEvent {
  final int planIndex;

  ChangePlanEvent(this.planIndex);

  @override
  List<Object?> get props => [planIndex];
}

class GetPlansEvent extends PlanEvent {
  @override
  List<Object?> get props => [];
}
