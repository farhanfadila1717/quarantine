part of 'pages.dart';

class ReportDetailPage extends StatelessWidget {
  final Report report;

  ReportDetailPage(this.report);
  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    double heightSize = MediaQuery.of(context).size.height;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
      ),
      child: WillPopScope(
        onWillPop: () async {
          context.bloc<PageBloc>().add(GoToMainPage(bottomNavBarIndex: 1));

          return;
        },
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                height: heightSize,
                width: widthSize,
                child: Column(
                  children: [
                    CustomAppBar(
                      heightSize: heightSize,
                      widthSize: widthSize,
                      title: "Detail Laporan",
                      onTap: () {
                        context
                            .bloc<PageBloc>()
                            .add(GoToMainPage(bottomNavBarIndex: 1));
                      },
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: widthSize * 0.04),
                        child: Column(
                          children: [
                            SizedBox(
                              height: widthSize * 0.02,
                            ),
                            Expanded(
                              flex: 4,
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Column(
                                    children: [
                                      Expanded(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Container(
                                            height: double.infinity,
                                            width: double.infinity,
                                            padding: EdgeInsets.all(
                                                widthSize * 0.04),
                                            decoration: BoxDecoration(
                                              color: mainColor,
                                            ),
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child: Text(
                                                          "Batuk",
                                                          style: whiteTextFont
                                                              .copyWith(
                                                            fontSize:
                                                                heightSize *
                                                                    0.02,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: Container(
                                                          height:
                                                              double.infinity,
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: Colors.white
                                                                .withOpacity(
                                                                    0.3),
                                                          ),
                                                          child: Center(
                                                            child: Container(
                                                              height:
                                                                  widthSize *
                                                                      0.08,
                                                              width: widthSize *
                                                                  0.8,
                                                              child: Icon(
                                                                Icons.grain,
                                                                size:
                                                                    widthSize *
                                                                        0.06,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          report.batuk
                                                              .toInt()
                                                              .toString(),
                                                          style: whiteNumberFont
                                                              .copyWith(
                                                            fontSize:
                                                                heightSize *
                                                                    0.07,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width:
                                                              widthSize * 0.02,
                                                        ),
                                                        Text(
                                                          "Kali",
                                                          style: whiteTextFont
                                                              .copyWith(
                                                            fontSize:
                                                                heightSize *
                                                                    0.02,
                                                            fontWeight:
                                                                FontWeight.w400,
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
                                      ),
                                      SizedBox(
                                        height: widthSize * 0.04,
                                      ),
                                      Expanded(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Container(
                                            height: double.infinity,
                                            width: double.infinity,
                                            padding: EdgeInsets.all(
                                                widthSize * 0.04),
                                            decoration: BoxDecoration(
                                              color: mainColor,
                                            ),
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child: Text(
                                                          "Sesak\nNapas",
                                                          style: whiteTextFont
                                                              .copyWith(
                                                            fontSize:
                                                                heightSize *
                                                                    0.02,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: Container(
                                                          height:
                                                              double.infinity,
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: Colors.white
                                                                .withOpacity(
                                                                    0.3),
                                                          ),
                                                          child: Center(
                                                            child: Container(
                                                              height:
                                                                  widthSize *
                                                                      0.08,
                                                              width: widthSize *
                                                                  0.8,
                                                              child: Icon(
                                                                Icons.gesture,
                                                                size:
                                                                    widthSize *
                                                                        0.06,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          report.sesakNapas
                                                              .toInt()
                                                              .toString(),
                                                          style: whiteNumberFont
                                                              .copyWith(
                                                            fontSize:
                                                                heightSize *
                                                                    0.07,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width:
                                                              widthSize * 0.02,
                                                        ),
                                                        Text(
                                                          "Kali",
                                                          style: whiteTextFont
                                                              .copyWith(
                                                            fontSize:
                                                                heightSize *
                                                                    0.02,
                                                            fontWeight:
                                                                FontWeight.w400,
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
                                      ),
                                    ],
                                  )),
                                  SizedBox(
                                    width: widthSize * 0.04,
                                  ),
                                  Expanded(
                                      child: Column(
                                    children: [
                                      Expanded(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Container(
                                            height: double.infinity,
                                            width: double.infinity,
                                            padding: EdgeInsets.all(
                                                widthSize * 0.04),
                                            decoration: BoxDecoration(
                                              color: mainColor,
                                            ),
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child: Text(
                                                          "Tidur",
                                                          style: whiteTextFont
                                                              .copyWith(
                                                            fontSize:
                                                                heightSize *
                                                                    0.02,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: Container(
                                                          height:
                                                              double.infinity,
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: Colors.white
                                                                .withOpacity(
                                                                    0.3),
                                                          ),
                                                          child: Center(
                                                            child: Container(
                                                              height:
                                                                  widthSize *
                                                                      0.08,
                                                              width: widthSize *
                                                                  0.8,
                                                              child: Icon(
                                                                Icons
                                                                    .airline_seat_flat_angled,
                                                                size:
                                                                    widthSize *
                                                                        0.06,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          report.tidur
                                                              .toString(),
                                                          style: whiteNumberFont
                                                              .copyWith(
                                                            fontSize:
                                                                heightSize *
                                                                    0.07,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width:
                                                              widthSize * 0.02,
                                                        ),
                                                        Text(
                                                          "Jam",
                                                          style: whiteTextFont
                                                              .copyWith(
                                                            fontSize:
                                                                heightSize *
                                                                    0.02,
                                                            fontWeight:
                                                                FontWeight.w400,
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
                                      ),
                                      SizedBox(
                                        height: widthSize * 0.04,
                                      ),
                                      Expanded(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Container(
                                            height: double.infinity,
                                            width: double.infinity,
                                            padding: EdgeInsets.all(
                                                widthSize * 0.04),
                                            decoration: BoxDecoration(
                                              color: mainColor,
                                            ),
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child: Text(
                                                          "Suhu\nTubuh",
                                                          style: whiteTextFont
                                                              .copyWith(
                                                            fontSize:
                                                                heightSize *
                                                                    0.02,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: Container(
                                                          height:
                                                              double.infinity,
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: Colors.white
                                                                .withOpacity(
                                                                    0.3),
                                                          ),
                                                          child: Center(
                                                            child: Container(
                                                              height:
                                                                  widthSize *
                                                                      0.08,
                                                              width: widthSize *
                                                                  0.8,
                                                              child: Icon(
                                                                Icons.ac_unit,
                                                                size:
                                                                    widthSize *
                                                                        0.06,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          report.suhu
                                                                  .toInt()
                                                                  .toString() +
                                                              "${String.fromCharCode(176)}",
                                                          style: whiteNumberFont
                                                              .copyWith(
                                                            fontSize:
                                                                heightSize *
                                                                    0.07,
                                                            fontWeight:
                                                                FontWeight.w500,
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
                                      ),
                                    ],
                                  )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: BlocBuilder<ChartBloc, ChartState>(
                        builder: (_, chartState) => (chartState
                                .bezierCharts.isNotEmpty)
                            ? ChartViewer(
                                heightSize, widthSize, chartState.bezierCharts)
                            : Container(
                                width: widthSize,
                                height: heightSize * 0.35,
                                child: Center(
                                  child: SpinKitThreeBounce(
                                    size: widthSize * 0.15,
                                    color: mainColor,
                                  ),
                                ),
                              ),
                      ),
                    ),
                    SizedBox(
                      height: heightSize * 0.05,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
