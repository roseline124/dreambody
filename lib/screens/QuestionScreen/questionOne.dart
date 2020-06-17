import 'package:flutter/material.dart';
import 'package:dreambody/widgets/selectForm.dart';

class QuestionOne extends StatelessWidget {
  const QuestionOne({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('5개 중 첫번째 질문'),
        leading: BackButton(
            color: Colors.white, onPressed: () => Navigator.of(context).pop()),
      ),
      body: Container(padding: EdgeInsets.all(20), child: QuestionOneForm()),
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
                  '현재 체중은 얼마인가요?',
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
          SelectForm(
            label: '현재 몸무게',
            data: weight,
            defaultItemIndex: 60,
          ),
        ],
      ),
    );
  }
}
