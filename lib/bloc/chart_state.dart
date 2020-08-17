part of 'chart_bloc.dart';

class ChartState extends Equatable {
  final List<BezierModelChart> bezierCharts;
  const ChartState(this.bezierCharts);

  @override
  List<Object> get props => [bezierCharts];
}
