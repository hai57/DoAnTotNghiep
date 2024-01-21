part of "user_bloc.dart";

class UserState extends Equatable{
  final User user;
  const UserState({required this.user});

  @override
    List<Object> get props => [
      user.username,
      user.weight,
      user.height,
      user.gender,
      user.birthday,
      user.id,
      user.gmail
    ];
 }


