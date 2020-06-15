import 'package:flutter/material.dart';

// import './screens/questionScreen/questionOne.dart';
import 'package:dreambody/widgets/selectForm.dart';

void main() {
  runApp(DreamBodyApp());
}

class DreamBodyApp extends StatelessWidget {
  final List<dynamic> data = [1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dream Body',
      home: SelectForm(
        label: 'sdjfkljsdlf',
        data: data,
      ),
    );
  }
}
