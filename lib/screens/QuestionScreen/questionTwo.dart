import 'package:flutter/material.dart';

import 'questionLayout.dart';
import 'package:dreambody/widgets/selectForm.dart';
import './questionThree/questionThree.dart';

class QuestionTwo extends StatelessWidget {
  const QuestionTwo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('6개 중 2번째 질문'),
        leading: BackButton(
            color: Colors.white, onPressed: () => Navigator.of(context).pop()),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: QuestionTwoForm(),
      ),
    );
  }
}

class QuestionTwoForm extends StatefulWidget {
  QuestionTwoForm({Key key}) : super(key: key);

  @override
  _QuestionTwoFormState createState() => _QuestionTwoFormState();
}

class _QuestionTwoFormState extends State<QuestionTwoForm> {
  final List<int> weight = new List.generate(200, (index) => index + 1);

  @override
  Widget build(BuildContext context) {
    return QuestionLayout(
        questionText: '귀하의 목표 체중은 얼마인가요?',
        nextQuestion: QuestionThree(),
        formWidget: SelectForm(
          label: '목표 몸무게',
          unit: '킬로그램',
          data: weight,
          defaultItemIndex: 69,
        ));
  }
}
