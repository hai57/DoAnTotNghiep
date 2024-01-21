part of "user_bloc.dart";

class UserEvent {

}

class UserEventSuccess extends UserEvent {
  final User user;
  UserEventSuccess(this.user);
}

class UserEventFail extends UserEvent {
}
