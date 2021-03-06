part of 'pages.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseUser firebaseUser = Provider.of<FirebaseUser>(context);

    if (firebaseUser == null) {
      if (!(prevPageEvent is GoToSplashPage)) {
        prevPageEvent = GoToSplashPage();
        context.bloc<PageBloc>().add(prevPageEvent);
      }
    } else {
      if (!(prevPageEvent is GoToMainPage)) {
        context.bloc<UserBloc>().add(LoadUser(firebaseUser.uid));
        context.bloc<ReportBloc>().add(GetReport(firebaseUser.uid));
        context.bloc<ChartBloc>().add(GetBezierChart(firebaseUser.uid));

        prevPageEvent = GoToMainPage();
        context.bloc<PageBloc>().add(prevPageEvent);
      }
    }

    return BlocBuilder<PageBloc, PageState>(
      builder: (_, pageState) => (pageState is OnSplashPage)
          ? SplashPage()
          : (pageState is OnSignInPage)
              ? SignInPage()
              : (pageState is OnGetLocationPage)
                  ? GetLocationPage()
                  : (pageState is OnSignUpPage)
                      ? SignUpPage(pageState.registrationData)
                      : (pageState is OnConfrimAccountPage)
                          ? ConfirmAccountPage(pageState.registrationData)
                          : (pageState is OnGetProfilePicturePage)
                              ? GetProfilePicturePage(
                                  pageState.registrationData)
                              : (pageState is OnReportDetailPage)
                                  ? ReportDetailPage(pageState.report)
                                  : (pageState is OnMainPage)
                                      ? MainPage(
                                          bottomNavbarIndex:
                                              pageState.bottomNavBarIndex)
                                      : Container(),
    );
  }
}
