import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:dreambody/graphql/user/getUserInfo.dart';

class NutritionScreen extends StatelessWidget {
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

        String username = result.data['getUserInfo']['user']['name'];

        return Scaffold(body: Container(child: Text(username)));
      },
    );
  }
}
