part of 'widgets.dart';

class SaranCard extends StatelessWidget {
  final double width;
  final String content;
  final Function onTap;
  final double heightSize;
  final double widthSize;

  SaranCard(
      {this.content,
      this.width = 90,
      this.onTap,
      this.heightSize,
      this.widthSize});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            offset: Offset(2, 4),
            blurRadius: 4,
            color: Color(0xFF808080).withOpacity(0.14),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(0.3),
              child: Container(
                child: Text(
                  content,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: widthSize * 0.035),
              child: Center(
                child: Container(
                  height: heightSize * 0.045,
                  width: double.infinity,
                  child: FlatButton(
                    onPressed: () {},
                    color: mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(widthSize * 0.04),
                    ),
                    child: Text(
                      "Detail",
                      style: whiteTextFont.copyWith(
                        fontSize: heightSize * 0.02,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
