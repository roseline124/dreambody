import 'package:dreambody/blocs/intakeInfo/BlocProvider.dart';
import 'package:dreambody/blocs/intakeInfo/intakeInfoBloc.dart';
import 'package:dreambody/blocs/userInfo/BlocProvider.dart';
import 'package:dreambody/blocs/userInfo/states.dart';
import 'package:dreambody/blocs/userInfo/userInfoBloc.dart';
import 'package:dreambody/screens/dashboardScreen/perDayDashboard.dart';
import 'package:flutter/material.dart';

import 'questionLayout.dart';
import 'package:dreambody/screens/dashboardScreen/waterDashboard.dart';
import 'package:dreambody/screens/dashboardScreen/perDayDashboard.dart';

class QuestionSix extends StatelessWidget {
  const QuestionSix({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('6개 중 마지막 질문'),
        leading: BackButton(
            color: Colors.white, onPressed: () => Navigator.of(context).pop()),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: QuestionSixForm(),
      ),
    );
  }
}

class QuestionSixForm extends StatefulWidget {
  QuestionSixForm({Key key}) : super(key: key);

  @override
  _QuestionSixFormState createState() => _QuestionSixFormState();
}

class _QuestionSixFormState extends State<QuestionSixForm> {
  // 주로 좌식 생활을 하는 사람: BMR x 1.2
  // 약간 활동적인 사람 (주당 1일~3일 운동): BMR x 1.3
  // 보통 (주당 3일~5일 이상 운동): BMR x 1.5
  // 상당히 활동적인 사람 (매일 운동): BMR x 1.7
  // 매우 활동적(운동선수와 비슷한 강도로 매일 운동): BMR x 1.9
  final Map<double, String> sliderLabel = {
    0.0: '주 0회 운동',
    1.0: '주 1~3회 운동',
    2.0: '주 3~5회 운동',
    3.0: '매일 운동',
    4.0: '운동선수와 비슷한 강도로 매일 운동',
  };

  double _value;

  @override
  void initState() {
    super.initState();
    _value = 2;
  }

  @override
  Widget build(BuildContext context) {
    final UserInfoBloc bloc = BlocProvider2.of(context);
    final UserInfoBloc userInfoBloc = BlocProvider2.of<UserInfoBloc>(context);

    return StreamBuilder(
        initialData: UserInfo(),
        stream: userInfoBloc.userInfoStream,
        builder: (BuildContext context, snapshot) {
          return QuestionLayout(
            questionText: '평소에 얼마나 운동하고 계신가요?',
            nextQuestion: BlocProvider3(
              bloc: IntakeInfoBloc(),
              child: PerDayDashboard(),//WaterDashboard(),
            ),
            formWidget: Flex(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 50.0),
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.yellow[700],
                      inactiveTrackColor: Colors.amber[100],
                      trackShape: RectangularSliderTrackShape(),
                      trackHeight: 4.0,
                      thumbColor: Theme.of(context).accentColor,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                      overlayColor: Colors.amber.withAlpha(32),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                      // track
                      tickMarkShape: RoundSliderTickMarkShape(),
                      activeTickMarkColor: Colors.yellow[700],
                      inactiveTickMarkColor: Colors.amber[100],
                      valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                      valueIndicatorColor: Theme.of(context).accentColor,
                      valueIndicatorTextStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    child: Slider(
                      min: 0,
                      max: 4,
                      divisions: 4,
                      label: '${sliderLabel[_value]}',
                      value: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                          bloc.UpdateUserInfo('{"activity":'+ _value.toInt().toString() +'}');
                          print(
                            "P: " + snapshot.data.currentWeight.toString() +
                            "P: " + snapshot.data.goalWeight.toString() +
                            "P: " + snapshot.data.goal.toString() +
                            "P: " + snapshot.data.gender.toString() +
                            "P: " + snapshot.data.dateOfBirth.toString() +
                            "P: " + snapshot.data.activity.toString()
                          );
                        });
                        // TODO: add mutation
                      },
                    ),
                  ),
                )
              ],
              direction: Axis.vertical,
            ),
          );
        }
    );
  }
}
