part of "darkmode_bloc.dart";

class DarkModeEvent extends Equatable {
  const DarkModeEvent();


  @override
  List<Object> get props => [];
}


class DarkModeEventUpdate extends DarkModeEvent {
  const DarkModeEventUpdate(this.mode);

  final String mode;

  @override
  List<Object> get props => [mode];
}
