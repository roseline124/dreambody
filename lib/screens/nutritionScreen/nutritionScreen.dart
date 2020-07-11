import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:dreambody/graphql/user/getUserInfo.dart';
import 'package:dreambody/models/User.dart';
import './nutritionSearch.dart';

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
          return Text(result.exception.toString());
        }

        if (result.loading) {
          return Text('Loading');
        }

        User user = User.fromJSON(result.data['getUserInfo']['user']);

        return Scaffold(
            body: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(user.name),
                    Text(user.email),
                    NutritionSearch(
                      token: token,
                    )
                  ],
                )));
      },
    );
  }
}
