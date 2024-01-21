// ignore_for_file: must_be_immutable

part of "darkmode_bloc.dart";

class DarkModeState extends Equatable {
  DarkModeState({ required this.mode});

  late String mode;

  @override
  List<Object> get props => [
    mode
  ];
}
