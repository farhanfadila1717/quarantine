import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quarantine/models/models.dart';
import 'package:quarantine/services/services.dart';

part 'report_event.dart';
part 'report_state.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  ReportBloc() : super(ReportState([]));

  @override
  Stream<ReportState> mapEventToState(
    ReportEvent event,
  ) async* {
    if (event is SaveReport) {
      await ReportServices.saveReport(event.userID, event.report);

      List<Report> reports = state.reports + [event.report];

      yield ReportState(reports);
    } else if (event is GetReport) {
      List<Report> reports = await ReportServices.getReport(event.userID);

      yield ReportState(reports);
    }
  }
}
