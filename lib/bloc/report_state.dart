part of 'report_bloc.dart';

class ReportState extends Equatable {
  final List<Report> reports;
  ReportState(this.reports);

  @override
  List<Object> get props => [reports];
}
