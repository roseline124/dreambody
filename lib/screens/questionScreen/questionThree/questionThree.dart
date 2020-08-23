import 'package:dreambody/blocs/info/events.dart';
import 'package:dreambody/blocs/info/infoBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../questionFour.dart';
import './imageButton.dart';
import '../questionLayout.dart';

class QuestionThree extends StatelessWidget {
  const QuestionThree({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('6개 중 3번째 질문'),
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
  
  InformationBloc _infoBloc;
  void initState(){
    super.initState();
    _infoBloc = BlocProvider.of<InformationBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return QuestionLayout(
      questionText: '귀하의 성별은 무엇인가요?',
      nextQuestion: QuestionFour(),
      trigger: () => _infoBloc.add(InformationThree(genderType: gender)),
      formWidget: Flex(
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
                        isSelected: gender == 'MALE',
                      ),
                      onTap: () => setState(() => gender = 'MALE')),
                  InkWell(
                      child: ImageButton(
                        src: 'static/images/femaleUser_128.png',
                        label: '여성',
                        isSelected: gender == 'FEMALE',
                      ),
                      onTap: () => setState(() => gender = 'FEMALE')),
                ]),
          )
        ],
        direction: Axis.vertical,
      ),
    );
  }
}
