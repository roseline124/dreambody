import 'package:flutter/material.dart';

//
import 'package:dreambody/bloc/BlocProvider.dart';
import 'package:dreambody/bloc/CounterBloc.dart';

import 'package:direct_select_flutter/direct_select_container.dart';
import 'package:dreambody/widgets/selectForm.dart';
import 'package:dreambody/widgets/button.dart';
import './questionTwo.dart';

import 'package:dreambody/bloc/models/models.dart';

class QuestionOne extends StatefulWidget {
  QuestionOne({Key key}) : super(key: key);

  @override
  _QuestionOneState createState() => _QuestionOneState();
}

class _QuestionOneState extends State<QuestionOne> {
  final List<int> weight = new List.generate(200, (index) => index + 1);

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {

    //
    final CounterBloc bloc = BlocProvider.of(context);
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
    //

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
                  ),
                  StreamBuilder(
            initialData: UserInfo(currentWeight_: 0),
            stream: counterBloc.counterStream,
            builder: (BuildContext context, snapshot) {
              return Center(
                child: Text(
                  "Clicked " + snapshot.data.currentWeight.toString() + " times!",
                  style: TextStyle(fontSize: 18),
                ),
              );
            },
          ),
                  SizedBox(height: 185),
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
        ),
        //
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            bloc.UpdateUserInfo('{"currentWeight": 3.0}');
          },
          tooltip: 'update',
          child: Icon(Icons.add),
        ));
        //
  }
}
