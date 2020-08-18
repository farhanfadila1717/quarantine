part of 'pages.dart';

class ReportPage extends StatefulWidget {
  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  TextEditingController batukController = TextEditingController();
  TextEditingController sesakNapasController = TextEditingController();
  TextEditingController tidurController = TextEditingController();
  TextEditingController suhuController = TextEditingController();

  DateTime time = DateTime.now();

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
        child: Stack(
          children: [
            // NOTE: ALl Days Reports
            Positioned(
              top: heightSize * 0.38,
              left: widthSize * 0.04,
              child: Container(
                width: widthSize - (2 * (widthSize * 0.04)),
                height: heightSize * 0.49,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Semua Hari",
                        style: blackTextFont.copyWith(
                          fontSize: heightSize * 0.025,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 15,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                height: heightSize * 0.1,
                                width: double.infinity,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: heightSize * 0.1,
                                      width: heightSize * 0.1,
                                      padding:
                                          EdgeInsets.all(heightSize * 0.02),
                                      decoration: BoxDecoration(
                                        color: mainColor.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Container(
                                        height: double.infinity,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: mainColor,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                          child: Text(
                                            "0",
                                            style: whiteNumberFont.copyWith(
                                              fontSize: heightSize * 0.02,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: widthSize * 0.04,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Hari 0",
                                          style: blackTextFont.copyWith(
                                            fontSize: heightSize * 0.022,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(
                                          height: heightSize * 0.01,
                                        ),
                                        Text(
                                          time.dateAndTimeDay,
                                          style: greyNumberFont.copyWith(
                                            fontSize: heightSize * 0.02,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: heightSize * 0.03,
                                      color: greyColor,
                                    ),
                                    SizedBox(
                                      width: widthSize * 0.04,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: heightSize * 0.02,
                            ),
                            InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                height: heightSize * 0.1,
                                width: double.infinity,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: heightSize * 0.1,
                                      width: heightSize * 0.1,
                                      padding:
                                          EdgeInsets.all(heightSize * 0.02),
                                      decoration: BoxDecoration(
                                        color: mainColor.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Container(
                                        height: double.infinity,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: mainColor,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                          child: Text(
                                            "1",
                                            style: whiteNumberFont.copyWith(
                                              fontSize: heightSize * 0.02,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: widthSize * 0.04,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Hari 1",
                                          style: blackTextFont.copyWith(
                                            fontSize: heightSize * 0.022,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(
                                          height: heightSize * 0.01,
                                        ),
                                        Text(
                                          time.dateAndTimeDay,
                                          style: greyNumberFont.copyWith(
                                            fontSize: heightSize * 0.02,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: heightSize * 0.03,
                                      color: greyColor,
                                    ),
                                    SizedBox(
                                      width: widthSize * 0.04,
                                    ),
                                  ],
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
            ),
            Positioned(
              top: widthSize * 0.04,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: widthSize * 0.04),
                child: Column(
                  children: [
                    Container(
                      height: heightSize * 0.32,
                      width: widthSize - (2 * widthSize * 0.04),
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                          padding: EdgeInsets.all(widthSize * 0.04),
                          child: BlocBuilder<ReportBloc, ReportState>(
                            builder: (_, reportState) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 6,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 5,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "Pemantauan",
                                                style: whiteTextFont.copyWith(
                                                  fontSize: heightSize * 0.02,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                "Hasil pemantauan hari ini!",
                                                style: whiteNumberFont.copyWith(
                                                  fontSize: heightSize * 0.02,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.3),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: Container(
                                              height: widthSize * 0.1,
                                              width: widthSize * 0.1,
                                              child: Icon(
                                                Icons.attach_file,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: widthSize * 0.04,
                                ),
                                Expanded(
                                  flex: 7,
                                  child: Row(
                                    children: [
                                      Expanded(
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
                                                      size: widthSize * 0.08,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: widthSize * 0.02),
                                            Expanded(
                                              flex: 2,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Batuk",
                                                    style:
                                                        whiteTextFont.copyWith(
                                                      fontSize:
                                                          heightSize * 0.02,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: heightSize * 0.005,
                                                  ),
                                                  Text(
                                                    reportState.reports[0].batuk
                                                            .toInt()
                                                            .toString() +
                                                        " Kali",
                                                    style: whiteNumberFont
                                                        .copyWith(
                                                      fontSize:
                                                          heightSize * 0.02,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: widthSize * 0.04,
                                      ),
                                      Expanded(
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
                                                      size: widthSize * 0.08,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: widthSize * 0.02),
                                            Expanded(
                                              flex: 2,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Tidur",
                                                    style:
                                                        whiteTextFont.copyWith(
                                                      fontSize:
                                                          heightSize * 0.02,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: heightSize * 0.005,
                                                  ),
                                                  Text(
                                                    reportState.reports[0].tidur
                                                            .toString() +
                                                        " Jam",
                                                    style: whiteNumberFont
                                                        .copyWith(
                                                      fontSize:
                                                          heightSize * 0.02,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: widthSize * 0.04,
                                ),
                                Expanded(
                                  flex: 7,
                                  child: Row(
                                    children: [
                                      Expanded(
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
                                                      size: widthSize * 0.08,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: widthSize * 0.02),
                                            Expanded(
                                              flex: 2,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Sesak Napas",
                                                    style:
                                                        whiteTextFont.copyWith(
                                                      fontSize:
                                                          heightSize * 0.02,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: heightSize * 0.005,
                                                  ),
                                                  Text(
                                                    reportState.reports[0]
                                                            .sesakNapas
                                                            .toInt()
                                                            .toString() +
                                                        " Kali",
                                                    style: whiteNumberFont
                                                        .copyWith(
                                                      fontSize:
                                                          heightSize * 0.02,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: widthSize * 0.04,
                                      ),
                                      Expanded(
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
                                                      size: widthSize * 0.08,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: widthSize * 0.02),
                                            Expanded(
                                              flex: 2,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Suhu Tubuh",
                                                    style:
                                                        whiteTextFont.copyWith(
                                                      fontSize:
                                                          heightSize * 0.02,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: heightSize * 0.005,
                                                  ),
                                                  Text(
                                                    reportState.reports[0].suhu
                                                            .toString() +
                                                        "${String.fromCharCode(176)}",
                                                    style: whiteNumberFont
                                                        .copyWith(
                                                      fontSize:
                                                          heightSize * 0.02,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
