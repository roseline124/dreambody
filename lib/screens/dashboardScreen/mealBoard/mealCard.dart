import 'package:flutter/material.dart';
import 'mealSearchForm.dart';

class MealCard extends StatefulWidget {
  const MealCard({
    @required this.title,
    @required this.token,
    this.subtitle,
    this.mealType,
    this.isLastTile = false,
  });
  final String token;
  final String title;
  final String subtitle;
  final bool isLastTile;
  final MealType mealType;

  @override
  MealCardState createState() => MealCardState();
}

class MealCardState extends State<MealCard> {
  MealType mealType;
  int calorieSum = 0;
  int fatSum = 0;
  int proteinSum = 0;
  int carbohydrateSum = 0;

  updateMealInfo({@required FoodSum foodSum}) {
    setState(() {
      calorieSum = foodSum.calorie.toInt();
      fatSum = foodSum.fat.toInt();
      proteinSum = foodSum.protein.toInt();
      carbohydrateSum = foodSum.carbohydrate.toInt();
    });
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
                  builder: (context) => MealSearchForm(
                      parent: this,
                      token: widget.token,
                      mealType: widget.mealType)));
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
