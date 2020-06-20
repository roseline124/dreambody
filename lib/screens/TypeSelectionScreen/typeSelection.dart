import 'package:flutter/material.dart';

import 'package:dreambody/widgets/selectForm.dart';
import 'package:dreambody/widgets/button.dart';
import './typeButton.dart';
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
  int type = 0;

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
            isSelected: type == 0,
            onPressed: () => setState(() => type = 0)
          ),
          SizedBox(height: 5),
          TypeButton(
            label: '체중 유지',
            isSelected: type == 1,
            onPressed: () => setState(() => type = 1)
          ),
          SizedBox(height: 5),
          TypeButton(
            label: '근육 증진',
            isSelected: type == 2,
            onPressed: () => setState(() => type = 2)
          ),
          SizedBox(height: 137),
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
            ],
          )
        ],
      ),
    );
  }
}
