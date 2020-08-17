part of 'chart_bloc.dart';

abstract class ChartEvent extends Equatable {
  const ChartEvent();

  @override
  List<Object> get props => [];
}

class GetBezierChart extends ChartEvent {
  final String userID;

  GetBezierChart(this.userID);
  @override
  List<Object> get props => [userID];
}
