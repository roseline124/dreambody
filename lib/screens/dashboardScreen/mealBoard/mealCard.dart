import 'package:flutter/material.dart';

class MealCard extends StatelessWidget {
  const MealCard(
      {@required this.title,
      this.onPressedSearchButton,
      this.calorie = 0,
      this.isLastTile = false});
  final String title;
  final int calorie;
  final bool isLastTile;
  final void Function() onPressedSearchButton;

  @override
  Widget build(BuildContext context) {
    final Widget mealTile = ListTile(
      title: Text(
        title,
        style: TextStyle(
            color: Theme.of(context).primaryColorDark,
            fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        '섭취 칼로리: $calorie',
        style: TextStyle(color: Colors.white.withAlpha(150)),
      ),
      trailing: IconButton(
        onPressed: onPressedSearchButton,
        icon: Icon(
          Icons.add,
          color: Theme.of(context).primaryColor,
          size: 30.0,
        ),
      ),
    );

    if (!isLastTile) {
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
