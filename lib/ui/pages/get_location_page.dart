part of 'pages.dart';

class GetLocationPage extends StatefulWidget {
  @override
  _GetLocationPageState createState() => _GetLocationPageState();
}

class _GetLocationPageState extends State<GetLocationPage> {
  // Position _position;

  Geolocator geolocator = Geolocator();
  double _latitude;
  double _longitude;
  bool _isGettingLocation;
  @override
  void initState() {
    super.initState();
    _isGettingLocation = true;
    getLocation();
  }

  getLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);

    try {
      setState(() {
        _latitude = position.latitude;
        _longitude = position.longitude;
        _isGettingLocation = false;
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
    String location = "${_longitude.toString()},  ${_latitude.toString()}";
    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToSplashPage());
        return;
      },
      child: Scaffold(
        body: Center(
          child: _isGettingLocation != true
              ? Text(location)
              : SpinKitChasingDots(
                  size: 50,
                  color: mainColor,
                ),
        ),
      ),
    );
  }
}
