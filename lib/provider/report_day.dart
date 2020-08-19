// NOTE: State Report Days

import 'package:flutter/material.dart';

class ReportDay with ChangeNotifier {
  bool _isReport = false;

  bool get isReport => _isReport;

  set isReport(bool newValue) {
    _isReport = newValue;
    notifyListeners();
  }
}
