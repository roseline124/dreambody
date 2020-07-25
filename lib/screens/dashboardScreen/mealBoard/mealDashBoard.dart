import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:dreambody/graphql/user/getUserInfo.dart';
import 'package:dreambody/models/User.dart';
import 'mealSearchForm.dart';

class MealDashBoard extends StatelessWidget {
  MealDashBoard({Key key, this.token});
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
          return Text('Loading');
        }

        User user = User.fromJSON(result.data['userInfo']['user']);

        // return Scaffold(
        //     appBar: AppBar(
        //       backgroundColor: Colors.transparent,
        //       elevation: 0,
        //       leading: BackButton(
        //           color: Theme.of(context).primaryColor,
        //           onPressed: () => Navigator.of(context).pop()),
        //     ),
        //     body: Container(
        //         padding: EdgeInsets.all(20.0),
        //         child: MealSearchForm(token: token)));
        return Container(
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(100),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          child: Text('sdf'),
        );
      },
    );
  }
}
