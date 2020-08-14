part of 'pages.dart';

class GetProfilePicturePage extends StatefulWidget {
  final RegistrationData registrationData;

  GetProfilePicturePage(this.registrationData);

  @override
  _GetProfilePicturePageState createState() => _GetProfilePicturePageState();
}

class _GetProfilePicturePageState extends State<GetProfilePicturePage> {
  bool isDialog;
  bool findLocation;
  Geolocator geolocator = Geolocator();
  double _latitude;
  double _longitude;
  bool _isGettingLocation;
  @override
  void initState() {
    super.initState();
    isDialog = false;
    findLocation = false;

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
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    double heightSize = MediaQuery.of(context).size.height;
    DateTime timeNow = DateTime.now();
    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToSignUpPage(widget.registrationData));
        return;
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: isDialog ? Colors.transparent : Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: Scaffold(
          body: Stack(
            children: [
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Isi Foto Profile",
                      style: blueTextFont.copyWith(
                        fontSize: heightSize * 0.032,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: heightSize * 0.05,
                    ),
                    Container(
                      height: widthSize * 0.395,
                      width: widthSize * 0.35,
                      child: Stack(
                        children: [
                          Container(
                            height: widthSize * 0.35,
                            width: widthSize * 0.35,
                            decoration: BoxDecoration(
                              color: mainColor,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: widget.registrationData.profilePicture ==
                                        null
                                    ? AssetImage("assets/img/default_image.png")
                                    : FileImage(
                                        widget.registrationData.profilePicture),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: GestureDetector(
                              onTap: () async {
                                if (widget.registrationData.profilePicture ==
                                    null) {
                                  widget.registrationData.profilePicture =
                                      await getImage();
                                } else {
                                  widget.registrationData.profilePicture = null;
                                }
                                setState(() {});
                              },
                              child: Container(
                                height: widthSize * 0.1,
                                width: widthSize * 0.1,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      widget.registrationData.profilePicture ==
                                              null
                                          ? greenColor
                                          : redColor,
                                  border: Border.all(
                                    width: widthSize * 0.01,
                                    color: Colors.white,
                                  ),
                                ),
                                child: Center(
                                  child: Icon(
                                    widget.registrationData.profilePicture ==
                                            null
                                        ? Icons.add
                                        : Icons.clear,
                                    size: widthSize * 0.07,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: heightSize * 0.05,
                    ),
                    Container(
                      height: heightSize * 0.075,
                      width: widthSize * 0.5,
                      child: FlatButton(
                        onPressed: () {
                          if (widget.registrationData.isolasiLocation.trim() !=
                                  null &&
                              widget.registrationData.time > 0) {
                            context.bloc<PageBloc>().add(GoToConfrimAccountPage(
                                widget.registrationData));
                          } else {
                            setState(() {
                              isDialog = true;
                            });
                          }
                        },
                        color: widget.registrationData.profilePicture == null
                            ? greenColor
                            : mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          widget.registrationData.profilePicture == null
                              ? "Lewati"
                              : widget.registrationData.time != null
                                  ? "Selanjutnya"
                                  : "Lengkapi",
                          style: whiteTextFont.copyWith(
                            fontSize: heightSize * 0.02,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              isDialog
                  ? Container(
                      height: heightSize,
                      width: widthSize,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomRight,
                            child: FloatingActionButton(
                              mini: true,
                              onPressed: () {
                                setState(() {
                                  isDialog = false;
                                });
                              },
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: heightSize * 0.27,
                              width: widthSize * 0.7,
                              padding: EdgeInsets.all(widthSize * 0.03),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Center(
                                      child: !_isGettingLocation
                                          ? Text(
                                              findLocation
                                                  ? "Ini merupakan tempat isolasi anda?"
                                                  : "Isolasi mandiri sekarang ?",
                                              style: blackTextFont.copyWith(
                                                fontSize: heightSize * 0.023,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              textAlign: TextAlign.center,
                                            )
                                          : SpinKitChasingDots(
                                              size: 50,
                                              color: mainColor,
                                            ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: widthSize * 0.03,
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: !findLocation
                                        ? Row(
                                            children: [
                                              Expanded(
                                                child: InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      widget.registrationData
                                                              .time =
                                                          timeNow
                                                              .millisecondsSinceEpoch;
                                                      findLocation = true;
                                                    });
                                                  },
                                                  child: Container(
                                                    height: double.infinity,
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: mainColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        "Ya",
                                                        style: whiteTextFont
                                                            .copyWith(
                                                          fontSize:
                                                              heightSize * 0.02,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: widthSize * 0.03,
                                              ),
                                              Expanded(
                                                child: InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      isDialog = false;
                                                    });
                                                  },
                                                  child: Container(
                                                    height: double.infinity,
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: greyColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        "Tidak",
                                                        style: whiteTextFont
                                                            .copyWith(
                                                          fontSize:
                                                              heightSize * 0.02,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        : InkWell(
                                            onTap: () {
                                              setState(() {
                                                isDialog = false;
                                                widget.registrationData
                                                        .isolasiLocation =
                                                    "${_longitude.toString()}, ${_latitude.toString()}";
                                              });
                                            },
                                            child: Container(
                                              height: double.infinity,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: mainColor,
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Ya",
                                                  style: whiteTextFont.copyWith(
                                                    fontSize: heightSize * 0.02,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
