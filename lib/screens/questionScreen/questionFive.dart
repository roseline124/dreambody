import 'package:dreambody/blocs/info/events.dart';
import 'package:dreambody/blocs/info/infoBloc.dart';
import 'package:dreambody/models/StringWrapper.dart';
import 'package:flutter/material.dart';
import 'package:dreambody/widgets/datePicker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'questionLayout.dart';
import './questionSix.dart';

class QuestionFive extends StatelessWidget {
  const QuestionFive({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('6개 중 5번째 질문'),
        leading: BackButton(
            color: Colors.white, onPressed: () => Navigator.of(context).pop()),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: QuestionFiveForm(),
      ),
    );
  }
}

class QuestionFiveForm extends StatefulWidget {
  QuestionFiveForm({Key key}) : super(key: key);

  @override
  _QuestionFiveFormState createState() => _QuestionFiveFormState();
}

class _QuestionFiveFormState extends State<QuestionFiveForm> {
  StringWrapper selectedValue;
  InformationBloc _infoBloc;
  void initState(){
    super.initState();
    selectedValue = StringWrapper("");
    _infoBloc = BlocProvider.of<InformationBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return QuestionLayout(
      questionText: '귀하의 성별은 무엇인가요?',
      nextQuestion: QuestionSix(),
      trigger: () => {
        _infoBloc.add(InformationFive(dateOfBirth: selectedValue.value)),
      },
      formWidget: Flex(
        direction: Axis.vertical,
        children: [
          Container(height: 400, child: DatePicker(selectedValue: selectedValue)),
        ],
      ),
    );
  }
}
