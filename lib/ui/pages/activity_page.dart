part of 'pages.dart';

class ActivityPage extends StatefulWidget {
  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    double heightSize = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: widthSize * 0.04),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: heightSize * 0.41),
                child: SingleChildScrollView(
                  child: Column(
                      children: dummyActivty.asMap().entries.map((e) {
                    int index = e.key;
                    return Container(
                      margin: EdgeInsets.only(
                        top: index != 0 ? heightSize * 0.02 : 0,
                        bottom: index + 1 == dummyActivty.length
                            ? heightSize * 0.12
                            : 0,
                      ),
                      child: ActivityCard(
                        activity: e.value,
                        heightSize: heightSize,
                        widthSize: widthSize,
                        index: index + 1,
                      ),
                    );
                  }).toList()),
                ),
              ),
              Positioned(
                top: heightSize * 0.33,
                child: Container(
                  height: heightSize * 0.08,
                  width: widthSize - (2 * (widthSize * 0.04)),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Saran Aktivitas",
                      style: blackTextFont.copyWith(
                        fontSize: heightSize * 0.025,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: heightSize * 0.02,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(widthSize * 0.03),
                  child: Container(
                    height: heightSize * 0.3,
                    width: widthSize - (2 * widthSize * 0.04),
                    color: mainColor,
                    padding: EdgeInsets.all(widthSize * 0.04),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            height: double.infinity,
                            width: widthSize * 0.45,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/img/bg_activty.png"),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: widthSize * 0.5,
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Jangan lupa ",
                                    style: whiteTextFont.copyWith(
                                      fontSize: heightSize * 0.025,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Cuci Tangan",
                                    style: whiteTextFont.copyWith(
                                      fontSize: heightSize * 0.025,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ", dan gunakan selalu ",
                                    style: whiteTextFont.copyWith(
                                      fontSize: heightSize * 0.025,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Masker",
                                    style: whiteTextFont.copyWith(
                                      fontSize: heightSize * 0.025,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
