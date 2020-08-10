import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quarantine/ui/pages/pages.dart';

void main() {
  WidgetsFlutterBinding();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenPage(),
    );
  }
}
