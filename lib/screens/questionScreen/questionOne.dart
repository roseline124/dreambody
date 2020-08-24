import 'package:dreambody/blocs/info/events.dart';
import 'package:dreambody/blocs/info/infoBloc.dart';
import 'package:flutter/material.dart';

import 'package:direct_select_flutter/direct_select_container.dart';
import 'package:dreambody/widgets/selectForm.dart';
import 'package:dreambody/widgets/button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dreambody/models/PrimitiveWrapper.dart';
import './questionTwo.dart';

class QuestionOne extends StatefulWidget {
  QuestionOne({Key key}) : super(key: key);

  @override
  _QuestionOneState createState() => _QuestionOneState();
}

class _QuestionOneState extends State<QuestionOne> {
  final List<int> weight = new List.generate(200, (index) => index + 1);

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  PrimitiveWrapper selectedValue;
  InformationBloc _infoBloc;
  void initState(){
    super.initState();
    _infoBloc = BlocProvider.of<InformationBloc>(context);
    if(selectedValue == null){
      selectedValue = PrimitiveWrapper(59);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('6개 중 1번째 질문'),
          leading: BackButton(
              color: Colors.white,
              onPressed: () => Navigator.of(context).pop()),
        ),
        key: scaffoldKey,
        body: DirectSelectContainer(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                verticalDirection: VerticalDirection.down,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '현재 체중은 얼마인가요?',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text('추정치도 괜찮습니다. 시작 체중은 나중에 언제든 변경할 수 있습니다.'),
                        ),
                      ]),
                  SizedBox(height: 150),
                  Selector(
                    label: '현재 몸무게',
                    unit: '킬로그램',
                    data: weight,
                    defaultItemIndex: 59,
                    selectedValue: selectedValue,
                  ),
                  SizedBox(height: 185),
                  Flex(
                    direction: Axis.horizontal,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Button(
                            onPressed: () {
                              _infoBloc.add(InformationOne(currentWeight: selectedValue.value));
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => QuestionTwo()),
                              );
                            },
                            label: '다음'),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
