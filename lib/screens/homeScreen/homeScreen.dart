import 'package:flutter/material.dart';

import 'package:dreambody/screens/questionScreen/questionOne.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

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
              MaterialPageRoute(builder: (context) => QuestionOne()),
            );
          },
          child: Text('DreamBody Start'),
        ),
      ),
    );
  }
}