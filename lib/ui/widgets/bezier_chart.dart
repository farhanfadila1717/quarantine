part of 'widgets.dart';

class ChartViewer extends StatelessWidget {
  final double heightSize;
  final double widthSize;
  final List<BezierModelChart> bezierCharts;
  ChartViewer(this.heightSize, this.widthSize, this.bezierCharts);
  @override
  Widget build(BuildContext context) {
    List<double> axisValues = [];
    for (int i = 0; i < bezierCharts.length; i++) {
      axisValues.add(i.toDouble());
    }

    return Container(
      width: widthSize,
      height: heightSize * 0.35,
      padding: EdgeInsets.fromLTRB(
        widthSize * 0.04,
        widthSize * 0.04,
        widthSize * 0.04,
        0,
      ),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    print(axisValues);
                    print(bezierCharts[0].valueChart);
                  },
                  child: Text(
                    "Diagram Kesehatan",
                    style: blackTextFont.copyWith(
                      fontSize: heightSize * 0.025,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Memburuk",
                          style: blackTextFont.copyWith(
                            fontSize: heightSize * 0.02,
                          ),
                        ),
                        Text(
                          "Membaik",
                          style: blackTextFont.copyWith(
                            fontSize: heightSize * 0.02,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: BezierChart(
                      bezierChartScale: BezierChartScale.CUSTOM,
                      xAxisCustomValues: axisValues,
                      config: BezierChartConfig(
                        xLinesColor: mainColor,
                        verticalIndicatorStrokeWidth: 3.0,
                        verticalIndicatorColor: greyColor,
                        showVerticalIndicator: true,
                        snap: true,
                        bubbleIndicatorColor: mainColor,
                        footerHeight: 40,
                        bubbleIndicatorValueStyle:
                            TextStyle(fontSize: 48, color: Colors.black),
                        bubbleIndicatorLabelStyle:
                            TextStyle(fontSize: 48, color: Colors.white),
                        bubbleIndicatorTitleStyle: TextStyle(fontSize: 48),
                        xAxisTextStyle: TextStyle(color: Colors.black),
                      ),
                      series: [
                        BezierLine(
                            lineColor: mainColor,
                            dataPointStrokeColor: mainColor,
                            data: bezierCharts.asMap().entries.map((e) {
                              int index = e.key;
                              return DataPoint<double>(
                                  value: e.value.valueChart,
                                  xAxis: index.toDouble());
                            }).toList()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
