part of 'shared.dart';

Future<File> getImage() async {
  File imgFile;
  var image = await ImagePicker().getImage(source: ImageSource.gallery);

  return imgFile = File(image.path);
}

Future<String> uploadImage(File image) async {
  String fileName = basename(image.path);

  StorageReference ref = FirebaseStorage.instance.ref().child(fileName);
  StorageUploadTask task = ref.putFile(image);
  StorageTaskSnapshot snapshot = await task.onComplete;

  return await snapshot.ref.getDownloadURL();
}
