import 'package:flutter/material.dart';
import 'package:dreambody/widgets/gradientPageLayout.dart';
import 'package:dreambody/theme/colors.dart';

// screens
import 'summaryBoard/perDayDashboard.dart';
import 'mealBoard/mealDashBoard.dart';

// query
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:dreambody/graphql/user/getUserInfo.dart';
import 'package:dreambody/models/UserInfo.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({this.token});
  final String token;

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
              PerDayDashboard(intakeCalorie: currentUser.dailyIntakeCalorie),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/water');
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
                          '${currentUser.user.name}님, 오늘 마신 물을 기록해보세요!',
                          style: TextStyle(
                              color: customColor.primaryDarkColor,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              MealDashBoard(token: token)
            ]),
          ));
        });
  }
}
