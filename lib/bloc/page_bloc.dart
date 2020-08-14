import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quarantine/models/models.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(OnPageInitial());

  @override
  Stream<PageState> mapEventToState(
    PageEvent event,
  ) async* {
    if (event is GoToSplashPage) {
      yield OnSplashPage();
    } else if (event is GoToSignInPage) {
      yield OnSignInPage();
    } else if (event is GoToMainPage) {
      yield OnMainPage();
    } else if (event is GoToGetLocationPage) {
      yield OnGetLocationPage(event.registrationData);
    } else if (event is GoToSignUpPage) {
      yield OnSignUpPage(event.registrationData);
    } else if (event is GoToConfrimAccountPage) {
      yield OnConfrimAccountPage(event.registrationData);
    } else if (event is GoToGetProfilePicturePage) {
      yield OnGetProfilePicturePage(event.registrationData);
    }
  }
}
