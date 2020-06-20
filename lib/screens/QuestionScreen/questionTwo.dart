import 'package:flutter/material.dart';

import 'package:dreambody/widgets/selectForm.dart';
import 'package:dreambody/widgets/button.dart';
import './questionThree/questionThree.dart';

class QuestionTwo extends StatelessWidget {
  const QuestionTwo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('5개 중 2번째 질문'),
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
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                child: Text(
                  '귀하의 목표 체중은 얼마인가요?',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          Flex(
            children: [
              Text('귀하를 위한 맞춤형 계획을 만들고 하루 칼로리 목표를 계산하기 위해, 다음 질문에 답해주세요.')
            ],
            direction: Axis.vertical,
          ),
          SizedBox(height: 100),
          SelectForm(
            label: '목표 몸무게',
            unit: '킬로그램',
            data: weight,
            defaultItemIndex: 59,
          ),
          SizedBox(height: 50),
          Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                flex: 1,
                child: Button(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QuestionThree()),
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
