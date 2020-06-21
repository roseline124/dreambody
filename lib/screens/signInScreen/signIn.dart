import 'package:flutter/material.dart';
// import 'package:dreambody/screens/typeSelectionScreen/typeSelection.dart';
import './googleSignInScreen.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('로그인'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flex(
              children: [Text('서비스를 이용하시려면 로그인이 필요합니다.')],
              direction: Axis.vertical,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Flex(
                          direction: Axis.vertical,
                          children: [Expanded(child: GoogleSignInScreen())])),
                );
              },
              child: Text('Google Login'),
            ),
          ],
        ),
      ),
    );
  }
}
