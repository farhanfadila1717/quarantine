part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class LoadUser extends UserEvent {
  final String id;

  LoadUser(this.id);
  @override
  List<Object> get props => [id];
}

class SignOut extends UserEvent {
  @override
  List<Object> get props => [];
}

class UpdateData extends UserEvent {
  final String name;
  final String profilePicture;
  final int time;
  final String isolasiLocation;

  UpdateData({this.name, this.profilePicture, this.time, this.isolasiLocation});
  @override
  List<Object> get props => [name, profilePicture, time, isolasiLocation];
}
