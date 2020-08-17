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

  double valueGejala;
  double batuk;
  double sesakNapas;
  double tidur;
  double suhu;
  bool isReport;

  @override
  void initState() {
    super.initState();
    valueGejala = 0;
    tidur = 0;
    sesakNapas = 0;
    suhu = 0;
    batuk = 0;
    isReport = false;
  }

  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    double heightSize = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
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
