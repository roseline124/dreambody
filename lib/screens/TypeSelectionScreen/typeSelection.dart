import 'package:flutter/material.dart';

import 'package:dreambody/widgets/selectForm.dart';
import 'package:dreambody/widgets/button.dart';
import '../QuestionScreen/questionOne.dart';

class TypeSelection extends StatelessWidget {
  const TypeSelection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('체중 목표 설정'),
        leading: BackButton(
            color: Colors.white, onPressed: () => Navigator.of(context).pop()),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: QuestionOneForm(),
      ),
    );
  }
}

class QuestionOneForm extends StatefulWidget {
  QuestionOneForm({Key key}) : super(key: key);

  @override
  _QuestionOneFormState createState() => _QuestionOneFormState();
}

class _QuestionOneFormState extends State<QuestionOneForm> {
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
                  '현재체중',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          Flex(
            children: [Text('추정치도 괜찮습니다. 시작 체중은 나중에 언제든 변경할 수 있습니다.')],
            direction: Axis.vertical,
          ),
          SizedBox(height: 100),
          SelectForm(
            label: '현재 몸무게',
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
                        MaterialPageRoute(builder: (context) => QuestionOne()),
                      );
                    },
                    label: '다음'),
              ),
              Expanded(
                flex: 1,
                child: Button(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => QuestionOne()),
                      );
                    },
                    label: '다음'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
