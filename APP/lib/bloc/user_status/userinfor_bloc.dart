import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part "userinfor_event.dart";
part "userinfor_state.dart";

class UserInforBloc extends Bloc<UserInforEvent, UserInforState>{
  static UserInforBloc? _instance;
  static UserInforBloc get instance {
    _instance ??= UserInforBloc();
    return _instance!;
  }

  UserInforBloc() : super(const UserInforState()) {
    on<UserEventUpdateName>(userEventUpdateName);
    on<UserEventUpdateGender>(userEventUpdateGender);
    on<UserEventUpdateWeight>(userEventUpdateWeight);
    on<UserEventUpdateHeight>(userEventUpdateHeight);
    on<UserEventUpdateBirthday>(userEventUpdateBirthday);
  }

 
  void userEventUpdateName(UserEventUpdateName event, Emitter<UserInforState> emit) async {
    emit(state.copyWith(userName: () => event.userName));
  } 

  void userEventUpdateGender(UserEventUpdateGender event, Emitter<UserInforState> emit) async {
    emit(state.copyWith(gender: () => event.gender));
  } 

  void userEventUpdateWeight(UserEventUpdateWeight event, Emitter<UserInforState> emit) async {
    emit(state.copyWith(weight: () => event.weight));
  } 

  void userEventUpdateHeight(UserEventUpdateHeight event, Emitter<UserInforState> emit) async {
    emit(state.copyWith(height: () => event.height));
  } 

  void userEventUpdateBirthday(UserEventUpdateBirthday event, Emitter<UserInforState> emit) async {
    emit(state.copyWith(birthday: () => event.birthday));
  } 
}
