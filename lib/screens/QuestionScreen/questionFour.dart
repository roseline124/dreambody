import 'package:flutter/material.dart';

import 'questionLayout.dart';
import './questionFive.dart';
import 'package:dreambody/widgets/selectForm.dart';

class QuestionFour extends StatelessWidget {
  const QuestionFour({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('6개 중 4번째 질문'),
        leading: BackButton(
            color: Colors.white, onPressed: () => Navigator.of(context).pop()),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: QuestionFourForm(),
      ),
    );
  }
}

class QuestionFourForm extends StatefulWidget {
  QuestionFourForm({Key key}) : super(key: key);

  @override
  _QuestionFourFormState createState() => _QuestionFourFormState();
}

class _QuestionFourFormState extends State<QuestionFourForm> {
  final List<int> weight = new List.generate(250, (index) => index + 1);

  @override
  Widget build(BuildContext context) {
    return QuestionLayout(
        questionText: '귀하의 키는 얼마인가요?',
        nextQuestion: QuestionFive(),
        formWidget: SelectForm(
          label: '현재 키',
          unit: '센티미터',
          data: weight,
          defaultItemIndex: 169,
        ));
  }
}
