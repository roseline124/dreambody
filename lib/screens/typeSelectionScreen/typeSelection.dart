import 'package:dreambody/blocs/info/events.dart';
import 'package:dreambody/blocs/info/infoBloc.dart';
import 'package:flutter/material.dart';

import 'package:dreambody/widgets/button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './typeButton.dart';
import '../QuestionScreen/questionOne.dart';

class TypeSelection extends StatelessWidget {
  const TypeSelection({
    Key key
  }) : super(key: key);

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
        child: TypeSelectionForm(),
      ),
    );
  }
}

class TypeSelectionForm extends StatefulWidget {
  TypeSelectionForm({Key key}) : super(key: key);
  

  @override
  _TypeSelectionFormState createState() => _TypeSelectionFormState();
}

class _TypeSelectionFormState extends State<TypeSelectionForm> {
  String type = 'WEIGHT_LOSS';
  InformationBloc _infoBloc;
  void initState(){
    super.initState();
    _infoBloc = _infoBloc = BlocProvider.of<InformationBloc>(context);
  }
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
                  '체중 목표를 설정하세요.',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          Flex(
            children: [Text('목표에 따라서 다른 기준을 제공합니다.')],
            direction: Axis.horizontal,
          ),
          SizedBox(height: 145),
          TypeButton(
            label: '체중 감량',
            isSelected: type == 'WEIGHT_LOSS',
            onPressed: () => setState(() => type = 'WEIGHT_LOSS')
          ),
          SizedBox(height: 5),
          TypeButton(
            label: '체중 유지',
            isSelected: type == 'WEIGHT_RETENTION',
            onPressed: () => setState(() => type = 'WEIGHT_RETENTION')
          ),
          SizedBox(height: 5),
          TypeButton(
            label: '근육 증진',
            isSelected: type == 'WEIGHT_GAIN',
            onPressed: () => setState(() => type = 'WEIGHT_GAIN')
          ),
          SizedBox(height: 137),
          Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                flex: 1,
                child: Button(
                    onPressed: () {
                      _infoBloc.add(InformationType(goalType: type));
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
