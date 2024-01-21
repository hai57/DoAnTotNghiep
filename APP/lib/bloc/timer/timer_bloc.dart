import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthy_app/model/timer/index.dart';

part "timer_event.dart";
part "timer_state.dart";

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  static TimerBloc? _instance;
  static TimerBloc get instance {
    _instance ??= TimerBloc();
    return _instance!;
  }

  TimerBloc() : super(TimerState(list: const [])) {
    on<TimerEventUpdateSchedule>(timerEventUpdateSchedule);
  }

  void timerEventUpdateSchedule(TimerEventUpdateSchedule event, Emitter<TimerState> emit) {
    emit(TimerState(list: event.list));
  }
}
