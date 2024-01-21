part of "authorize_bloc.dart";

class AuthorizeEvent extends Equatable{
  const AuthorizeEvent();

  @override
  List<Object> get props => [];
}

class AuthorizeEventSuccess extends AuthorizeEvent {
  final String token;
  const AuthorizeEventSuccess(this.token);

  @override
  List<Object> get props => [token];
}

class AuthorizeEventFail extends AuthorizeEvent {}
