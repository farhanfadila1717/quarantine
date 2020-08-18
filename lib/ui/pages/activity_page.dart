part of 'pages.dart';

class ActivityPage extends StatefulWidget {
  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  Geolocator geolocator = Geolocator();
  double _latitude;
  double _longitude;
  double _distanceMeters;
  double _latitudeUser;
  double _longitudeUser;
  double _currentPositionLong;
  double _currentPositionLat;
  @override
  void initState() {
    super.initState();
    geoLocation();
  }

  geoLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    geolocator
        .getPositionStream(
            LocationOptions(accuracy: LocationAccuracy.best, timeInterval: 100))
        .listen((position) {
      setState(() {
        _currentPositionLat = position.latitude;
        _currentPositionLong = position.longitude;
        print(_currentPositionLat.toInt().toString());
      });
    });
    try {
      setState(() {
        _latitude = position.latitude;
        _longitude = position.longitude;
      });
    } on PlatformException catch (e) {
      print(e.toString());
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    double heightSize = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: BlocBuilder<UserBloc, UserState>(
          builder: (_, userState) {
            if (userState is Userloaded) {
              _longitudeUser = double.parse(
                  userState.user.isolasiLocation.split(',')[0].trim());
              _latitudeUser = double.parse(
                  userState.user.isolasiLocation.split(',')[1].trim());
              return BlocBuilder<ReportBloc, ReportState>(
                builder: (_, reportState) {
                  if (reportState.reports.length != 0) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(reportState.reports.length.toString()),
                        Text(reportState.reports[0].batuk.toString()),
                        Text(_distanceMeters.toString()),
                        FloatingActionButton(onPressed: () async {
                          _distanceMeters = await Geolocator().distanceBetween(
                              _currentPositionLong,
                              _currentPositionLat,
                              _longitude,
                              _latitude);
                          print(_distanceMeters);
                          print(_longitude);
                          print(_latitude);
                          print(_longitudeUser);
                          print(_latitudeUser);
                          setState(() {});
                        }),
                      ],
                    );
                  } else {
                    return SpinKitCircle(
                      size: 50,
                      color: mainColor,
                    );
                  }
                },
              );
            } else {
              return SpinKitChasingDots(
                size: 40,
                color: mainColor,
              );
            }
          },
        ),
      ),
    );
  }
}
