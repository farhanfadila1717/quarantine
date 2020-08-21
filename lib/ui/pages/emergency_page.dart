part of 'pages.dart';

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    double heightSize = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(
                heightSize: heightSize,
                widthSize: widthSize,
                title: "Kontak Darurat",
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(widthSize * 0.04),
                child: Container(
                  height: heightSize * 0.12,
                  width: widthSize - 2 * (widthSize * 0.04),
                  decoration: BoxDecoration(
                    color: mainColor,
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: -heightSize * 0.01,
                        left: -heightSize * 0.01,
                        child: Container(
                          height: heightSize * 0.08,
                          width: heightSize * 0.08,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              "i",
                              style: blueTextFont.copyWith(
                                fontSize: heightSize * 0.03,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: widthSize * 0.04),
                          child: Text(
                            "Jangan ragu untuk menghubungi\n nomor darurat!",
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
              SizedBox(
                height: heightSize * 0.022,
              ),
              Container(
                height: heightSize -
                    (heightSize * 0.095 +
                        heightSize * 0.2 +
                        heightSize * 0.04 +
                        heightSize * 0.05),
                width: widthSize - 2 * (widthSize * 0.04),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(widthSize * 0.04),
                              child: Container(
                                height: double.infinity,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: greenColor,
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            widthSize * 0.04,
                                            widthSize * 0.04,
                                            widthSize * 0.04,
                                            0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Text(
                                                "RS Cipto",
                                                style: whiteTextFont.copyWith(
                                                  fontSize: heightSize * 0.02,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                height: double.infinity,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white
                                                      .withOpacity(0.3),
                                                ),
                                                child: Center(
                                                  child: Container(
                                                    height: widthSize * 0.07,
                                                    width: widthSize * 0.07,
                                                    child: SvgPicture.asset(
                                                      'assets/icons/ic_hospital.svg',
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: SizedBox(),
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        onTap: () =>
                                            launch("tel://089284108213"),
                                        child: Container(
                                          height: double.infinity,
                                          width: double.infinity,
                                          color: Colors.white.withOpacity(0.2),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: widthSize * 0.07,
                                                width: widthSize * 0.07,
                                                margin: EdgeInsets.only(
                                                    right: widthSize * 0.02),
                                                child: Icon(Icons.call,
                                                    color: Colors.white),
                                              ),
                                              Text(
                                                "Telpon",
                                                style: whiteTextFont.copyWith(
                                                  fontSize: heightSize * 0.02,
                                                  fontWeight: FontWeight.w400,
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
                          SizedBox(
                            width: heightSize * 0.022,
                          ),
                          Expanded(
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(widthSize * 0.04),
                              child: Container(
                                height: double.infinity,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple[600],
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            widthSize * 0.04,
                                            widthSize * 0.04,
                                            widthSize * 0.04,
                                            0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Text(
                                                "Corona\nCenter",
                                                style: whiteTextFont.copyWith(
                                                  fontSize: heightSize * 0.02,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                height: double.infinity,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white
                                                      .withOpacity(0.3),
                                                ),
                                                child: Center(
                                                  child: Container(
                                                    height: widthSize * 0.07,
                                                    width: widthSize * 0.07,
                                                    child: SvgPicture.asset(
                                                      'assets/icons/ic_virus.svg',
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: SizedBox(),
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        onTap: () =>
                                            launch("tel://089284108213"),
                                        child: Container(
                                          height: double.infinity,
                                          width: double.infinity,
                                          color: Colors.white.withOpacity(0.2),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: widthSize * 0.07,
                                                width: widthSize * 0.07,
                                                margin: EdgeInsets.only(
                                                    right: widthSize * 0.02),
                                                child: Icon(Icons.call,
                                                    color: Colors.white),
                                              ),
                                              Text(
                                                "Telpon",
                                                style: whiteTextFont.copyWith(
                                                  fontSize: heightSize * 0.02,
                                                  fontWeight: FontWeight.w400,
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
                    SizedBox(
                      height: heightSize * 0.022,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(widthSize * 0.04),
                              child: Container(
                                height: double.infinity,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: redColor,
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            widthSize * 0.04,
                                            widthSize * 0.04,
                                            widthSize * 0.04,
                                            0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Text(
                                                "Ambulance",
                                                style: whiteTextFont.copyWith(
                                                  fontSize: heightSize * 0.02,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                height: double.infinity,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white
                                                      .withOpacity(0.3),
                                                ),
                                                child: Center(
                                                  child: Container(
                                                    height: widthSize * 0.05,
                                                    width: widthSize * 0.05,
                                                    child: SvgPicture.asset(
                                                      'assets/icons/ic_ambulance.svg',
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: SizedBox(),
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        onTap: () =>
                                            launch("tel://089284108213"),
                                        child: Container(
                                          height: double.infinity,
                                          width: double.infinity,
                                          color: Colors.white.withOpacity(0.2),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: widthSize * 0.07,
                                                width: widthSize * 0.07,
                                                margin: EdgeInsets.only(
                                                    right: widthSize * 0.02),
                                                child: Icon(Icons.call,
                                                    color: Colors.white),
                                              ),
                                              Text(
                                                "Telpon",
                                                style: whiteTextFont.copyWith(
                                                  fontSize: heightSize * 0.02,
                                                  fontWeight: FontWeight.w400,
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
                          SizedBox(
                            width: heightSize * 0.022,
                          ),
                          Expanded(
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(widthSize * 0.04),
                              child: Container(
                                height: double.infinity,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.blue[500],
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            widthSize * 0.04,
                                            widthSize * 0.04,
                                            widthSize * 0.04,
                                            0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Text(
                                                "Keluarga\nAnda",
                                                style: whiteTextFont.copyWith(
                                                  fontSize: heightSize * 0.02,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                height: double.infinity,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white
                                                      .withOpacity(0.3),
                                                ),
                                                child: Center(
                                                  child: Container(
                                                    height: widthSize * 0.07,
                                                    width: widthSize * 0.07,
                                                    child: SvgPicture.asset(
                                                      'assets/icons/ic_family.svg',
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: SizedBox(),
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        onTap: () =>
                                            launch("tel://089284108213"),
                                        child: Container(
                                          height: double.infinity,
                                          width: double.infinity,
                                          color: Colors.white.withOpacity(0.2),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: widthSize * 0.07,
                                                width: widthSize * 0.07,
                                                margin: EdgeInsets.only(
                                                    right: widthSize * 0.02),
                                                child: Icon(Icons.call,
                                                    color: Colors.white),
                                              ),
                                              Text(
                                                "Telpon",
                                                style: whiteTextFont.copyWith(
                                                  fontSize: heightSize * 0.02,
                                                  fontWeight: FontWeight.w400,
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
