part of 'pages.dart';

// NOTE: State of Drawer Open
class DrawerOpen with ChangeNotifier {
  bool _isDrawer = false;

  bool get isDrawer => _isDrawer;

  set isDrawer(bool newValue) {
    _isDrawer = newValue;
    notifyListeners();
  }

  Brightness get brightnessStatusBar =>
      (_isDrawer) ? Brightness.dark : Brightness.light;
}
