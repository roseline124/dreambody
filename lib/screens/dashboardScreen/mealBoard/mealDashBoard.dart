import 'package:flutter/material.dart';

import '../dashBoardScreen.dart';
import './mealCard.dart';
import './types.dart';

class MealDashBoard extends StatefulWidget {
  MealDashBoard({@required this.token, @required this.dashboard});

  final DashBoardScreenState dashboard;
  final String token;

  @override
  _MealDashBoardState createState() => _MealDashBoardState();
}

class _MealDashBoardState extends State<MealDashBoard> {
  int calorieSum = 0;
  int fatSum = 0;
  int proteinSum = 0;
  int carbohydrateSum = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(100),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      child: Column(children: [
        MealCard(
          title: '아침',
          token: widget.token,
          dashboard: widget.dashboard,
          mealType: MealType.breakfast,
        ),
        MealCard(
          title: '점심',
          token: widget.token,
          dashboard: widget.dashboard,
          mealType: MealType.lunch,
        ),
        MealCard(
          title: '저녁',
          token: widget.token,
          dashboard: widget.dashboard,
          mealType: MealType.dinner,
        ),
        MealCard(
          title: '간식',
          token: widget.token,
          dashboard: widget.dashboard,
          mealType: MealType.dessert,
          isLastTile: true,
        ),
      ]),
    );
  }
}