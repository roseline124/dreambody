import 'package:flutter/material.dart';

import 'package:direct_select_flutter/direct_select_container.dart';
import 'package:dreambody/widgets/selectForm.dart';
import 'package:dreambody/widgets/button.dart';
import './questionTwo.dart';

//bloc
import 'package:dreambody/blocs/userInfo/userInfoBloc.dart';
import 'package:dreambody/blocs/userInfo/BlocProvider.dart';
import 'package:dreambody/blocs/userInfo/states.dart';
import 'package:dreambody/blocs/userInfo/PrimitiveWrapper.dart';


class QuestionOne extends StatefulWidget {
  QuestionOne({Key key}) : super(key: key);

  @override
  _QuestionOneState createState() => _QuestionOneState();
}

class _QuestionOneState extends State<QuestionOne> {
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
            title: Text('6개 중 1번째 질문'),
            leading: BackButton(
              color: Colors.white,
              onPressed: () => Navigator.of(context).pop()
            ),
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
                              bloc.UpdateUserInfo('{"currentWeight":' + selectedValue.value.toString() + '}');
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
          )
        );
      }
    );
  }
}
