part of 'widgets.dart';

class ActivityCard extends StatelessWidget {
  final double widthSize;
  final double heightSize;
  final Activity activity;
  final int index;

  ActivityCard({this.activity, this.heightSize, this.widthSize, this.index});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(widthSize * 0.03),
      child: Container(
        height: heightSize * 0.1,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          children: [
            Container(
              height: heightSize * 0.1,
              width: heightSize * 0.1,
              padding: EdgeInsets.all(heightSize * 0.02),
              decoration: BoxDecoration(
                color: mainColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(widthSize * 0.03),
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
            Container(
              width: widthSize * 0.53,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    activity.title,
                    style: blackTextFont.copyWith(
                      fontSize: heightSize * 0.022,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: heightSize * 0.01,
                  ),
                  Text(
                    activity.desc,
                    style: greyNumberFont.copyWith(
                      fontSize: heightSize * 0.02,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
            Spacer(),
            Icon(
              Icons.favorite,
              size: heightSize * 0.04,
              color: redColor,
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
