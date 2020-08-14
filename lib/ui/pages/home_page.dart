part of 'pages.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    double heightSize = MediaQuery.of(context).size.height;
    DateTime timeNow = DateTime.now();
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
                      height: heightSize * 0.23,
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
                            timeNow.dateAndTime,
                            style: blackTextFont.copyWith(
                              fontSize: heightSize * 0.02,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Consumer<ContentManage>(
                      builder: (context, contentState, _) => Container(
                        height: heightSize * 0.06,
                        width: widthSize,
                        padding: EdgeInsets.symmetric(
                            horizontal: widthSize * 0.04,
                            vertical: heightSize * 0.007),
                        child: Row(
                          children: [
                            Container(
                              height: double.infinity,
                              margin: EdgeInsets.only(right: widthSize * 0.07),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      contentState.isContent = false;
                                    },
                                    child: Text(
                                      "Saran",
                                      style: blackTextFont.copyWith(
                                          fontSize: heightSize * 0.025,
                                          fontWeight: FontWeight.w600,
                                          color: contentState.isContent == false
                                              ? blackColor
                                              : greyColor),
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    width: widthSize * 0.07,
                                    height: heightSize * 0.0044,
                                    decoration: BoxDecoration(
                                      color: contentState.isContent == false
                                          ? blackColor
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(3),
                                        topRight: Radius.circular(3),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: double.infinity,
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      contentState.isContent = true;
                                    },
                                    child: Text(
                                      "Kasus",
                                      style: blackTextFont.copyWith(
                                        fontSize: heightSize * 0.025,
                                        fontWeight: FontWeight.w600,
                                        color: contentState.isContent != false
                                            ? blackColor
                                            : greyColor,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    width: widthSize * 0.07,
                                    height: heightSize * 0.0044,
                                    decoration: BoxDecoration(
                                      color: contentState.isContent != false
                                          ? blackColor
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(3),
                                        topRight: Radius.circular(3),
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
                    Consumer<ContentManage>(
                      builder: (context, contentState, _) => (contentState
                                  .isContent ==
                              false)
                          ? Container(
                              height: heightSize * 0.14,
                              width: widthSize,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: dummySaran.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                      left: index == 0 ? widthSize * 0.04 : 0,
                                      right: index == dummySaran.length
                                          ? 0
                                          : widthSize * 0.04,
                                      top: widthSize * 0.02,
                                      bottom: widthSize * 0.02,
                                    ),
                                    child: SaranCard(
                                      heightSize: heightSize,
                                      widthSize: widthSize,
                                      width: widthSize * 0.85,
                                      content: dummySaran[index].body,
                                    ),
                                  );
                                },
                              ),
                            )
                          : Container(
                              height: heightSize * 0.14,
                              width: widthSize - 2 * (widthSize * 0.03),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: widthSize * 0.02),
                                child: Container(
                                  height: double.infinity,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(2, 4),
                                        blurRadius: 4,
                                        color:
                                            Color(0xFF808080).withOpacity(0.14),
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(widthSize * 0.02),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "109098",
                                                style: blackNumberFont.copyWith(
                                                  fontSize: heightSize * 0.025,
                                                  fontWeight: FontWeight.w600,
                                                  color: yellowColor,
                                                ),
                                              ),
                                              SizedBox(
                                                height: heightSize * 0.001,
                                              ),
                                              Text(
                                                "Positif",
                                                style: blackTextFont.copyWith(
                                                  fontSize: heightSize * 0.02,
                                                  fontWeight: FontWeight.w500,
                                                  color: yellowColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "109098",
                                                style: blackNumberFont.copyWith(
                                                  fontSize: heightSize * 0.025,
                                                  fontWeight: FontWeight.w600,
                                                  color: greenColor,
                                                ),
                                              ),
                                              SizedBox(
                                                height: heightSize * 0.001,
                                              ),
                                              Text(
                                                "Pulih",
                                                style: blackTextFont.copyWith(
                                                  fontSize: heightSize * 0.02,
                                                  fontWeight: FontWeight.w500,
                                                  color: greenColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "109098",
                                                style: blackNumberFont.copyWith(
                                                  fontSize: heightSize * 0.025,
                                                  fontWeight: FontWeight.w600,
                                                  color: redColor,
                                                ),
                                              ),
                                              SizedBox(
                                                height: heightSize * 0.001,
                                              ),
                                              Text(
                                                "Wafat",
                                                style: blackTextFont.copyWith(
                                                  fontSize: heightSize * 0.02,
                                                  fontWeight: FontWeight.w500,
                                                  color: redColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ),
                    Container(
                      width: widthSize,
                      height: heightSize * 0.35,
                      padding: EdgeInsets.fromLTRB(
                        widthSize * 0.04,
                        widthSize * 0.04,
                        widthSize * 0.04,
                        0,
                      ),
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        color: Colors.white,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Diagram Kesehatan",
                                  style: blackTextFont.copyWith(
                                    fontSize: heightSize * 0.025,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "Bahaya",
                                          style: blackTextFont.copyWith(
                                            fontSize: heightSize * 0.02,
                                          ),
                                        ),
                                        Text(
                                          "Normal",
                                          style: blackTextFont.copyWith(
                                            fontSize: heightSize * 0.02,
                                          ),
                                        ),
                                        Text(
                                          "Baik",
                                          style: blackTextFont.copyWith(
                                            fontSize: heightSize * 0.02,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Placeholder(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: heightSize * 0.095,
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
                            userState.user.cityLive.capital() + ", Indonesia",
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
                      color: blackColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
