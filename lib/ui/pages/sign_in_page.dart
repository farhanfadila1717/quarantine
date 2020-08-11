part of 'pages.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text("Sign In"),
          onPressed: () async {
            await AuthServices.signInWithEmail("qcoba12@gmail.com", "123456");
          },
        ),
      ),
    );
  }
}
