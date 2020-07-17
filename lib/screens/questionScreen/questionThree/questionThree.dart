import 'package:dreambody/bloc/BlocProvider.dart';
import 'package:dreambody/bloc/UserInfoBloc.dart';
import 'package:dreambody/bloc/models/models.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    final UserInfoBloc bloc = BlocProvider.of(context);
    final UserInfoBloc userInfoBloc = BlocProvider.of<UserInfoBloc>(context);

    return StreamBuilder(
        initialData: UserInfo(),
        stream: userInfoBloc.userInfoStream,
        builder: (BuildContext context, snapshot) {
          return QuestionLayout(
            questionText: '귀하의 성별은 무엇인가요?',
            nextQuestion: QuestionFour(),
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
                              isSelected: snapshot.data.gender == 0,
                            ),
                            onTap: () => bloc.UpdateUserInfo('{"gender": 0}')),
                        InkWell(
                            child: ImageButton(
                              src: 'static/images/femaleUser_128.png',
                              label: '여성',
                              isSelected: snapshot.data.gender == 1,
                            ),
                            onTap: () => bloc.UpdateUserInfo('{"gender": 1}')),
                      ]),
                )
              ],
              direction: Axis.vertical,
            ),
          );
        }
    );
  }
}
