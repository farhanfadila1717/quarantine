part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class Userloaded extends UserState {
  final User user;

  Userloaded(this.user);
  @override
  List<Object> get props => [user];
}
