import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthy_app/model/activity/index.dart';
part "activity_event.dart";
part "activity_state.dart";


class ActivityBloc extends Bloc<ActivityEvent, ActivityState>  {
  static ActivityBloc? _instance;
  static ActivityBloc get instance {
    _instance ??= ActivityBloc();
    return _instance!;
  }

  ActivityBloc() : super(ActivityState(list: const [])) {
    on<ActivityEventUpdateSchedule>(activityEventUpdateSchedule);
  }

  void activityEventUpdateSchedule(ActivityEventUpdateSchedule event, Emitter<ActivityState> emit) {
    emit(ActivityState(list: event.list));
  }
}
