import 'package:flutter/material.dart';

class ContentManage with ChangeNotifier {
  bool _isContent = false;

  bool get isContent => _isContent;

  set isContent(bool newValue) {
    _isContent = newValue;
    notifyListeners();
  }
}
