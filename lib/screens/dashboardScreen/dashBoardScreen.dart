import 'package:flutter/material.dart';
import 'package:dreambody/widgets/gradientPageLayout.dart';
import 'package:dreambody/theme/colors.dart';

// screens
import 'summaryBoard/perDayDashboard.dart';
import 'mealBoard/mealDashBoard.dart';
import 'waterDashBoard/waterDashboard.dart';

// query
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:dreambody/graphql/user/getUserInfo.dart';
import 'package:dreambody/models/UserInfo.dart';
import 'mealBoard/types.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({this.token});
  final String token;

  @override
  DashBoardScreenState createState() => DashBoardScreenState();
}

class DashBoardScreenState extends State<DashBoardScreen> {
  Map<MealType, FoodSum> mealIntakes = new Map<MealType, FoodSum>();
  FoodSum totalIntakes = FoodSum();
  int totalWater = 0;

  updateWater({@required water}) {
    setState(() {
      totalWater = water;
    });
  }

  updateMealIntakes({@required MealType mealType, @required FoodSum foodSum}) {
    setState(() {
      mealIntakes[mealType] = foodSum;

      if (mealIntakes[MealType.breakfast] != null) {
        totalIntakes.calorie = mealIntakes[MealType.breakfast].calorie;
        totalIntakes.fat = mealIntakes[MealType.breakfast].fat;
        totalIntakes.protein = mealIntakes[MealType.breakfast].protein;
        totalIntakes.carbohydrate =
            mealIntakes[MealType.breakfast].carbohydrate;
      }
      if (mealIntakes[MealType.lunch] != null) {
        totalIntakes.calorie = mealIntakes[MealType.lunch].calorie;
        totalIntakes.fat = mealIntakes[MealType.lunch].fat;
        totalIntakes.protein = mealIntakes[MealType.lunch].protein;
        totalIntakes.carbohydrate = mealIntakes[MealType.lunch].carbohydrate;
      }
      if (mealIntakes[MealType.dinner] != null) {
        totalIntakes.calorie = mealIntakes[MealType.dinner].calorie;
        totalIntakes.fat = mealIntakes[MealType.dinner].fat;
        totalIntakes.protein = mealIntakes[MealType.dinner].protein;
        totalIntakes.carbohydrate = mealIntakes[MealType.dinner].carbohydrate;
      }
      if (mealIntakes[MealType.dessert] != null) {
        totalIntakes.calorie = mealIntakes[MealType.dessert].calorie;
        totalIntakes.fat = mealIntakes[MealType.dessert].fat;
        totalIntakes.protein = mealIntakes[MealType.dessert].protein;
        totalIntakes.carbohydrate = mealIntakes[MealType.dessert].carbohydrate;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Query(
        options: QueryOptions(documentNode: gql(getUserInfo)),
        builder: (QueryResult result,
            {VoidCallback refetch, FetchMore fetchMore}) {
          if (result.hasException) {
            return null;
          }

          if (result.loading) {
            return Scaffold(body: Text('Loading'));
          }

          UserInfo currentUser = UserInfo.fromJSON(result.data['userInfo']);

          return GradientPageLayout(
              child: SingleChildScrollView(
            child: Column(children: [
              PerDayDashboard(intakes: totalIntakes),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WaterDashboard(
                                dashboard: this, currentWater: totalWater)));
                  },
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(100),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 5),
                          child: Image.asset(
                            'static/images/waterDrop.png',
                            height: 30,
                            width: 30,
                          ),
                        ),
                        // todo: 마신 물이 0이 아니면 마신 양을 text로, 아니면 아래 텍스트 보여줌
                        Text(
                          totalWater == 0
                              ? '${currentUser?.user?.name}님, 오늘 마신 물을 기록해보세요!'
                              : '오늘 마신 물의 양은 ${totalWater * 100}ml입니다.',
                          style: TextStyle(
                              color: customColor.primaryDarkColor,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              MealDashBoard(token: widget.token, dashboard: this)
            ]),
          ));
        });
  }
}
