import 'package:flutter/material.dart';

import 'questionLayout.dart';
import 'package:dreambody/screens/dashboardScreen/waterDashBoard/waterDashboard.dart';

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
    return QuestionLayout(
      questionText: '평소에 얼마나 운동하고 계신가요?',
      nextQuestion: WaterDashboard(),
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
                  });
                },
              ),
            ),
          )
        ],
        direction: Axis.vertical,
      ),
    );
  }
}
