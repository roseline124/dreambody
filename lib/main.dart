import 'package:flutter/material.dart';

// import './screens/questionScreen/questionOne.dart';
import 'package:dreambody/widgets/directSelectForm.dart';

void main() {
  runApp(DreamBodyApp());
}

class DreamBodyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dream Body',
      home: SelectForm(
        label: 'sdjfkljsdlf',
      ),
    );
  }
}
