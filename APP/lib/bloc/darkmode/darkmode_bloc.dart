import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'darkmode_event.dart';
part 'darkmode_state.dart';

class DarkModeBloc extends Bloc<DarkModeEvent, DarkModeState> {
static DarkModeBloc? _instance;
  static DarkModeBloc get instance {
    _instance ??= DarkModeBloc();
    return _instance!;
  }
  
  DarkModeBloc() : super(DarkModeState(mode: "")) {
    on<DarkModeEventUpdate>(darkModeEventUpdate);
  }

  void darkModeEventUpdate(DarkModeEventUpdate event, Emitter<DarkModeState> emit) async {
    emit(DarkModeState(mode: event.mode));
  }
}
