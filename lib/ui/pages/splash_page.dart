part of 'pages.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    double heightSize = MediaQuery.of(context).size.height;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: heightSize * 0.4,
                  width: widthSize,
                  margin: EdgeInsets.only(
                      top: heightSize * 0.08, bottom: heightSize * 0.05),
                  color: mainColor,
                ),
                Text(
                  "Selamat Datang",
                  style: blackTextFont.copyWith(
                    fontSize: heightSize * 0.033,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: heightSize * 0.01,
                ),
                Text(
                  "Patuhi terus imbawan dari pemerintah\nkita bisa melawati pandemi ini.",
                  style: greyTextFont.copyWith(
                    fontSize: heightSize * 0.02,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: heightSize * 0.1,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    height: heightSize * 0.07,
                    width: widthSize * 0.7,
                    child: FlatButton(
                      color: mainColor,
                      onPressed: () {
                        print((widthSize * 01).toString());
                      },
                      child: Text(
                        "Daftar Sekarang",
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sudah punya akun? ",
                      style: greyTextFont.copyWith(
                        fontSize: heightSize * 0.02,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
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
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}