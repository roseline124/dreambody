import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    void showMessage(String msg) {
      final snackbar = SnackBar(content: Text(msg));

      Scaffold.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(snackbar);
    }

    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                child: Text(
                  '귀하의 성별은 무엇인가요?',
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
              Text('귀하를 위한 맞춤형 계획을 만들고 하루 칼로리 목표를 계산하기 위해, 다음 질문에 답해주세요.'),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 70.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                          child: ImageButton(
                            src: 'static/images/maleUser_128.png',
                            label: '남성',
                            isSelected: true,
                          ),
                          onTap: () => showMessage('남성')),
                      InkWell(
                          child: ImageButton(
                            src: 'static/images/femaleUser_128.png',
                            label: '여성',
                            isSelected: false,
                          ),
                          onTap: () => showMessage('여성')),
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
