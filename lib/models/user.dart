part of 'models.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String name;
  final String cityLive;
  final String isolasiLocation;
  final int time;
  final String profilePicture;
  User(this.id, this.email,
      {this.cityLive,
      this.isolasiLocation,
      this.name,
      this.profilePicture,
      this.time});

  @override
  String toString() {
    return "[$id] - $name, $email";
  }

  @override
  List<Object> get props =>
      [id, email, name, cityLive, isolasiLocation, time, profilePicture];
}
