import 'package:flutter/material.dart';
import 'package:dreambody/widgets/datePicker.dart';

import 'questionLayout.dart';
import './questionSix.dart';

class QuestionFive extends StatelessWidget {
  const QuestionFive({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('6개 중 5번째 질문'),
        leading: BackButton(
            color: Colors.white, onPressed: () => Navigator.of(context).pop()),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: QuestionFiveForm(),
      ),
    );
  }
}

class QuestionFiveForm extends StatefulWidget {
  QuestionFiveForm({Key key}) : super(key: key);

  @override
  _QuestionFiveFormState createState() => _QuestionFiveFormState();
}

class _QuestionFiveFormState extends State<QuestionFiveForm> {
  @override
  Widget build(BuildContext context) {
    return QuestionLayout(
      questionText: '귀하의 성별은 무엇인가요?',
      nextQuestion: QuestionSix(),
      formWidget: Flex(
        direction: Axis.vertical,
        children: [
          Container(height: 400, child: DatePicker()),
        ],
      ),
    );
  }
}
