import 'package:flutter/material.dart';
import 'package:dreambody/widgets/button.dart';

class QuestionSix extends StatelessWidget {
  const QuestionSix({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('6개 중 마지막 질문'),
        leading: BackButton(
            color: Colors.white, onPressed: () => Navigator.of(context).pop()),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: QuestionSixForm(),
      ),
    );
  }
}

class QuestionSixForm extends StatefulWidget {
  QuestionSixForm({Key key}) : super(key: key);

  @override
  _QuestionSixFormState createState() => _QuestionSixFormState();
}

// 주로 좌식 생활을 하는 사람: BMR x 1.2
// 약간 활동적인 사람 (주당 1일~3일 운동): BMR x 1.3
// 보통 (주당 3일~5일 이상 운동): BMR x 1.5
// 상당히 활동적인 사람 (매일 운동): BMR x 1.7
// 매우 활동적(운동선수와 비슷한 강도로 매일 운동): BMR x 1.9

class _QuestionSixFormState extends State<QuestionSixForm> {
  // BMR 가중치
  // final Map<int, String> activityAmount = {
  //   1: 'VeryInactive',
  //   2: 'Inactive',
  //   3: 'Normal',
  //   4: 'Active',
  //   5: 'VeryActive',
  // };

  // final Map<String, double> _bmrWeightByActivityAmount = {
  //   'VeryInactive': 1.2,
  //   'Inactive': 1.3,
  //   'Normal': 1.5,
  //   'Active': 1.7,
  //   'VeryActive': 1.9,
  // };

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
                      '평소에 얼마나 운동하고 계신가요?',
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
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 50.0),
                child: Text(''),
              )
            ],
            direction: Axis.vertical,
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
