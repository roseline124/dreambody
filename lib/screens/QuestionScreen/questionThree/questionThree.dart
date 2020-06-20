import 'package:flutter/material.dart';

import '../questionFour.dart';
import 'package:dreambody/widgets/button.dart';
import './imageButton.dart';

class QuestionThree extends StatelessWidget {
  const QuestionThree({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('5개 중 3번째 질문'),
        leading: BackButton(
            color: Colors.white, onPressed: () => Navigator.of(context).pop()),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: QuestionThreeForm(),
      ),
    );
  }
}

class QuestionThreeForm extends StatefulWidget {
  QuestionThreeForm({Key key}) : super(key: key);

  @override
  _QuestionThreeFormState createState() => _QuestionThreeFormState();
}

class _QuestionThreeFormState extends State<QuestionThreeForm> {
  String gender; // F or M

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
                      '귀하의 성별은 무엇인가요?',
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
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                          child: ImageButton(
                            src: 'static/images/maleUser_128.png',
                            label: '남성',
                            isSelected: gender == 'M',
                          ),
                          onTap: () => setState(() => gender = 'M')),
                      InkWell(
                          child: ImageButton(
                            src: 'static/images/femaleUser_128.png',
                            label: '여성',
                            isSelected: gender == 'F',
                          ),
                          onTap: () => setState(() => gender = 'F')),
                    ]),
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
