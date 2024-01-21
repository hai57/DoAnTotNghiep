// ignore_for_file: must_be_immutable

part of "timer_bloc.dart";

class TimerState extends Equatable {
  List<Time> list;

  TimerState({
    required this.list
  });

  @override
  List<Object> get props => [
    list
  ];
}
