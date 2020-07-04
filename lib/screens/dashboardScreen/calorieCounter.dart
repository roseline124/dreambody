import 'package:flutter/material.dart';

import '../../widgets/pie_chart.dart';

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
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      width: 370.0,
      height: 230.0,
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 30),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                                children: <Widget>[
                                  Text(
                                    '${widget.current}',
                                    style: TextStyle(fontSize: 20.0, color: Colors.white)
                                  ),
                                  SizedBox(height: 5),
                                  Text('섭취량'),
                                ],
                              ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                              ),
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
                                Text(
                                  '${widget.consume}',
                                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                                ),
                                SizedBox(height: 5),
                                Text('소비량'),
                              ],
                            ),
                          ]),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    width: 370.0,
                    height: 300.0,
                ),
            ),
        ),
    );
  }
}
