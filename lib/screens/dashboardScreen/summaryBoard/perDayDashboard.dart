import 'package:flutter/material.dart';
import './nutrientsCounter.dart';
import 'calorieCounter.dart';
import '../mealBoard/types.dart';

class PerDayDashboard extends StatefulWidget {
  const PerDayDashboard({@required this.intakes});
  final FoodSum intakes;

  @override
  _PerDayDashboardState createState() => _PerDayDashboardState();
}

class _PerDayDashboardState extends State<PerDayDashboard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(top: 30),
        child: Container(
          child: Column(
            children: <Widget>[
              CalorieCounter(
                  current: widget.intakes.calorie.toInt(),
                  goal: 2280,
                  consume: 300),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                NutrientsCounter(
                    title: '탄수화물',
                    current: widget.intakes.carbohydrate?.toInt(),
                    goal: 100),
                NutrientsCounter(
                    title: '단백질',
                    current: widget.intakes.protein?.toInt(),
                    goal: 100),
                NutrientsCounter(
                    title: '지방',
                    current: widget.intakes.fat?.toInt(),
                    goal: 100),
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
