import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthy_app/apis/core_api.dart';
import 'package:healthy_app/store/index.dart';

part "authorize_event.dart";
part "authorize_state.dart";

class AuthorizeBloc extends Bloc<AuthorizeEvent, AuthorizeState> {
  static AuthorizeBloc? _instance;
  static AuthorizeBloc get instance {
    _instance ??= AuthorizeBloc();
    return _instance!;
  }

  AuthorizeBloc() : super(AuthorizeState()) {
    on<AuthorizeEventSuccess>(authorizeEventSuccess);
  }

  void authorizeEventSuccess(AuthorizeEventSuccess event, Emitter<AuthorizeState> emit) async {
    CoreApi.instance.setToken(event.token);
    await Store.instance.setString(StoreKeys.token, event.token);
  }

}

