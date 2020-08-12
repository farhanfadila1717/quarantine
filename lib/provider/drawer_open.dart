// NOTE: State of Drawer Open

import 'package:flutter/material.dart';

class DrawerOpen with ChangeNotifier {
  bool _isDrawer = false;

  bool get isDrawer => _isDrawer;

  set isDrawer(bool newValue) {
    _isDrawer = newValue;
    notifyListeners();
  }
}
