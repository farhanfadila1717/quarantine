part of 'extensions.dart';

extension FirebaseUserExtension on FirebaseUser {
  User convertToUser(
          {String name = "Anonim",
          String cityLive = "Depok",
          String isolasiLocation = "106.783068, -6.358448",
          int time = 0}) =>
      User(this.uid, this.email,
          cityLive: cityLive,
          isolasiLocation: isolasiLocation,
          name: name,
          time: time);

  Future<User> fromFireStore() async => await UserServices.getUser(this.uid);
}
