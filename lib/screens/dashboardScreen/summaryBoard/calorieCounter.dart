import 'package:flutter/material.dart';

import 'package:dreambody/widgets/pie_chart.dart';
import 'package:dreambody/theme/colors.dart';

class CalorieCounter extends StatefulWidget {
  const CalorieCounter({
    this.current,
    this.goal,
    this.consume,
  });

  final int current;
  final int goal;
  final int consume;

  @override
  _CalorieCounterState createState() => _CalorieCounterState();
}

class _CalorieCounterState extends State<CalorieCounter> {
  @override
  Widget build(BuildContext context) {
    final int percent = ((widget.current / widget.goal) * 100).round();
    final int remain = widget.goal - widget.current;

    return Container(
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Container(
            child: Column(
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: <Widget>[
                          Text('${widget.current}',
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white)),
                          SizedBox(height: 5),
                          Text('섭취량',
                              style: TextStyle(
                                  color: customColor.primaryDarkColor)),
                        ],
                      ),
                      Container(
                        width: 150.0,
                        height: 150.0,
                        child: CustomPaint(
                          size: Size(150, 150),
                          painter: PieChart(
                            percentage: percent,
                            remain: remain,
                          ),
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          Text('${widget.consume}',
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white)),
                          SizedBox(height: 5),
                          Text('소비량',
                              style: TextStyle(
                                  color: customColor.primaryDarkColor)),
                        ],
                      ),
                    ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
