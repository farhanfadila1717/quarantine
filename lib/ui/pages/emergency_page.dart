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
            Container(
              height: heightSize * 0.1,
              width: widthSize - 2 * (widthSize * 0.04),
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.circular(widthSize * 0.02),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
