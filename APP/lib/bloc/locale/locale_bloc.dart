import 'dart:async';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthy_app/store/index.dart';

part 'locale_event.dart';
part 'locale_state.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  static LocaleBloc? _instance;
  static LocaleBloc get instance {
    _instance ??= LocaleBloc();
    return _instance!;
  }
  LocaleBloc() : super(LocalInitialState()) {
    on<LocaleChangedEvent>(localeChangedEventHandler);
  }

  FutureOr<void> localeChangedEventHandler(LocaleChangedEvent event, Emitter<LocaleState> emit) async {
    Store.instance.setString(StoreKeys.localeKey, event.languageCode);
    emit(LocalChangedState(locale: Locale(event.languageCode)));
  }
}
