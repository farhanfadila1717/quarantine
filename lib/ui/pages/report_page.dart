part of 'pages.dart';

class ReportPage extends StatefulWidget {
  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
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
                      child: BlocBuilder<ReportBloc, ReportState>(
                          builder: (_, reportState) {
                        var sortedReports = reportState.reports;

                        sortedReports.sort((report1, report2) =>
                            report1.time.compareTo(report2.time));
                        return ListView.builder(
                            itemCount: sortedReports.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(
                                    top: index == 0 ? 0 : heightSize * 0.025,
                                    bottom: index + 1 == sortedReports.length
                                        ? heightSize * 0.05
                                        : 0),
                                child: ReportCard(
                                  heightSize: heightSize,
                                  widthSize: widthSize,
                                  report: sortedReports[index],
                                  index: index,
                                  onTap: () {
                                    context.bloc<PageBloc>().add(
                                        GoToReportDetailPage(
                                            sortedReports[index]));
                                  },
                                ),
                              );
                            });
                      }),
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
                            builder: (_, reportState) {
                              var sortedReports = reportState.reports;

                              sortedReports.sort((report1, report2) =>
                                  report1.time.compareTo(report2.time));
                              return Column(
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
                                                  style:
                                                      whiteNumberFont.copyWith(
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
                                                      style: whiteTextFont
                                                          .copyWith(
                                                        fontSize:
                                                            heightSize * 0.02,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          heightSize * 0.005,
                                                    ),
                                                    Text(
                                                      sortedReports.last.batuk
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
                                                      style: whiteTextFont
                                                          .copyWith(
                                                        fontSize:
                                                            heightSize * 0.02,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          heightSize * 0.005,
                                                    ),
                                                    Text(
                                                      sortedReports.last.tidur
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
                                                      style: whiteTextFont
                                                          .copyWith(
                                                        fontSize:
                                                            heightSize * 0.02,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          heightSize * 0.005,
                                                    ),
                                                    Text(
                                                      sortedReports
                                                              .last.sesakNapas
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
                                                      style: whiteTextFont
                                                          .copyWith(
                                                        fontSize:
                                                            heightSize * 0.02,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          heightSize * 0.005,
                                                    ),
                                                    Text(
                                                      sortedReports.last.suhu
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
                              );
                            },
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
