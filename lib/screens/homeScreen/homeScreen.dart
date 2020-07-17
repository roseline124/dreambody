import 'package:dreambody/bloc/BlocProvider.dart';
import 'package:dreambody/bloc/UserInfoBloc.dart';
import 'package:flutter/material.dart';
import 'package:dreambody/blocs/auth/authRepository.dart';

import 'package:dreambody/screens/signInScreen/signIn.dart';

//import 'package:dreambody/bloc/models/models.dart';

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
<<<<<<< HEAD
        child:
          RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignInScreen()),
              );
            },
            child: Text('DreamBody Start'),
          ),
        )
      );
=======
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
>>>>>>> 527cd0169a16eb590a6652b606af009cfb20a07c
  }
}