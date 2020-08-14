import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quarantine/bloc/blocs.dart';

part 'shared_value.dart';

part 'theme.dart';

Future<File> getImage() async {
  File imgFile;
  var image = await ImagePicker().getImage(source: ImageSource.gallery);

  return imgFile = File(image.path);
}
