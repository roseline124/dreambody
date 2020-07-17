import 'package:dreambody/bloc/BlocProvider.dart';
import 'package:dreambody/bloc/UserInfoBloc.dart';
import 'package:flutter/material.dart';

import 'package:dreambody/screens/signInScreen/signIn.dart';

//import 'package:dreambody/bloc/models/models.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo: Home Screen'),
      ),
      body: Center(
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
  }
}