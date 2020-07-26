import 'package:flutter/material.dart';
import 'package:dreambody/blocs/auth/authRepository.dart';
import 'package:dreambody/screens/signInScreen/signIn.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key, this.authRepository}) : super(key: key);
  final AuthRepository authRepository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo: Home Screen'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      SignInScreen(authRepository: authRepository)),
            );
          },
          child: Text('DreamBody Start'),
        ),
      ),
    );
  }
}
