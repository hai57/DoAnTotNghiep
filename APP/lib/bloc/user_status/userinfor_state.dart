part of "userinfor_bloc.dart";

class UserInforState extends Equatable {
  final String userName;
  final String weight;
  final String height;
  final String birthday;
  final String gender;

  const UserInforState({
    this.userName = "",
    this.weight = "",
    this.height = "",
    this.birthday = "",
    this.gender = "Male",
  });

  UserInforState copyWith({
    String Function()? userName,
    String Function()? weight,
    String Function()? height,
    String Function()? birthday,
    String Function()? gender,
  }) {
    return UserInforState(
      userName: userName != null ? userName() : this.userName,
      weight: weight != null ? weight() : this.weight,
      height: height != null ? height() : this.height,
      birthday: birthday != null ? birthday() : this.birthday,
      gender: gender != null ? gender() : this.gender,
    );
  }

  @override
  List<Object> get props => [
    userName,
    weight,
    height,
    gender,
    birthday
  ];
}
