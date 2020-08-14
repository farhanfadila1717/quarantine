part of 'services.dart';

class UserServices {
  static CollectionReference _userCollection =
      Firestore.instance.collection('users');

  static Future<void> updateUser(User user) async {
    _userCollection.document(user.id).setData({
      'email': user.email,
      'name': user.name,
      'cityLive': user.cityLive,
      'isolasiLocation': user.isolasiLocation,
      'profilePicture': user.profilePicture ?? "",
      'time': user.time ?? 0,
    });
  }

  static Future<User> getUser(String id) async {
    DocumentSnapshot snapshot = await _userCollection.document(id).get();

    return User(
      id,
      snapshot.data['email'],
      cityLive: snapshot.data['cityLive'],
      isolasiLocation: snapshot.data['isolasiLocation'],
      profilePicture: snapshot.data['profilePicture'],
      name: snapshot.data['name'],
      time: snapshot.data['time'],
    );
  }
}
