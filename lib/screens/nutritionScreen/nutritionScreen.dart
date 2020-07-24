import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:dreambody/graphql/user/getUserInfo.dart';
import 'package:dreambody/models/User.dart';
import 'nutritionSearchForm.dart';

class NutritionScreen extends StatelessWidget {
  NutritionScreen({Key key, this.token});
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

        User user = User.fromJSON(result.data['userInfo']['user']);

        return Scaffold(
            body: Container(
                padding: EdgeInsets.all(20.0),
                child: NutritionSearchForm(token: token)));
      },
    );
  }
}
