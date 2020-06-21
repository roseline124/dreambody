import 'package:flutter/material.dart';

import 'widgets/hexColor.dart';
// import './screens/homeScreen/homeScreen.dart';
import 'package:dreambody/graphqlClient.dart';
import './screens/questionScreen/questionOne.dart';

void main() {
  runApp(DreamBodyApp());
}

class DreamBodyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromRGBO(127, 102, 255, 1),
        accentColor: HexColor('#ffcc00'),
      ),
      title: 'Dream Body',
      initialRoute: '/',
      routes: {
        '/': (context) => GraphqlWidget(),
        '/questions': (context) => QuestionOne(),
      },
    );
  }
}
