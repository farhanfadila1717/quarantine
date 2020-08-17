part of 'widgets.dart';

class CustomAppBar extends StatelessWidget {
  final bool isHome;
  final double heightSize;
  final double widthSize;
  final String title;
  final Function onTap;
  CustomAppBar(
      {this.heightSize,
      this.isHome = false,
      this.widthSize,
      this.title,
      this.onTap});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: heightSize * 0.09,
        width: widthSize,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: widthSize * 0.03),
          child: Stack(
            children: [
              isHome
                  ? Align(
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
                    )
                  : (onTap != null)
                      ? Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              onTap();
                            },
                            child: Container(
                              height: heightSize * 0.04,
                              width: heightSize * 0.04,
                              child: Icon(
                                Icons.arrow_back,
                                color: blackColor,
                              ),
                            ),
                          ),
                        )
                      : SizedBox(),
              Center(
                child: isHome
                    ? BlocBuilder<UserBloc, UserState>(
                        builder: (_, userState) => (userState is Userloaded)
                            ? Text(
                                userState.user.cityLive.capital() +
                                    ", Indonesia",
                                style: blackTextFont.copyWith(
                                  fontSize: heightSize * 0.02,
                                ),
                              )
                            : SpinKitThreeBounce(
                                size: heightSize * 0.02,
                                color: mainColor,
                              ),
                      )
                    : Text(
                        title,
                        style: blackTextFont.copyWith(
                          fontSize: heightSize * 0.02,
                        ),
                      ),
              ),
              isHome
                  ? Align(
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
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
