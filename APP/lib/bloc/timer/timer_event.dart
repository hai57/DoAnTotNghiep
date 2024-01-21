// ignore_for_file: must_be_immutable

part of "timer_bloc.dart";

class TimerEvent extends Equatable {
  const TimerEvent();

  @override
  List<Object> get props => [];
}

class TimerEventUpdateSchedule extends TimerEvent {
  List<Time> list;

  TimerEventUpdateSchedule({
    required this.list
  });

  @override
  List<Object> get props => [
    list
  ];
}
