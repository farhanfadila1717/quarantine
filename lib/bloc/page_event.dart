part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {
  const PageEvent();

  @override
  List<Object> get props => [];
}

class GoToSplashPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToSignInPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToMainPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToGetLocationPage extends PageEvent {
  final RegistrationData registrationData;

  GoToGetLocationPage(this.registrationData);
  @override
  List<Object> get props => [registrationData];
}

class GoToSignUpPage extends PageEvent {
  final RegistrationData registrationData;

  GoToSignUpPage(this.registrationData);
  @override
  List<Object> get props => [registrationData];
}

class GoToConfrimAccountPage extends PageEvent {
  final RegistrationData registrationData;

  GoToConfrimAccountPage(this.registrationData);
  @override
  List<Object> get props => [registrationData];
}

class GoToGetProfilePicturePage extends PageEvent {
  final RegistrationData registrationData;

  GoToGetProfilePicturePage(this.registrationData);
  @override
  List<Object> get props => [registrationData];
}
