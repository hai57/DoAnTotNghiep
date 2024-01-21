// ignore_for_file: must_be_immutable

part of "activity_bloc.dart";

class ActivityEvent extends Equatable {
  const ActivityEvent();

  @override
  List<Object> get props => [];
}

class ActivityEventUpdateSchedule extends ActivityEvent {
  List<Activity> list;

  ActivityEventUpdateSchedule({
    required this.list
  });

  @override
  List<Object> get props => [
    list
  ];
}
