import 'package:flutter/material.dart';
import './mealCard.dart';
import 'mealSearchForm.dart';

class MealDashBoard extends StatelessWidget {
  MealDashBoard({this.token});
  final String token;

  @override
  Widget build(BuildContext context) {
    final onPressed = () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MealSearchForm(token: token)));
    };

    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(100),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      child: Column(children: [
        MealCard(title: '아침', onPressedSearchButton: onPressed),
        MealCard(title: '점심', onPressedSearchButton: onPressed),
        MealCard(title: '저녁', onPressedSearchButton: onPressed),
        MealCard(
          title: '간식',
          isLastTile: true,
          onPressedSearchButton: onPressed,
        ),
      ]),
    );
  }
}
