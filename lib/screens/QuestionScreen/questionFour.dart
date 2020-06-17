import 'package:flutter/material.dart';
import 'package:dreambody/widgets/selectForm.dart';
import 'package:dreambody/widgets/button.dart';

class QuestionFour extends StatelessWidget {
  const QuestionFour({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('5개 중 4번째 질문'),
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
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                child: Text(
                  '귀하의 키는 얼마인가요?',
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
            label: '현재 키',
            unit: '센티미터',
            data: weight,
            defaultItemIndex: 175,
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
                        MaterialPageRoute(builder: (context) => QuestionFour()),
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
