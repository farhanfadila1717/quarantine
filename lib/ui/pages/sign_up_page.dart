part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  final RegistrationData registrationData;

  SignUpPage(this.registrationData);
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController retypePasswordController = TextEditingController();
  String cityLive;
  bool showPassword;
  bool password;
  bool showRetypePassword;
  bool retypePassword;
  bool email;
  bool name;
  @override
  void initState() {
    super.initState();
    nameController.text = widget.registrationData.name;
    emailController.text = widget.registrationData.email;
    cityLive = widget.registrationData.cityLive;
    showPassword = false;
    password = false;
    showRetypePassword = false;
    retypePassword = false;
  }

  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    double heightSize = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToSplashPage());
        return;
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () {
                      context.bloc<PageBloc>().add(GoToSplashPage());
                    },
                    child: Container(
                      height: widthSize * 0.08,
                      width: widthSize * 0.08,
                      margin: EdgeInsets.symmetric(
                          horizontal: widthSize * 0.03,
                          vertical: widthSize * 0.02),
                      child: Icon(
                        Icons.arrow_back,
                        size: widthSize * 0.07,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: widthSize * 0.04, top: heightSize * 0.055),
                    child: Text(
                      "Buat Akun",
                      style: blueTextFont.copyWith(
                        fontSize: heightSize * 0.032,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: heightSize * 0.075,
                    width: widthSize - (2 * widthSize * 0.04),
                    margin: EdgeInsets.only(
                      top: heightSize * 0.055,
                      bottom: heightSize * 0.028,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 1,
                              color:
                                  name == true || nameController.text.length > 0
                                      ? mainColor
                                      : greyColor)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: widthSize * 0.01, right: widthSize * 0.01),
                      child: Row(
                        children: [
                          Container(
                            height: heightSize * 0.04,
                            width: heightSize * 0.04,
                            child: SvgPicture.asset(
                              "assets/icons/ic_person.svg",
                              color:
                                  name == true || nameController.text.length > 0
                                      ? mainColor
                                      : greyColor,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: heightSize * 0.075,
                              margin: EdgeInsets.only(left: widthSize * 0.02),
                              child: TextField(
                                controller: nameController,
                                onChanged: (text) {},
                                decoration: InputDecoration(
                                  hintText: "Nama Lengkap",
                                  hintStyle: greyTextFont.copyWith(
                                    fontSize: heightSize * 0.021,
                                  ),
                                  border: InputBorder.none,
                                ),
                                maxLines: 1,
                                cursorColor: mainColor,
                                onTap: () {
                                  setState(() {
                                    name = true;
                                  });
                                },
                              ),
                            ),
                          ),
                          Container(
                            height: heightSize * 0.035,
                            width: heightSize * 0.035,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: heightSize * 0.075,
                    width: widthSize - (2 * widthSize * 0.04),
                    margin: EdgeInsets.only(
                      bottom: heightSize * 0.028,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 1,
                              color: email == true ||
                                      emailController.text.length > 0
                                  ? mainColor
                                  : greyColor)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: widthSize * 0.02, right: widthSize * 0.01),
                      child: Row(
                        children: [
                          Container(
                            height: heightSize * 0.04,
                            width: heightSize * 0.03,
                            child: SvgPicture.asset(
                              "assets/icons/ic_email.svg",
                              color: email == true ||
                                      emailController.text.length > 0
                                  ? mainColor
                                  : greyColor,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: heightSize * 0.075,
                              margin: EdgeInsets.only(left: widthSize * 0.03),
                              child: TextField(
                                controller: emailController,
                                onChanged: (text) {},
                                decoration: InputDecoration(
                                  hintText: "Alamat Email",
                                  hintStyle: greyTextFont.copyWith(
                                    fontSize: heightSize * 0.021,
                                  ),
                                  border: InputBorder.none,
                                ),
                                maxLines: 1,
                                cursorColor: mainColor,
                                onTap: () {
                                  setState(() {
                                    email = true;
                                  });
                                },
                              ),
                            ),
                          ),
                          Container(
                            height: heightSize * 0.035,
                            width: heightSize * 0.035,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: heightSize * 0.075,
                    width: widthSize - (2 * widthSize * 0.04),
                    margin: EdgeInsets.only(
                      bottom: heightSize * 0.028,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 1,
                              color: password == true ||
                                      passwordController.text.length > 0
                                  ? mainColor
                                  : greyColor)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: widthSize * 0.01, right: widthSize * 0.01),
                      child: Row(
                        children: [
                          Container(
                            height: heightSize * 0.04,
                            width: heightSize * 0.04,
                            child: SvgPicture.asset(
                                "assets/icons/ic_password.svg",
                                color: password == true ||
                                        passwordController.text.length > 0
                                    ? mainColor
                                    : greyColor),
                          ),
                          Expanded(
                            child: Container(
                              height: heightSize * 0.075,
                              margin: EdgeInsets.only(left: widthSize * 0.02),
                              child: TextField(
                                controller: passwordController,
                                onChanged: (text) {},
                                obscureText: !showPassword,
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  hintStyle: greyTextFont.copyWith(
                                    fontSize: heightSize * 0.021,
                                  ),
                                  border: InputBorder.none,
                                ),
                                maxLines: 1,
                                cursorColor: mainColor,
                                onTap: () {
                                  setState(() {
                                    password = true;
                                  });
                                },
                              ),
                            ),
                          ),
                          Container(
                            height: heightSize * 0.035,
                            width: heightSize * 0.035,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  showPassword = !showPassword;
                                });
                              },
                              child: SvgPicture.asset(
                                showPassword
                                    ? "assets/icons/ic_show.svg"
                                    : "assets/icons/ic_hidden.svg",
                                color: showPassword ? mainColor : greyColor,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: heightSize * 0.075,
                    width: widthSize - (2 * widthSize * 0.04),
                    margin: EdgeInsets.only(
                      bottom: heightSize * 0.028,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 1,
                              color: retypePassword == true ||
                                      retypePasswordController.text.length > 0
                                  ? mainColor
                                  : greyColor)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: widthSize * 0.01, right: widthSize * 0.01),
                      child: Row(
                        children: [
                          Container(
                            height: heightSize * 0.04,
                            width: heightSize * 0.04,
                            child: SvgPicture.asset(
                                "assets/icons/ic_password.svg",
                                color: retypePassword == true ||
                                        passwordController.text.length > 0
                                    ? mainColor
                                    : greyColor),
                          ),
                          Expanded(
                            child: Container(
                              height: heightSize * 0.075,
                              margin: EdgeInsets.only(left: widthSize * 0.02),
                              child: TextField(
                                controller: retypePasswordController,
                                onChanged: (text) {},
                                obscureText: !showRetypePassword,
                                decoration: InputDecoration(
                                  hintText: "Konfrimasi Password",
                                  hintStyle: greyTextFont.copyWith(
                                    fontSize: heightSize * 0.021,
                                  ),
                                  border: InputBorder.none,
                                ),
                                maxLines: 1,
                                cursorColor: mainColor,
                                onTap: () {
                                  setState(() {
                                    retypePassword = true;
                                  });
                                },
                              ),
                            ),
                          ),
                          Container(
                            height: heightSize * 0.035,
                            width: heightSize * 0.035,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  showRetypePassword = !showRetypePassword;
                                });
                              },
                              child: SvgPicture.asset(
                                showRetypePassword
                                    ? "assets/icons/ic_show.svg"
                                    : "assets/icons/ic_hidden.svg",
                                color:
                                    showRetypePassword ? mainColor : greyColor,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: heightSize * 0.075,
                    width: widthSize - (2 * widthSize * 0.04),
                    padding: EdgeInsets.symmetric(horizontal: widthSize * 0.02),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: cityLive.length == 0 ? greyColor : mainColor,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: heightSize * 0.03,
                          width: heightSize * 0.03,
                          margin: EdgeInsets.only(right: widthSize * 0.03),
                          child: SvgPicture.asset(
                            'assets/icons/ic_city_live.svg',
                            fit: BoxFit.fitWidth,
                            color: cityLive.length == 0 ? greyColor : mainColor,
                          ),
                        ),
                        Expanded(
                          child: DropdownButton(
                            hint: cityLive.length == 0
                                ? Text(
                                    "Kota",
                                    style: greyTextFont.copyWith(
                                      fontSize: heightSize * 0.021,
                                    ),
                                  )
                                : Text(
                                    cityLive.capital(),
                                    style: blackTextFont.copyWith(
                                      fontSize: heightSize * 0.021,
                                    ),
                                  ),
                            elevation: 0,
                            isExpanded: true,
                            dropdownColor: Colors.white,
                            underline: SizedBox(),
                            icon: Container(
                              height: heightSize * 0.03,
                              width: heightSize * 0.03,
                              child: SvgPicture.asset(
                                'assets/icons/ic_expand.svg',
                                fit: BoxFit.fitWidth,
                                color: cityLive.length == 0
                                    ? greyColor
                                    : mainColor,
                              ),
                            ),
                            items: dummyKota.map((e) {
                              return DropdownMenuItem(
                                value: e.namaKota,
                                child: Text(
                                  e.namaKota.capital(),
                                  style: blackTextFont,
                                ),
                              );
                            }).toList(),
                            onChanged: (String newValue) {
                              setState(() {
                                cityLive = newValue;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: heightSize * 0.07,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: heightSize * 0.075,
                    width: widthSize - (2 * widthSize * 0.04),
                    child: FlatButton(
                      color: mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onPressed: () {
                        if (!(nameController.text.trim() != "" &&
                            emailController.text.trim() != "" &&
                            passwordController.text.trim() != "" &&
                            retypePasswordController.text.trim() != "" &&
                            cityLive.trim() != "")) {
                          Flushbar(
                            duration: Duration(seconds: 5),
                            flushbarPosition: FlushbarPosition.TOP,
                            backgroundColor: redColor.withOpacity(0.9),
                            margin:
                                EdgeInsets.only(top: 10, left: 10, right: 10),
                            maxWidth: widthSize * 0.9,
                            message:
                                "Dimohon untuk melengkapi semua syarat pendaftaran",
                            borderRadius: 6,
                            barBlur: 30,
                            forwardAnimationCurve: Curves.easeInOut,
                          )..show(context);
                        } else if (passwordController.text !=
                            retypePasswordController.text) {
                          Flushbar(
                            duration: Duration(seconds: 5),
                            flushbarPosition: FlushbarPosition.TOP,
                            backgroundColor: redColor.withOpacity(0.9),
                            margin:
                                EdgeInsets.only(top: 10, left: 10, right: 10),
                            maxWidth: widthSize * 0.9,
                            message:
                                "Password dan konfrimasi password tidak sama",
                            borderRadius: 6,
                            barBlur: 30,
                            forwardAnimationCurve: Curves.easeInOut,
                          )..show(context);
                        } else if (passwordController.text.length < 6) {
                          Flushbar(
                            duration: Duration(seconds: 5),
                            flushbarPosition: FlushbarPosition.TOP,
                            backgroundColor: redColor.withOpacity(0.9),
                            margin:
                                EdgeInsets.only(top: 10, left: 10, right: 10),
                            maxWidth: widthSize * 0.9,
                            message:
                                "Password harus berisi 6 karakter atau lebih",
                            borderRadius: 6,
                            barBlur: 30,
                            forwardAnimationCurve: Curves.easeInOut,
                          )..show(context);
                        } else if (!EmailValidator.validate(
                            emailController.text)) {
                          Flushbar(
                            duration: Duration(seconds: 5),
                            flushbarPosition: FlushbarPosition.TOP,
                            backgroundColor: redColor.withOpacity(0.9),
                            margin:
                                EdgeInsets.only(top: 10, left: 10, right: 10),
                            maxWidth: widthSize * 0.9,
                            message: "Format alamat email salah",
                            borderRadius: 6,
                            barBlur: 30,
                            forwardAnimationCurve: Curves.easeInOut,
                          )..show(context);
                        } else if (cityLive.length == 0) {
                          Flushbar(
                            duration: Duration(seconds: 5),
                            flushbarPosition: FlushbarPosition.TOP,
                            backgroundColor: redColor.withOpacity(0.9),
                            margin:
                                EdgeInsets.only(top: 10, left: 10, right: 10),
                            maxWidth: widthSize * 0.9,
                            message: "Silahkan Pilih kota terlebih dahulu",
                            borderRadius: 6,
                            barBlur: 30,
                            forwardAnimationCurve: Curves.easeInOut,
                          )..show(context);
                        } else {
                          widget.registrationData.name = nameController.text;
                          widget.registrationData.email = emailController.text;
                          widget.registrationData.password =
                              passwordController.text;
                          widget.registrationData.cityLive = cityLive;

                          context.bloc<PageBloc>().add(
                              GoToGetProfilePicturePage(
                                  widget.registrationData));
                        }
                        // context.bloc<PageBloc>().add(GoToGetProfilePicturePage(registrationDat));
                        print(nameController.text);
                        print(emailController.text);
                        print(passwordController.text);
                        print(retypePasswordController.text);
                        print(cityLive);
                      },
                      child: Text(
                        "Sign Up",
                        style: whiteTextFont.copyWith(
                          fontSize: heightSize * 0.02,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: heightSize * 0.03,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sudah punya akun? ",
                        style: greyTextFont.copyWith(
                          fontSize: heightSize * 0.02,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.bloc<PageBloc>().add(GoToSignInPage());
                        },
                        child: Text(
                          "Sign In",
                          style: blueTextFont.copyWith(
                            fontSize: heightSize * 0.02,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: heightSize * 0.055,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
