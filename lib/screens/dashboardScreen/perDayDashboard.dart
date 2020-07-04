import 'package:flutter/material.dart';
import './nutrientsCounter.dart';
import './calorieCounter.dart';

class PerDayDashboard extends StatefulWidget {
  const PerDayDashboard({Key key}) : super(key: key);

  @override
  _PerDayDashboardState createState() => _PerDayDashboardState();
}

class _PerDayDashboardState extends State<PerDayDashboard> {
  int glassesOfWater = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 50),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        CalorieCounter(current: 500, goal:2280, consume: 300),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            NutrientsCounter(title: '탄수화물', current: 1, goal: 3,),
                            NutrientsCounter(title: '단백질', current: 3, goal: 5),
                            NutrientsCounter(title: '지방', current: 0, goal: 3),
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
