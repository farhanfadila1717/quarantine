import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quarantine/models/models.dart';
import 'package:quarantine/services/services.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is LoadUser) {
      User user = await UserServices.getUser(event.id);

      yield Userloaded(user);
    } else if (event is SignOut) {
      yield UserInitial();
    } else if (event is UpdateData) {
      User updatedUser = (state as Userloaded).user.copyWith(
            name: event.name,
            profilePicture: event.profilePicture,
            time: event.time,
            isolasiLocation: event.isolasiLocation,
          );
      await UserServices.updateUser(updatedUser);
      yield Userloaded(updatedUser);
    }
  }
}
