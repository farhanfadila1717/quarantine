part of 'pages.dart';

class MainPage extends StatefulWidget {
  final int bottomNavbarIndex;

  MainPage({this.bottomNavbarIndex = 0});
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Geolocator geolocator = Geolocator();
  int bottomNavbarIndex;
  PageController pageController;
  int batuk;
  int sesakNapas;
  double tidur;
  double suhuTubuh;
  double valueGejala;
  double _latitude;
  double _longitude;
  double _distanceMeters;
  double _currentPositionLong;
  double _currentPositionLat;
  DateTime time = DateTime.now();
  bool isSaveReport;

  TextEditingController catatanController = TextEditingController();
  @override
  void initState() {
    super.initState();
    bottomNavbarIndex == 1 ? geoLocation() : stop();
    isSaveReport = false;
    bottomNavbarIndex = widget.bottomNavbarIndex;
    batuk = 0;
    valueGejala = 0;
    sesakNapas = 0;
    tidur = 7;
    suhuTubuh = 36.5;
    catatanController.text = "";
    pageController = PageController(initialPage: bottomNavbarIndex);
  }

  stop() {}
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
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    double heightSize = MediaQuery.of(context).size.height;
    return Consumer<ReportDay>(
      builder: (context, reportDay, _) => Consumer<DrawerOpen>(
        builder: (context, drawerOpen, _) =>
            AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarColor:
                drawerOpen.isDrawer == true || reportDay.isReport == true
                    ? Colors.transparent
                    : Colors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
          child: Scaffold(
            body: Stack(
              children: [
                ScrollConfiguration(
                  behavior: ScrollBehavior(),
                  child: GlowingOverscrollIndicator(
                    color: mainColor,
                    axisDirection: AxisDirection.right,
                    child: PageView(
                      controller: pageController,
                      physics: NeverScrollableScrollPhysics(),
                      onPageChanged: (index) {
                        setState(() {
                          bottomNavbarIndex = index;
                        });
                      },
                      children: [
                        HomePage(),
                        ReportPage(),
                        EmergencyPage(),
                        ActivityPage(),
                      ],
                    ),
                  ),
                ),
                BlocBuilder<UserBloc, UserState>(builder: (_, userState) {
                  if (userState is Userloaded) {
                    DateTime timeNow = DateTime.now();
                    DateTime startTime = DateTime.fromMillisecondsSinceEpoch(
                        userState.user.time);

                    final differenceInDays =
                        timeNow.difference(startTime).inDays;
                    return BlocBuilder<ChartBloc, ChartState>(
                      builder: (_, chartState) =>
                          (differenceInDays >= chartState.bezierCharts.length &&
                                  bottomNavbarIndex == 1)
                              ? Positioned(
                                  right: widthSize * 0.04,
                                  bottom: heightSize * 0.12,
                                  child: FloatingActionButton(
                                    onPressed: () {
                                      reportDay.isReport = true;
                                    },
                                    elevation: 0,
                                    highlightElevation: 0,
                                    backgroundColor: mainColor,
                                    child: Center(
                                      child: Container(
                                        height: heightSize * 0.0375,
                                        width: heightSize * 0.0375,
                                        child: SvgPicture.asset(
                                          'assets/icons/ic_edit_rounded.svg',
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : SizedBox(),
                    );
                  } else {
                    return SizedBox();
                  }
                }),
                createBottomNavigationBar(heightSize, widthSize),
                (drawerOpen.isDrawer == true)
                    ? customDrawer(heightSize, widthSize)
                    : SizedBox(),
                (reportDay.isReport == true)
                    ? reportDayForm(heightSize, widthSize)
                    : SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // NOTE: Custom Navigation Bar
  Widget createBottomNavigationBar(double heightSize, double widthSize) =>
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: heightSize * 0.095,
          width: widthSize,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(
                width: 1,
                color: Color(0xFFDADADA),
              ),
            ),
          ),
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            selectedItemColor: mainColor,
            unselectedItemColor: greyColor,
            showUnselectedLabels: true,
            currentIndex: bottomNavbarIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              setState(() {
                bottomNavbarIndex = index;
                pageController.jumpToPage(index);
              });
            },
            items: [
              BottomNavigationBarItem(
                title: Text(
                  "Home",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: (bottomNavbarIndex == 0) ? mainColor : greyColor,
                  ),
                ),
                icon: Container(
                  height: heightSize * 0.0375,
                  margin: EdgeInsets.only(bottom: 2),
                  child: SvgPicture.asset((bottomNavbarIndex == 0)
                      ? "assets/icons/ic_home_selected.svg"
                      : "assets/icons/ic_home.svg"),
                ),
              ),
              BottomNavigationBarItem(
                title: Text(
                  "Laporan",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: (bottomNavbarIndex == 1) ? mainColor : greyColor,
                  ),
                ),
                icon: Container(
                  height: heightSize * 0.0375,
                  margin: EdgeInsets.only(bottom: 2),
                  child: SvgPicture.asset((bottomNavbarIndex == 1)
                      ? "assets/icons/ic_report_selected.svg"
                      : "assets/icons/ic_report.svg"),
                ),
              ),
              BottomNavigationBarItem(
                title: Text(
                  "Darurat",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: (bottomNavbarIndex == 2) ? mainColor : greyColor,
                  ),
                ),
                icon: Container(
                  height: heightSize * 0.0375,
                  margin: EdgeInsets.only(bottom: 2),
                  child: SvgPicture.asset((bottomNavbarIndex == 2)
                      ? "assets/icons/ic_emergency_selected.svg"
                      : "assets/icons/ic_emergency.svg"),
                ),
              ),
              BottomNavigationBarItem(
                title: Text(
                  "Aktivitas",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: (bottomNavbarIndex == 3) ? mainColor : greyColor,
                  ),
                ),
                icon: Container(
                  height: heightSize * 0.0375,
                  margin: EdgeInsets.only(bottom: 2),
                  child: SvgPicture.asset((bottomNavbarIndex == 3)
                      ? "assets/icons/ic_activity_selected.svg"
                      : "assets/icons/ic_activity.svg"),
                ),
              ),
            ],
          ),
        ),
      );

// NOTE: Custom Drawer
  Widget customDrawer(
    double heightSize,
    double widthSize,
  ) =>
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
        child: Container(
          height: heightSize,
          width: widthSize,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
          ),
          child: Stack(
            children: [
              Positioned(
                left: widthSize * 0.05,
                top: heightSize * 0.04,
                child: Container(
                  height: heightSize * 0.608,
                  width: widthSize * 0.7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(widthSize * 0.035),
                    color: Colors.white,
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(widthSize * 0.04),
                        child: Container(
                          child: BlocBuilder<UserBloc, UserState>(
                            builder: (_, userState) => (userState is Userloaded)
                                ? Column(
                                    children: [
                                      SizedBox(
                                        height: heightSize * 0.02,
                                      ),
                                      Container(
                                        height: heightSize * 0.08,
                                        width: heightSize * 0.08,
                                        decoration: BoxDecoration(
                                          color: greyColor,
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: userState
                                                        .user.profilePicture ==
                                                    null
                                                ? AssetImage(
                                                    "assets/img/default_image.png")
                                                : NetworkImage(userState
                                                    .user.profilePicture),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: heightSize * 0.02,
                                      ),
                                      SizedBox(
                                        width: double.infinity,
                                        child: Text(
                                          userState.user.name,
                                          style: blackTextFont.copyWith(
                                            fontSize: heightSize * 0.024,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.fade,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      SizedBox(
                                        height: heightSize * 0.007,
                                      ),
                                      SizedBox(
                                        width: double.infinity,
                                        child: Text(
                                          "Kota ${userState.user.cityLive.capital()}",
                                          style: greyTextFont.copyWith(
                                            fontSize: heightSize * 0.018,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.fade,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        child: Column(
                                          children: [
                                            Container(
                                              height: heightSize * 0.07,
                                              width: double.infinity,
                                              padding: EdgeInsets.symmetric(
                                                  vertical: heightSize * 0.02),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Akun",
                                                    style:
                                                        blackTextFont.copyWith(
                                                      fontSize:
                                                          heightSize * 0.022,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.arrow_forward_ios,
                                                    size: heightSize * 0.027,
                                                    color: greyColor,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: heightSize * 0.07,
                                              width: double.infinity,
                                              padding: EdgeInsets.symmetric(
                                                  vertical: heightSize * 0.02),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Password",
                                                    style:
                                                        blackTextFont.copyWith(
                                                      fontSize:
                                                          heightSize * 0.022,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.arrow_forward_ios,
                                                    size: heightSize * 0.027,
                                                    color: greyColor,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: heightSize * 0.07,
                                              width: double.infinity,
                                              padding: EdgeInsets.symmetric(
                                                  vertical: heightSize * 0.02),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Settings",
                                                    style:
                                                        blackTextFont.copyWith(
                                                      fontSize:
                                                          heightSize * 0.022,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.arrow_forward_ios,
                                                    size: heightSize * 0.027,
                                                    color: greyColor,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: heightSize * 0.07,
                                              width: double.infinity,
                                              padding: EdgeInsets.symmetric(
                                                  vertical: heightSize * 0.02),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Bantuan",
                                                    style:
                                                        blackTextFont.copyWith(
                                                      fontSize:
                                                          heightSize * 0.022,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.arrow_forward_ios,
                                                    size: heightSize * 0.027,
                                                    color: greyColor,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: heightSize * 0.07,
                                              width: double.infinity,
                                              padding: EdgeInsets.symmetric(
                                                  vertical: heightSize * 0.02),
                                              child: Consumer<DrawerOpen>(
                                                builder:
                                                    (context, drawerOpen, _) =>
                                                        GestureDetector(
                                                  onTap: () async {
                                                    drawerOpen.isDrawer = false;
                                                    await AuthServices
                                                        .signOut();
                                                  },
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .power_settings_new,
                                                        size: heightSize * 0.03,
                                                        color: redColor,
                                                      ),
                                                      SizedBox(
                                                        width: widthSize * 0.02,
                                                      ),
                                                      Text(
                                                        "Sign Out",
                                                        style: blackTextFont
                                                            .copyWith(
                                                          fontSize: heightSize *
                                                              0.022,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: redColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                : SizedBox(),
                          ),
                        ),
                      ),
                      Positioned(
                        top: heightSize * 0.01,
                        right: widthSize * 0.02,
                        child: Consumer<ReportDay>(
                          builder: (context, reportDay, _) =>
                              Consumer<DrawerOpen>(
                            builder: (context, drawerOpen, _) =>
                                GestureDetector(
                              onTap: () {
                                drawerOpen.isDrawer = !drawerOpen.isDrawer;
                                reportDay.isReport = false;
                              },
                              child: Icon(
                                Icons.close,
                                size: widthSize * 0.075,
                                color: redColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );

// NOTE: reportDayForm()
  Widget reportDayForm(double heightSize, double widthSize) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
        child: Container(
          height: heightSize,
          width: widthSize,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
          ),
          child: Container(
            margin: EdgeInsets.only(top: heightSize * 0.1),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: heightSize * 0.8,
                    width: widthSize * 0.8,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(widthSize * 0.035),
                    ),
                    child: Consumer<ReportDay>(
                      builder: (context, reportDay, _) => Stack(
                        children: [
                          Positioned(
                            top: widthSize * 0.03,
                            right: widthSize * 0.03,
                            child: GestureDetector(
                              onTap: () {
                                reportDay.isReport = false;
                                catatanController.text = "";
                              },
                              child: Icon(
                                Icons.close,
                                size: widthSize * 0.075,
                                color: redColor,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(widthSize * 0.03),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      "Laporan Harian",
                                      style: blueTextFont.copyWith(
                                        fontSize: heightSize * 0.025,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: widthSize * 0.03,
                                ),
                                Expanded(
                                  flex: 8,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 6,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Center(
                                                      child: Container(
                                                        height: widthSize * 0.1,
                                                        width: widthSize * 0.1,
                                                        child: Center(
                                                          child: Icon(
                                                            Icons.grain,
                                                            size: widthSize *
                                                                0.08,
                                                            color: blackColor,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        "Batuk",
                                                        style: blackTextFont
                                                            .copyWith(
                                                          fontSize:
                                                              heightSize * 0.02,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 4,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        batuk++;
                                                      });
                                                    },
                                                    child: Container(
                                                      height: widthSize * 0.07,
                                                      width: widthSize * 0.07,
                                                      decoration: BoxDecoration(
                                                        color: mainColor,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Center(
                                                        child: Icon(
                                                          Icons.add,
                                                          size:
                                                              widthSize * 0.05,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: widthSize * 0.08,
                                                    width: widthSize * 0.1,
                                                    decoration: BoxDecoration(
                                                      border: Border(
                                                        bottom: BorderSide(
                                                          color: greyColor,
                                                          width: 2,
                                                        ),
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        batuk.toString(),
                                                        style: blackNumberFont
                                                            .copyWith(
                                                          fontSize: heightSize *
                                                              0.022,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: batuk > 0
                                                        ? () {
                                                            setState(() {
                                                              batuk--;
                                                            });
                                                          }
                                                        : () {},
                                                    child: Container(
                                                      height: widthSize * 0.07,
                                                      width: widthSize * 0.07,
                                                      decoration: BoxDecoration(
                                                        color: mainColor,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Center(
                                                        child: Container(
                                                          height: 2,
                                                          width:
                                                              widthSize * 0.027,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 6,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Center(
                                                      child: Container(
                                                        height: widthSize * 0.1,
                                                        width: widthSize * 0.1,
                                                        child: Center(
                                                          child: Icon(
                                                            Icons
                                                                .airline_seat_flat_angled,
                                                            size: widthSize *
                                                                0.08,
                                                            color: blackColor,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        "Tidur",
                                                        style: blackTextFont
                                                            .copyWith(
                                                          fontSize:
                                                              heightSize * 0.02,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 4,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        tidur += 0.10;
                                                      });
                                                    },
                                                    child: Container(
                                                      height: widthSize * 0.07,
                                                      width: widthSize * 0.07,
                                                      decoration: BoxDecoration(
                                                        color: mainColor,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Center(
                                                        child: Icon(
                                                          Icons.add,
                                                          size:
                                                              widthSize * 0.05,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: widthSize * 0.08,
                                                    width: widthSize * 0.1,
                                                    decoration: BoxDecoration(
                                                      border: Border(
                                                        bottom: BorderSide(
                                                          color: greyColor,
                                                          width: 2,
                                                        ),
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        tidur
                                                            .toStringAsFixed(2),
                                                        style: blackNumberFont
                                                            .copyWith(
                                                          fontSize: heightSize *
                                                              0.022,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: tidur > 0
                                                        ? () {
                                                            setState(() {
                                                              tidur -= 0.10;
                                                            });
                                                          }
                                                        : () {},
                                                    child: Container(
                                                      height: widthSize * 0.07,
                                                      width: widthSize * 0.07,
                                                      decoration: BoxDecoration(
                                                        color: mainColor,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Center(
                                                        child: Container(
                                                          height: 2,
                                                          width:
                                                              widthSize * 0.027,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 6,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Center(
                                                      child: Container(
                                                        height: widthSize * 0.1,
                                                        width: widthSize * 0.1,
                                                        child: Center(
                                                          child: Icon(
                                                            Icons.gesture,
                                                            size: widthSize *
                                                                0.08,
                                                            color: blackColor,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        "Sesak Napas",
                                                        style: blackTextFont
                                                            .copyWith(
                                                          fontSize:
                                                              heightSize * 0.02,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                        maxLines: 1,
                                                        overflow:
                                                            TextOverflow.fade,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 4,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        sesakNapas++;
                                                      });
                                                    },
                                                    child: Container(
                                                      height: widthSize * 0.07,
                                                      width: widthSize * 0.07,
                                                      decoration: BoxDecoration(
                                                        color: mainColor,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Center(
                                                        child: Icon(
                                                          Icons.add,
                                                          size:
                                                              widthSize * 0.05,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: widthSize * 0.08,
                                                    width: widthSize * 0.1,
                                                    decoration: BoxDecoration(
                                                      border: Border(
                                                        bottom: BorderSide(
                                                          color: greyColor,
                                                          width: 2,
                                                        ),
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        sesakNapas.toString(),
                                                        style: blackNumberFont
                                                            .copyWith(
                                                          fontSize: heightSize *
                                                              0.022,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: sesakNapas > 0
                                                        ? () {
                                                            setState(() {
                                                              sesakNapas--;
                                                            });
                                                          }
                                                        : () {},
                                                    child: Container(
                                                      height: widthSize * 0.07,
                                                      width: widthSize * 0.07,
                                                      decoration: BoxDecoration(
                                                        color: mainColor,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Center(
                                                        child: Container(
                                                          height: 2,
                                                          width:
                                                              widthSize * 0.027,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 6,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Center(
                                                      child: Container(
                                                        height: widthSize * 0.1,
                                                        width: widthSize * 0.1,
                                                        child: Center(
                                                          child: Icon(
                                                            Icons.ac_unit,
                                                            size: widthSize *
                                                                0.08,
                                                            color: blackColor,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        "Suhu Tubuh",
                                                        style: blackTextFont
                                                            .copyWith(
                                                          fontSize:
                                                              heightSize * 0.02,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 4,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        suhuTubuh += 0.1;
                                                      });
                                                    },
                                                    child: Container(
                                                      height: widthSize * 0.07,
                                                      width: widthSize * 0.07,
                                                      decoration: BoxDecoration(
                                                        color: mainColor,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Center(
                                                        child: Icon(
                                                          Icons.add,
                                                          size:
                                                              widthSize * 0.05,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: widthSize * 0.08,
                                                    width: widthSize * 0.1,
                                                    decoration: BoxDecoration(
                                                      border: Border(
                                                        bottom: BorderSide(
                                                          color: greyColor,
                                                          width: 2,
                                                        ),
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        suhuTubuh
                                                                .toStringAsFixed(
                                                                    1) +
                                                            "${String.fromCharCode(176)}",
                                                        style: blackNumberFont
                                                            .copyWith(
                                                          fontSize: heightSize *
                                                              0.022,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: suhuTubuh > 0
                                                        ? () {
                                                            setState(() {
                                                              suhuTubuh -= 0.1;
                                                            });
                                                          }
                                                        : () {},
                                                    child: Container(
                                                      height: widthSize * 0.07,
                                                      width: widthSize * 0.07,
                                                      decoration: BoxDecoration(
                                                        color: mainColor,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Center(
                                                        child: Container(
                                                          height: 2,
                                                          width:
                                                              widthSize * 0.027,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          height: double.infinity,
                                          width: double.infinity,
                                          padding:
                                              EdgeInsets.all(widthSize * 0.03),
                                          decoration: BoxDecoration(
                                            color: greyColor.withOpacity(0.4),
                                            borderRadius: BorderRadius.circular(
                                                widthSize * 0.02),
                                          ),
                                          child: TextField(
                                            controller: catatanController,
                                            decoration: InputDecoration(
                                              hintText: "Catatan",
                                              border: InputBorder.none,
                                              hintStyle:
                                                  greyNumberFont.copyWith(
                                                fontSize: heightSize * 0.022,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            maxLines: 6,
                                            maxLength: 150,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: widthSize * 0.03,
                                ),
                                Expanded(
                                  child: Container(
                                    height: double.infinity,
                                    width: double.infinity,
                                    child: BlocBuilder<UserBloc, UserState>(
                                      builder: (_, userState) => (userState
                                              is Userloaded)
                                          ? isSaveReport
                                              ? SpinKitThreeBounce(
                                                  size: widthSize * 0.1,
                                                  color: redColor,
                                                )
                                              : FlatButton(
                                                  color: mainColor,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            widthSize * 0.02),
                                                  ),
                                                  onPressed: () async {
                                                    _distanceMeters = await Geolocator()
                                                        .distanceBetween(
                                                            _currentPositionLong,
                                                            _currentPositionLat,
                                                            _longitude,
                                                            _latitude);
                                                    setState(() {
                                                      isSaveReport = true;
                                                    });
                                                    if (suhuTubuh <= 37.5 &&
                                                        tidur <= 7) {
                                                      valueGejala = ((batuk *
                                                                  15) +
                                                              (sesakNapas * 25))
                                                          .toDouble();

                                                      await ReportServices
                                                          .saveReport(
                                                        userState.user.id,
                                                        Report(
                                                            userState.user.name,
                                                            _distanceMeters
                                                                .toInt(),
                                                            batuk.toDouble(),
                                                            sesakNapas
                                                                .toDouble(),
                                                            double.parse(suhuTubuh
                                                                .toStringAsFixed(
                                                                    1)),
                                                            double.parse(tidur
                                                                .toStringAsFixed(
                                                                    2)),
                                                            double.parse(valueGejala
                                                                .toStringAsFixed(
                                                                    2)),
                                                            catatanController
                                                                .text,
                                                            time.millisecondsSinceEpoch),
                                                      );

                                                      context
                                                          .bloc<ReportBloc>()
                                                          .add(GetReport(
                                                              userState
                                                                  .user.id));
                                                      context
                                                          .bloc<ChartBloc>()
                                                          .add(GetBezierChart(
                                                              userState
                                                                  .user.id));

                                                      reportDay.isReport =
                                                          false;
                                                      setState(() {
                                                        isSaveReport = false;
                                                      });
                                                    } else {
                                                      valueGejala = ((batuk *
                                                                  15) +
                                                              (sesakNapas *
                                                                  25) +
                                                              ((8 - tidur) *
                                                                  20) +
                                                              ((suhuTubuh -
                                                                      37.5) *
                                                                  20))
                                                          .toDouble();
                                                      await ReportServices
                                                          .saveReport(
                                                        userState.user.id,
                                                        Report(
                                                            userState.user.name,
                                                            _distanceMeters
                                                                .toInt(),
                                                            batuk.toDouble(),
                                                            sesakNapas
                                                                .toDouble(),
                                                            double.parse(suhuTubuh
                                                                .toStringAsFixed(
                                                                    1)),
                                                            double.parse(tidur
                                                                .toStringAsFixed(
                                                                    2)),
                                                            double.parse(valueGejala
                                                                .toStringAsFixed(
                                                                    2)),
                                                            catatanController
                                                                .text,
                                                            time.millisecondsSinceEpoch),
                                                      );
                                                      context
                                                          .bloc<ReportBloc>()
                                                          .add(GetReport(
                                                              userState
                                                                  .user.id));
                                                      context
                                                          .bloc<ChartBloc>()
                                                          .add(GetBezierChart(
                                                              userState
                                                                  .user.id));
                                                      reportDay.isReport =
                                                          false;

                                                      setState(() {
                                                        isSaveReport = false;
                                                      });
                                                    }
                                                  },
                                                  child: Text(
                                                    "Simpan",
                                                    style:
                                                        whiteTextFont.copyWith(
                                                      fontSize:
                                                          heightSize * 0.02,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                )
                                          : SpinKitThreeBounce(
                                              size: widthSize * 0.1,
                                              color: mainColor),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
