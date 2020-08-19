import 'package:flutter/material.dart';

import '../dashBoardScreen.dart';
import './mealSearchForm.dart';
import './types.dart';

class MealCard extends StatefulWidget {
  const MealCard({
    @required this.title,
    @required this.token,
    @required this.mealType,
    @required this.dashboard,
    this.isLastTile = false,
  });
  final MealType mealType;
  final DashBoardScreenState dashboard;
  final String token;
  final String title;
  final bool isLastTile;

  @override
  MealCardState createState() => MealCardState();
}

class MealCardState extends State<MealCard> {
  int calorieSum = 0;
  int fatSum = 0;
  int proteinSum = 0;
  int carbohydrateSum = 0;

  updateMealInfo({@required FoodSum foodSum}) {
    if (mounted) {
      setState(() {
        calorieSum = foodSum.calorie.toInt();
        fatSum = foodSum.fat.toInt();
        proteinSum = foodSum.protein.toInt();
        carbohydrateSum = foodSum.carbohydrate.toInt();
      });
    }

    widget.dashboard
        .updateMealIntakes(mealType: widget.mealType, foodSum: foodSum);
  }

  @override
  Widget build(BuildContext context) {
    final Widget mealTile = ListTile(
      title: Text(
        '${widget.title} (칼로리: $calorieSum)',
        style: TextStyle(
            color: Theme.of(context).primaryColorDark,
            fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        '탄수화물: $carbohydrateSum / 단백질: $proteinSum / 지방: $fatSum',
        style: TextStyle(color: Colors.white.withAlpha(150)),
      ),
      trailing: IconButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      MealSearchForm(parent: this, token: widget.token)));
        },
        icon: Icon(
          Icons.add,
          color: Theme.of(context).primaryColor,
          size: 30.0,
        ),
      ),
    );

    if (!widget.isLastTile) {
      return Column(children: [
        mealTile,
        Divider(
            color: Colors.white.withAlpha(100),
            thickness: 0.4,
            indent: 15,
            endIndent: 15)
      ]);
    }

    return mealTile;
  }
}
