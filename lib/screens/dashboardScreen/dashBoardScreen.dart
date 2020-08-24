import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:dreambody/widgets/gradientPageLayout.dart';
import 'package:dreambody/theme/colors.dart';

// screens
import 'summaryBoard/perDayDashboard.dart';
import 'mealBoard/mealDashBoard.dart';
import 'waterDashBoard/waterDashboard.dart';

// query
import 'package:graphql_flutter/graphql_flutter.dart';
import 'mealBoard/types.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({this.token});
  final String token;

  @override
  DashBoardScreenState createState() => DashBoardScreenState();
}

class DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    final String nowDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

    return Query(
        options: QueryOptions(documentNode: gql(getSummary), variables: {
          "requestSummary": {
            "registrationDate": nowDate,
          },
          "waterInfoRequest": {
            "registrationDate": nowDate,
          },
        }),
        builder: (QueryResult result,
            {VoidCallback refetch, FetchMore fetchMore}) {
          if (result.hasException) {
            return null;
          }

          if (result.loading) {
            return Scaffold(body: Text('Loading'));
          }

          FoodSum goal = FoodSum.fromJSON(result.data['summary']['goal']);
          FoodSum intake = FoodSum.fromJSON(result.data['summary']['intake']);

          int totalWater = result.data['waterInfo'] != null
              ? result.data['waterInfo']['amountWater']
              : 0;

          return GradientPageLayout(
              child: SingleChildScrollView(
            child: Column(children: [
              PerDayDashboard(
                intakes: intake,
                goals: goal,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WaterDashboard(
                                refetchWater: refetch,
                                currentWater: totalWater)));
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
                          (totalWater == 0)
                              ? '오늘 마신 물을 기록해보세요!'
                              : '오늘 마신 물의 양은 ${totalWater}ml입니다.',
                          style: TextStyle(
                              color: customColor.primaryDarkColor,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              MealDashBoard(
                  token: widget.token, dashboard: this, refetchSummary: refetch)
            ]),
          ));
        });
  }
}

const String getSummary = r'''
query Summary($requestSummary: RequestSummary, $waterInfoRequest: WaterInfoRequest) {
    summary(requestSummary: $requestSummary) {
        goal {
            calorie
            carbohydrate
            protein
            fat
        }
        intake {
            calorie
            carbohydrate
            protein
            fat
        }
    }

    waterInfo(waterInfoRequest: $waterInfoRequest) {
        amountWater
    }
}
''';
