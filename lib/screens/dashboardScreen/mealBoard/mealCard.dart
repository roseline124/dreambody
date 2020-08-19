import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

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
        calorieSum = foodSum?.calorie?.toInt();
        fatSum = foodSum?.fat?.toInt();
        proteinSum = foodSum?.protein?.toInt();
        carbohydrateSum = foodSum?.carbohydrate?.toInt();
      });
    }

    widget.dashboard
        .updateMealIntakes(mealType: widget.mealType, foodSum: foodSum);
  }

  @override
  Widget build(BuildContext context) {
    return Query(
        options: QueryOptions(documentNode: gql(getSummary), variables: {
          "requestSummary": {
            "registrationDate": DateFormat('yyyy-MM-dd').format(DateTime.now()),
            "mealType": widget.mealType.toString().split('.').last,
          }
        }),
        builder: (QueryResult result,
            {VoidCallback refetch, FetchMore fetchMore}) {
          if (result.hasException) {
            print(result.exception);
            return null;
          }

          if (result.loading) {
            return Scaffold(body: Text('Loading'));
          }

          FoodSum intakes = FoodSum.fromJSON(result.data['summary']['intake']);
          if (!widget.isLastTile) {
            return Column(children: [
              MealTile(
                title: widget.title,
                token: widget.token,
                state: this,
                intakes: intakes,
              ),
              Divider(
                  color: Colors.white.withAlpha(100),
                  thickness: 0.4,
                  indent: 15,
                  endIndent: 15)
            ]);
          }

          return MealTile(
              title: widget.title,
              token: widget.token,
              state: this,
              intakes: intakes);
        });
  }
}

class MealTile extends StatelessWidget {
  const MealTile({
    this.title,
    this.token,
    this.intakes,
    this.state,
  });

  final String title;
  final String token;
  final FoodSum intakes;
  final MealCardState state;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        '$title (칼로리: ${intakes?.calorie})',
        style: TextStyle(
            color: Theme.of(context).primaryColorDark,
            fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        '탄수화물: ${intakes?.carbohydrate} / 단백질: ${intakes?.protein} / 지방: ${intakes?.fat}',
        style: TextStyle(color: Colors.white.withAlpha(150)),
      ),
      trailing: IconButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      MealSearchForm(parent: state, token: token)));
        },
        icon: Icon(
          Icons.add,
          color: Theme.of(context).primaryColor,
          size: 30.0,
        ),
      ),
    );
  }
}

const String getSummary = r'''
query Summary($requestSummary: RequestSummary) {
    summary(requestSummary: $requestSummary) {
        intake {
            calorie
            carbohydrate
            protein
            fat
        }
    }
}
''';
