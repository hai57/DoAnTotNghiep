part of "userinfor_bloc.dart";

class UserInforEvent extends Equatable {
  const UserInforEvent();

  @override
  List<Object> get props => [];
}

class UserEventUpdateName extends UserInforEvent {
  const UserEventUpdateName(this.userName);

  final String userName;

  @override
  List<Object> get props => [userName];
}

class UserEventUpdateGender extends UserInforEvent {
  const UserEventUpdateGender(this.gender);

  final String gender;

  @override
  List<Object> get props => [gender];
}

class UserEventUpdateWeight extends UserInforEvent {
  const UserEventUpdateWeight(this.weight);

  final String weight;

  @override
  List<Object> get props => [weight];
}

class UserEventUpdateHeight extends UserInforEvent {
  const UserEventUpdateHeight(this.height);

  final String height;

  @override
  List<Object> get props => [height];
}

class UserEventUpdateBirthday extends UserInforEvent {
  const UserEventUpdateBirthday(this.birthday);

  final String birthday;

  @override
  List<Object> get props => [birthday];
}

