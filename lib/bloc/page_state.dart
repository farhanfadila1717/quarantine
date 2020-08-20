part of 'page_bloc.dart';

abstract class PageState extends Equatable {
  const PageState();

  @override
  List<Object> get props => [];
}

class OnPageInitial extends PageState {
  @override
  List<Object> get props => [];
}

class OnSplashPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnSignInPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnMainPage extends PageState {
  final int bottomNavBarIndex;

  OnMainPage({this.bottomNavBarIndex = 0});
  @override
  List<Object> get props => [bottomNavBarIndex];
}

class OnGetLocationPage extends PageState {
  final RegistrationData registrationData;

  OnGetLocationPage(this.registrationData);
  @override
  List<Object> get props => [registrationData];
}

class OnSignUpPage extends PageState {
  final RegistrationData registrationData;

  OnSignUpPage(this.registrationData);
  @override
  List<Object> get props => [registrationData];
}

class OnConfrimAccountPage extends PageState {
  final RegistrationData registrationData;

  OnConfrimAccountPage(this.registrationData);
  @override
  List<Object> get props => [registrationData];
}

class OnGetProfilePicturePage extends PageState {
  final RegistrationData registrationData;

  OnGetProfilePicturePage(this.registrationData);
  @override
  List<Object> get props => [registrationData];
}

class OnReportDetailPage extends PageState {
  final Report report;

  OnReportDetailPage(this.report);
  @override
  List<Object> get props => [report];
}
