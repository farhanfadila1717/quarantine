import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:quarantine/bloc/blocs.dart';
import 'package:quarantine/provider/contect_manage.dart';
import 'package:quarantine/services/services.dart';
import 'package:quarantine/shared/shared.dart';
import 'package:quarantine/ui/pages/pages.dart';
import 'package:quarantine/provider/providers.dart';

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
    return StreamProvider.value(
      value: AuthServices.userStream,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => PageBloc()),
          BlocProvider(create: (_) => UserBloc()),
          BlocProvider(create: (_) => ReportBloc()),
          BlocProvider(create: (_) => ChartBloc()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            primaryColor: mainColor,
          ),
          home: MultiProvider(providers: [
            ChangeNotifierProvider(create: (context) => DrawerOpen()),
            ChangeNotifierProvider(create: (context) => ContentManage()),
          ], child: Wrapper()),
        ),
      ),
    );
  }
}
