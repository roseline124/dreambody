import 'package:flutter/material.dart';
import 'package:dreambody/widgets/button.dart';

class QuestionLayout extends StatelessWidget {
  const QuestionLayout(
      {this.questionText,
      this.nextQuestion,
      this.formWidget,
      this.questionGuide =
          '귀하를 위한 맞춤형 계획을 만들고 하루 칼로리 목표를 계산하기 위해, 다음 질문에 답해주세요.'});

  final String questionText;
  final String questionGuide;
  final Widget formWidget;
  final Widget nextQuestion;

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
                      questionText,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text(questionGuide),
                    ),
                  ],
                ),
              ),
            ),
          ),
          formWidget,
          Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                flex: 1,
                child: Button(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => nextQuestion),
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
