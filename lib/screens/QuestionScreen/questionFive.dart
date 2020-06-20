import 'package:flutter/material.dart';

import 'package:dreambody/widgets/button.dart';
import 'package:dreambody/widgets/datePicker.dart';
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
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '귀하의 생일은 언제인가요?',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text(
                          '귀하를 위한 맞춤형 계획을 만들고 하루 칼로리 목표를 계산하기 위해, 다음 질문에 답해주세요.'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flex(
            direction: Axis.vertical,
            children: [
              Container(height: 400, child: DatePicker()),
            ],
          ),
          Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                flex: 1,
                child: Button(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => QuestionSix()),
                      );
                    },
                    label: '다음'),
              )
            ],
          )
        ],
      ),
    );
  }
}
