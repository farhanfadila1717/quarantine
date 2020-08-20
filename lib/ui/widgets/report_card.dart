part of 'widgets.dart';

class ReportCard extends StatelessWidget {
  final double heightSize;
  final double widthSize;
  final Report report;
  final int index;
  final Function onTap;

  ReportCard(
      {this.heightSize, this.report, this.widthSize, this.index, this.onTap});
  @override
  Widget build(BuildContext context) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(report.time);
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
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
              padding: EdgeInsets.all(heightSize * 0.02),
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
                    index.toString(),
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hari ${index.toString()}",
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
    );
  }
}
