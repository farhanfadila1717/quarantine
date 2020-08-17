import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quarantine/models/models.dart';
import 'package:quarantine/services/services.dart';

part 'chart_event.dart';
part 'chart_state.dart';

class ChartBloc extends Bloc<ChartEvent, ChartState> {
  ChartBloc() : super(ChartState([]));

  @override
  Stream<ChartState> mapEventToState(
    ChartEvent event,
  ) async* {
    if (event is GetBezierChart) {
      List<BezierModelChart> bezierCharts =
          await ReportServices.dataBezierChart(event.userID);

      yield ChartState(bezierCharts);
    }
  }
}
