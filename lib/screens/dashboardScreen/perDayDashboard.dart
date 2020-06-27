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
                        CalorieCounter(current: 500, goal: 1300),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                                child: NutrientsCounter(title: '탄수화물', current: 3, goal: 3,),
                            ),
                            InkWell(
                                child: NutrientsCounter(title: '단백질', current: 5, goal: 5),
                            ),
                            InkWell(
                                child: NutrientsCounter(title: '지방', current: 3, goal: 3),
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
