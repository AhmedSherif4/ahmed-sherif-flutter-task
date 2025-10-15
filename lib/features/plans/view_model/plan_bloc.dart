import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:otex_app_test/config/database/database_helper.dart';
import 'package:otex_app_test/core/models/plan_model.dart';

part 'plan_event.dart';
part 'plan_state.dart';

@Injectable()
class PlanBloc extends Bloc<PlanEvent, PlanState> {
  final db = DatabaseHelper.instance;

  PlanBloc() : super(const PlanState()) {
    on<ChangePlanEvent>(_changePlan);
    on<GetPlansEvent>(_getPlans);
  }

  void _changePlan(ChangePlanEvent event, Emitter<PlanState> emit) async {
    emit(state.copyWithState(planIndex: event.planIndex));
  }

  void _getPlans(GetPlansEvent event, Emitter<PlanState> emit) async {
    final plans = await db.getAllPlans();
    emit(state.copyWithState(plans: plans));
  }
}
