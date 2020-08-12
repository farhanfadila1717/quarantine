import 'package:flutter/cupertino.dart';

class TextFieldTheme with ChangeNotifier {
  bool _emailTextTheme = false;
  bool _passTextTheme = false;

  bool get emailTextTheme => _emailTextTheme;
  bool get passTextTheme => _passTextTheme;

  set emailTextTheme(bool newValue) {
    _emailTextTheme = newValue;
    notifyListeners();
  }

  set passTextTheme(bool newValue) {
    _passTextTheme = newValue;
    notifyListeners();
  }
}
