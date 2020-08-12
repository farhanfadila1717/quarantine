part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    double heightSize = MediaQuery.of(context).size.height;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: mainColor,
        statusBarIconBrightness: Brightness.light,
      ),
      child: WillPopScope(
        onWillPop: () async {
          context.bloc<PageBloc>().add(GoToSplashPage());
          return;
        },
        child: Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  child: Container(
                    height: heightSize * 0.2,
                    width: widthSize,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/img/bg_sign_in.png'),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: heightSize * 0.1,
                        width: widthSize,
                        color: mainColor,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: heightSize / 4,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: widthSize * 0.04,
                        vertical: heightSize * 0.01),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Sign In",
                            style: blackTextFont.copyWith(
                              fontSize: heightSize * 0.032,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          height: heightSize * 0.075,
                          width: widthSize - (2 * widthSize * 0.04),
                          margin: EdgeInsets.only(top: heightSize * 0.055),
                          decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                              width: 1,
                              color: greyColor,
                            )),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: widthSize * 0.02),
                            child: Row(
                              children: [
                                Container(
                                  height: heightSize * 0.04,
                                  width: heightSize * 0.04,
                                  child: SvgPicture.asset(
                                      "assets/icons/ic_person.svg"),
                                ),
                                Container(
                                  height: heightSize * 0.075,
                                  width: widthSize * 0.78,
                                  margin:
                                      EdgeInsets.only(left: widthSize * 0.02),
                                  child: TextField(
                                    controller: emailController,
                                    onChanged: (text) {
                                      setState(() {
                                        isEmailValid =
                                            EmailValidator.validate(text);
                                      });
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Email Address",
                                      hintStyle: greyTextFont.copyWith(
                                        fontSize: heightSize * 0.021,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                    cursorColor: mainColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: heightSize * 0.075,
                          width: widthSize - (2 * widthSize * 0.04),
                          margin: EdgeInsets.only(
                              top: heightSize * 0.028,
                              bottom: heightSize * 0.055),
                          decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                              width: 1,
                              color: greyColor,
                            )),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: widthSize * 0.02),
                            child: Row(
                              children: [
                                Container(
                                  height: heightSize * 0.04,
                                  width: heightSize * 0.04,
                                  child: SvgPicture.asset(
                                      "assets/icons/ic_password.svg"),
                                ),
                                Container(
                                  height: heightSize * 0.075,
                                  width: widthSize * 0.78,
                                  margin:
                                      EdgeInsets.only(left: widthSize * 0.02),
                                  child: TextField(
                                    controller: passwordController,
                                    onChanged: (text) {
                                      isPasswordValid = text.length >= 6;
                                    },
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      hintText: "Password",
                                      hintStyle: greyTextFont.copyWith(
                                        fontSize: heightSize * 0.021,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                    maxLines: 1,
                                    cursorColor: mainColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            height: heightSize * 0.075,
                            width: widthSize - (2 * widthSize * 0.04),
                            child: isSigningIn
                                ? SpinKitCircle(
                                    size: heightSize * 0.075,
                                    color: mainColor,
                                  )
                                : FlatButton(
                                    color: isEmailValid && isPasswordValid
                                        ? mainColor
                                        : greyColor,
                                    onPressed: isEmailValid && isPasswordValid
                                        ? () async {
                                            setState(() {
                                              isSigningIn = true;
                                            });

                                            SignInSignUpResult result =
                                                await AuthServices
                                                    .signInWithEmail(
                                                        emailController.text,
                                                        passwordController
                                                            .text);

                                            if (result.user == null) {
                                              setState(() {
                                                isSigningIn = false;
                                              });
                                            }

                                            Flushbar(
                                              duration: Duration(seconds: 5),
                                              flushbarPosition:
                                                  FlushbarPosition.TOP,
                                              backgroundColor:
                                                  redColor.withOpacity(0.9),
                                              margin: EdgeInsets.only(
                                                  top: 10, left: 10, right: 10),
                                              maxWidth: widthSize * 0.9,
                                              message: result.message,
                                              borderRadius: 6,
                                              barBlur: 30,
                                              forwardAnimationCurve:
                                                  Curves.easeInOut,
                                            ).show(context);
                                          }
                                        : () {},
                                    child: Text(
                                      "Sign In",
                                      style: whiteTextFont.copyWith(
                                        fontSize: heightSize * 0.02,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                        Container(
                          width: widthSize - (2 * widthSize * 0.04),
                          margin: EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Belum punya akun?",
                                style: greyTextFont.copyWith(
                                  fontSize: heightSize * 0.02,
                                ),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  "Daftar",
                                  style: blueTextFont.copyWith(
                                    fontSize: heightSize * 0.02,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
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
}

// onPressed: () async {
//   await AuthServices.signInWithEmail("qcoba12@gmail.com", "123456");
// },

// Positioned(
//     top: heightSize / 4,
//     child: Padding(
//       padding: EdgeInsets.symmetric(
//           horizontal: widthSize * 0.04,
//           vertical: heightSize * 0.01),
//       child: Container(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Align(
//               alignment: Alignment.topLeft,
//               child: Text(
//                 "Sign In",
//                 style: blackTextFont.copyWith(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w600,
//                 ),
//                 textAlign: TextAlign.left,
//               ),
//             ),
//             Container(
//               height: heightSize * 0.075,
//               width: widthSize - (2 * widthSize * 0.04),
//               margin: EdgeInsets.only(top: heightSize * 0.055),
//               decoration: BoxDecoration(
//                 border: Border(
//                   bottom: BorderSide(
//                     color: greyColor,
//                     width: 1,
//                   ),
//                 ),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.symmetric(
//                     horizontal: widthSize * 0.02),
//                 child: Row(
//                   children: [
//                     Container(
//                       height: heightSize * 0.04,
//                       width: heightSize * 0.04,
//                       child: SvgPicture.asset(
//                         'assets/icons/ic_person.svg',
//                         color: greyColor,
//                       ),
//                     ),
//                     Container(
//                       height: heightSize * 0.075,
//                       width: widthSize * 0.78,
//                       margin:
//                           EdgeInsets.only(left: widthSize * 0.02),
//                       child: TextField(
//                         controller: emailController,
//                         decoration: InputDecoration(
//                           hintText: "Email Address",
//                           hintStyle: greyTextFont.copyWith(
//                             fontSize: heightSize * 0.021,
//                           ),
//                           border: InputBorder.none,
//                         ),
//                         cursorColor: mainColor,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               height: heightSize * 0.075,
//               width: widthSize - (2 * widthSize * 0.04),
//               margin: EdgeInsets.only(top: heightSize * 0.028),
//               decoration: BoxDecoration(
//                 border: Border(
//                   bottom: BorderSide(
//                     color: greyColor,
//                     width: 1,
//                   ),
//                 ),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.symmetric(
//                     horizontal: widthSize * 0.02),
//                 child: Row(
//                   children: [
//                     Container(
//                       height: heightSize * 0.04,
//                       width: heightSize * 0.04,
//                       child: SvgPicture.asset(
//                         'assets/icons/ic_password.svg',
//                         color: greyColor,
//                       ),
//                     ),
//                     Container(
//                       height: heightSize * 0.075,
//                       width: widthSize * 0.78,
//                       margin:
//                           EdgeInsets.only(left: widthSize * 0.02),
//                       child: TextField(
//                         controller: passwordController,
//                         decoration: InputDecoration(
//                           hintText: "Password",
//                           hintStyle: greyTextFont.copyWith(
//                             fontSize: heightSize * 0.021,
//                           ),
//                           border: InputBorder.none,
//                         ),
//                         cursorColor: mainColor,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: heightSize * 0.028,
//             ),
//             Align(
//               alignment: Alignment.center,
//               child: Container(
//                 height: heightSize * 0.075,
//                 width: widthSize * 0.5,
//                 child: FlatButton(
//                     color: mainColor,
//                     onPressed: () {},
//                     child: Text("Sign In")),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   ),
