part of 'pages.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    double heightSize = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: heightSize * 0.09),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: heightSize * 0.3,
                      width: widthSize,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Hari",
                            style: blackTextFont.copyWith(
                              fontSize: heightSize * 0.02,
                            ),
                          ),
                          SizedBox(
                            height: heightSize * 0.007,
                          ),
                          Container(
                            height: heightSize * 0.128,
                            width: widthSize,
                            child: Text(
                              "1",
                              style: blackTextFont.copyWith(
                                fontSize: heightSize * 0.09,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: heightSize * 0.007,
                          ),
                          Text(
                            "20 Agustus 2020",
                            style: blackTextFont.copyWith(
                              fontSize: heightSize * 0.02,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: heightSize * 0.08,
                      width: widthSize,
                      color: greenColor,
                    ),
                  ],
                ),
              ),
            ),
            createCustomAppBar(heightSize, widthSize),
          ],
        ),
      ),
    );
  }

  // NOTE: Custom Appbar
  Widget createCustomAppBar(double heightSize, double widthSize) => Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: heightSize * 0.09,
          width: widthSize,
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: widthSize * 0.03),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Consumer<DrawerOpen>(
                    builder: (context, drawerOpen, _) => GestureDetector(
                      onTap: () {
                        drawerOpen.isDrawer = true;
                      },
                      child: Container(
                        height: heightSize * 0.04,
                        width: heightSize * 0.04,
                        child: drawerOpen.isDrawer != true
                            ? SvgPicture.asset(
                                'assets/icons/ic_drawer.svg',
                                fit: BoxFit.fitHeight,
                                color: blackColor,
                              )
                            : SizedBox(),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: BlocBuilder<UserBloc, UserState>(
                    builder: (_, userState) => (userState is Userloaded)
                        ? Text(
                            userState.user.cityLive + ", Indonesia",
                            style: blackTextFont.copyWith(
                              fontSize: heightSize * 0.02,
                            ),
                          )
                        : SpinKitThreeBounce(
                            size: heightSize * 0.02,
                            color: mainColor,
                          ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: heightSize * 0.04,
                    width: heightSize * 0.04,
                    child: SvgPicture.asset(
                      'assets/icons/ic_notification.svg',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
