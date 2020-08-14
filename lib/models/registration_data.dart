part of 'models.dart';

class RegistrationData {
  String name;
  String email;
  String password;
  String cityLive;
  String isolasiLocation;
  int time;
  File profilePicture;

  RegistrationData({
    this.name = "",
    this.email = "",
    this.password = "",
    this.cityLive = "",
    this.isolasiLocation = "",
    this.time = 0,
    this.profilePicture,
  });
}
