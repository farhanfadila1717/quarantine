part of 'pages.dart';

class ConfirmAccountPage extends StatefulWidget {
  final RegistrationData registrationData;

  ConfirmAccountPage(this.registrationData);

  @override
  _ConfirmAccountPageState createState() => _ConfirmAccountPageState();
}

class _ConfirmAccountPageState extends State<ConfirmAccountPage> {
  bool isSignUp = false;
  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    double heightSize = MediaQuery.of(context).size.height;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      child: WillPopScope(
        onWillPop: () async {
          context
              .bloc<PageBloc>()
              .add(GoToGetProfilePicturePage(widget.registrationData));
          return;
        },
        child: Scaffold(
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: widthSize * 0.6,
                    child: Text(
                      "Selamat Datang\n${widget.registrationData.name}",
                      style: blueTextFont.copyWith(
                        fontSize: heightSize * 0.032,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: heightSize * 0.05,
                  ),
                  Container(
                    height: widthSize * 0.35,
                    width: widthSize * 0.35,
                    decoration: BoxDecoration(
                      color: mainColor,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: widget.registrationData.profilePicture == null
                            ? AssetImage("assets/img/default_image.png")
                            : FileImage(widget.registrationData.profilePicture),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: heightSize * 0.05,
                  ),
                  Container(
                    height: heightSize * 0.075,
                    width: widthSize * 0.5,
                    child: isSignUp
                        ? SpinKitChasingDots(
                            size: heightSize * 0.075,
                            color: greenColor,
                          )
                        : FlatButton(
                            color: greenColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            onPressed: () async {
                              setState(() {
                                isSignUp = true;
                              });

                              imageFileToUpload =
                                  widget.registrationData.profilePicture;

                              SignInSignUpResult result =
                                  await AuthServices.signUpWithEmail(
                                      widget.registrationData.email,
                                      widget.registrationData.password,
                                      widget.registrationData.name,
                                      widget.registrationData.isolasiLocation,
                                      widget.registrationData.cityLive,
                                      widget.registrationData.time);

                              if (result.user == null) {
                                setState(() {
                                  isSignUp = false;
                                });
                                Flushbar(
                                  duration: Duration(seconds: 5),
                                  flushbarPosition: FlushbarPosition.TOP,
                                  backgroundColor: redColor.withOpacity(0.9),
                                  margin: EdgeInsets.only(
                                      top: 10, left: 10, right: 10),
                                  maxWidth: widthSize * 0.9,
                                  message: result.message,
                                  borderRadius: 6,
                                  barBlur: 30,
                                  forwardAnimationCurve: Curves.easeInOut,
                                )..show(context);
                              }
                            },
                            child: Text(
                              "Buat Akun Saya",
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
          ),
        ),
      ),
    );
  }
}
