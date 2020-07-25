import 'package:flutter/material.dart';
import './nutrientsCounter.dart';
import 'calorieCounter.dart';

class PerDayDashboard extends StatefulWidget {
  const PerDayDashboard({Key key}) : super(key: key);

  @override
  _PerDayDashboardState createState() => _PerDayDashboardState();
}

class _PerDayDashboardState extends State<PerDayDashboard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        child: Container(
          child: Column(
            children: <Widget>[
              CalorieCounter(current: 500, goal: 2280, consume: 300),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                NutrientsCounter(title: '탄수화물', current: 1, goal: 3),
                NutrientsCounter(title: '단백질', current: 3, goal: 5),
                NutrientsCounter(title: '지방', current: 0, goal: 3),
              ]),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(100),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          width: 370.0,
          height: 260.0,
        ),
      ),
    );
  }
}
