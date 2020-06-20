import 'package:flutter/material.dart';

import 'widgets/HexColor.dart';
import './screens/homeScreen/homeScreen.dart';

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
      home: HomeScreen(),
    );
  }
}
