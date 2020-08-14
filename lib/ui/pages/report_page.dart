part of 'pages.dart';

class ReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime time = DateTime.now();
    return Scaffold(
      body: Center(
        child: Text(time.dateAndTime),
      ),
    );
  }
}
