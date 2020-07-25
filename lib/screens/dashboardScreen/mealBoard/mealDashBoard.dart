import 'package:flutter/material.dart';
import './mealCard.dart';
import 'mealSearchForm.dart';

class MealDashBoard extends StatefulWidget {
  MealDashBoard({this.token});
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
            subtitle: '',
            token: widget.token,
            mealType: MealType.breakfast),
        MealCard(
            title: '점심',
            subtitle: '',
            token: widget.token,
            mealType: MealType.lunch),
        MealCard(
            title: '저녁',
            subtitle: '',
            token: widget.token,
            mealType: MealType.dinner),
        MealCard(
            title: '간식',
            subtitle: '',
            token: widget.token,
            isLastTile: true,
            mealType: MealType.dessert),
      ]),
    );
  }
}
