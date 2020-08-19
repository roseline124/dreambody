import 'package:flutter/material.dart';
import 'package:dreambody/widgets/gradientPageLayout.dart';
import 'package:dreambody/theme/colors.dart';

// screens
import 'summaryBoard/perDayDashboard.dart';
import 'mealBoard/mealDashBoard.dart';
import 'waterDashBoard/waterDashboard.dart';

// query
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:dreambody/models/UserInfo.dart';
import 'mealBoard/types.dart';

const String getUserInfo = r'''
  query getUserInfo {
    userInfo {
        id
        user {
            id
            name
        }
    }
}
''';

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

      if (mealIntakes[MealType.BREAKFAST] != null) {
        totalIntakes.calorie = mealIntakes[MealType.BREAKFAST].calorie;
        totalIntakes.fat = mealIntakes[MealType.BREAKFAST].fat;
        totalIntakes.protein = mealIntakes[MealType.BREAKFAST].protein;
        totalIntakes.carbohydrate =
            mealIntakes[MealType.BREAKFAST].carbohydrate;
      }
      if (mealIntakes[MealType.LUNCH] != null) {
        totalIntakes.calorie = mealIntakes[MealType.LUNCH].calorie;
        totalIntakes.fat = mealIntakes[MealType.LUNCH].fat;
        totalIntakes.protein = mealIntakes[MealType.LUNCH].protein;
        totalIntakes.carbohydrate = mealIntakes[MealType.LUNCH].carbohydrate;
      }
      if (mealIntakes[MealType.DINNER] != null) {
        totalIntakes.calorie = mealIntakes[MealType.DINNER].calorie;
        totalIntakes.fat = mealIntakes[MealType.DINNER].fat;
        totalIntakes.protein = mealIntakes[MealType.DINNER].protein;
        totalIntakes.carbohydrate = mealIntakes[MealType.DINNER].carbohydrate;
      }
      if (mealIntakes[MealType.DESSERT] != null) {
        totalIntakes.calorie = mealIntakes[MealType.DESSERT].calorie;
        totalIntakes.fat = mealIntakes[MealType.DESSERT].fat;
        totalIntakes.protein = mealIntakes[MealType.DESSERT].protein;
        totalIntakes.carbohydrate = mealIntakes[MealType.DESSERT].carbohydrate;
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
                        Text(
                          (totalWater == 0 && currentUser != null)
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
