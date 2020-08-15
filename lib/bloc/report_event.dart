part of 'report_bloc.dart';

abstract class ReportEvent extends Equatable {
  const ReportEvent();

  @override
  List<Object> get props => [];
}

class GetReport extends ReportEvent {
  final String userID;

  GetReport(this.userID);
  @override
  List<Object> get props => [userID];
}

class SaveReport extends ReportEvent {
  final Report report;
  final String userID;

  SaveReport(this.report, this.userID);
  @override
  List<Object> get props => [report, userID];
}
