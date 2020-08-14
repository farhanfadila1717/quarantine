part of 'pages.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int bottomNavbarIndex;
  PageController pageController;
  @override
  void initState() {
    super.initState();
    bottomNavbarIndex = 0;
    pageController = PageController(initialPage: bottomNavbarIndex);
  }

  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    double heightSize = MediaQuery.of(context).size.height;
    return Consumer<DrawerOpen>(
      builder: (context, drawerOpen, _) =>
          AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor:
              drawerOpen.isDrawer == true ? Colors.transparent : Colors.white,
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
              createBottomNavigationBar(heightSize, widthSize),
              (drawerOpen.isDrawer == true)
                  ? customDrawer(heightSize, widthSize)
                  : SizedBox(),
            ],
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
                  height: 24,
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
                  height: 24,
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
                  height: 24,
                  margin: EdgeInsets.only(bottom: 2),
                  child: SvgPicture.asset((bottomNavbarIndex == 2)
                      ? "assets/icons/ic_emergency_selected.svg"
                      : "assets/icons/ic_emergency.svg"),
                ),
              ),
              BottomNavigationBarItem(
                title: Text(
                  "Aktifitas",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: (bottomNavbarIndex == 3) ? mainColor : greyColor,
                  ),
                ),
                icon: Container(
                  height: 24,
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
      Container(
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
                                        "Kota ${userState.user.cityLive}",
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
                                                  style: blackTextFont.copyWith(
                                                    fontSize:
                                                        heightSize * 0.022,
                                                    fontWeight: FontWeight.w500,
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
                                                  style: blackTextFont.copyWith(
                                                    fontSize:
                                                        heightSize * 0.022,
                                                    fontWeight: FontWeight.w500,
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
                                                  style: blackTextFont.copyWith(
                                                    fontSize:
                                                        heightSize * 0.022,
                                                    fontWeight: FontWeight.w500,
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
                                                  style: blackTextFont.copyWith(
                                                    fontSize:
                                                        heightSize * 0.022,
                                                    fontWeight: FontWeight.w500,
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
                                                  await AuthServices.signOut();
                                                },
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.power_settings_new,
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
                                                        fontSize:
                                                            heightSize * 0.022,
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
                      child: Consumer<DrawerOpen>(
                        builder: (context, drawerOpen, _) => GestureDetector(
                          onTap: () {
                            drawerOpen.isDrawer = !drawerOpen.isDrawer;
                          },
                          child: Icon(
                            Icons.close,
                            size: widthSize * 0.075,
                            color: redColor,
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
      );
}
