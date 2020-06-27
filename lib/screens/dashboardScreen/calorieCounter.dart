import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class CalorieCounter extends StatefulWidget {
  const CalorieCounter({
    this.current,
    this.goal,
  });

  final int current;
  final int goal;

  @override
  _CalorieCounterState createState() => _CalorieCounterState();
}

class _CalorieCounterState extends State<CalorieCounter> {
  @override
  Widget build(BuildContext context) {
    final double percent = (widget.current / widget.goal) * 100;
    final int remain = widget.goal - widget.current;

    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      width: 370.0,
      height: 230.0,
      child: Flex(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 50.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                      child: Text('${widget.current} 섭취량'),
                  ),
                  InkWell(
                      child: Text('${percent} 잔여칼로리 ${remain}'),
                  ),
                  InkWell(
                      child: Text('소비량'),
                  ),
                ]),
          )
        ],
        direction: Axis.vertical,
      ),
    );
  }
}
