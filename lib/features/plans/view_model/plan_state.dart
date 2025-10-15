part of 'plan_bloc.dart';

class PlanState extends Equatable {
  final int planIndex;
  final List<PlanModel> plans;

  const PlanState({this.plans = const [], this.planIndex = 0});

  PlanState copyWithState({int? planIndex, List<PlanModel>? plans}) {
    return PlanState(
      plans: plans ?? this.plans,
      planIndex: planIndex ?? this.planIndex,
    );
  }

  @override
  List<Object?> get props => [plans, planIndex];
}
