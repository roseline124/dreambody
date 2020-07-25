import 'package:flutter/material.dart';
import 'mealSearchForm.dart';

class MealDashBoard extends StatelessWidget {
  MealDashBoard({Key key, this.token});
  final String token;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(100),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      child: Text('sdf'),
    );
  }
}
