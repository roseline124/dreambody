import 'package:flutter/material.dart';

import 'package:direct_select_flutter/direct_select_container.dart';
import 'package:dreambody/widgets/button.dart';
import 'package:dreambody/widgets/selectForm.dart';
import './questionThree/questionThree.dart';

//bloc
import 'package:dreambody/blocs/userInfo/userInfoBloc.dart';
import 'package:dreambody/blocs/userInfo/BlocProvider.dart';
import 'package:dreambody/blocs/userInfo/states.dart';
import 'package:dreambody/blocs/userInfo/PrimitiveWrapper.dart';

class QuestionTwo extends StatefulWidget {
  QuestionTwo({Key key}) : super(key: key);

  @override
  _QuestionTwoState createState() => _QuestionTwoState();
}

class _QuestionTwoState extends State<QuestionTwo> {
  final List<int> weight = new List.generate(200, (index) => index + 1);
  final PrimitiveWrapper selectedValue = PrimitiveWrapper(59);
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final UserInfoBloc bloc = BlocProvider2.of(context);
    final UserInfoBloc userInfoBloc = BlocProvider2.of<UserInfoBloc>(context);
    
    return StreamBuilder(
        initialData: UserInfo(),
        stream: userInfoBloc.userInfoStream,
        builder: (BuildContext context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: Text('6개 중 2번째 질문'),
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
                              '귀하의 목표 체중은 얼마인가요?',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: Text(
                                  '귀하를 위한 맞춤형 계획을 만들고 하루 칼로리 목표를 계산하기 위해, 다음 질문에 답해주세요.'),
                            ),
                          ]),
                      SizedBox(height: 150),
                      Selector(
                        label: '목표 몸무게',
                        unit: '킬로그램',
                        data: weight,
                        defaultItemIndex: selectedValue.value,
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
                                  bloc.UpdateUserInfo('{"goalWeight":' + selectedValue.value.toString() + '}');
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
                ),
              ),
            ),
          );
        },
    );
  }
}
