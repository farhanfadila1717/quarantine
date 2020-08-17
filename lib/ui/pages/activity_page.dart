part of 'pages.dart';

class ActivityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    double heightSize = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: BlocBuilder<ReportBloc, ReportState>(
          builder: (_, reportState) {
            if (reportState.reports.length != 0) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(reportState.reports.length.toString()),
                  Text(reportState.reports[0].batuk.toString()),
                ],
              );
            } else {
              return SpinKitCircle(
                size: 50,
                color: mainColor,
              );
            }
          },
        ),
      ),
    );
  }
}
