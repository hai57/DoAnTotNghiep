// ignore_for_file: must_be_immutable

part of "authorize_bloc.dart";

class AuthorizeState extends Equatable{
  AuthorizeState({this.token = ""});
  String token;
  @override
  List<Object> get props => [token];
}
