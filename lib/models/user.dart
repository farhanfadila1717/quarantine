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

  User copyWith(
          {String name,
          String profilePicture,
          String isolasiLocation,
          int time}) =>
      User(
        this.id,
        this.email,
        cityLive: this.cityLive,
        isolasiLocation: isolasiLocation ?? this.isolasiLocation,
        name: name ?? this.name,
        profilePicture: profilePicture ?? this.profilePicture,
        time: time ?? this.time,
      );

  @override
  String toString() {
    return "[$id] - $name, $email";
  }

  @override
  List<Object> get props =>
      [id, email, name, cityLive, isolasiLocation, time, profilePicture];
}
