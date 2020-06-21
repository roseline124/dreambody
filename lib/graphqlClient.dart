import 'package:flutter/material.dart';
import 'package:graphql/client.dart';

final HttpLink _httpLink = HttpLink(
  uri: 'https://api.github.com/graphql',
);

final AuthLink _authLink = AuthLink(
  getToken: () async => 'Bearer eee2ff6f5d1aa4c6618a68c4d7c445c59a0f5ef4',
);

final Link _link = _authLink.concat(_httpLink);

final GraphQLClient _client = GraphQLClient(
  cache: InMemoryCache(),
  link: _link,
);

const String readRepositories = r'''
  query ReadRepositories($nRepositories: Int!) {
    viewer {
      repositories(last: $nRepositories) {
        nodes {
          __typename
          id
          name
          viewerHasStarred
        }
      }
    }
  }
''';
const int nRepositories = 50;

final QueryOptions options = QueryOptions(
  documentNode: gql(readRepositories),
  variables: <String, dynamic>{
    'nRepositories': nRepositories,
  },
);

class GraphqlWidget extends StatelessWidget {
  const GraphqlWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sdkflsdf'),
      ),
      body: Container(
        child: MaterialButton(
          onPressed: () async {
            await queryGraphql();
          },
          child: Text('graphql'),
        ),
      ),
    );
  }

  Future<void> queryGraphql() async {
    final QueryResult result = await _client.query(options);
    if (result.hasException) {
      print(result.exception.toString());
    }

    final List<dynamic> repositories =
        result.data['viewer']['repositories']['nodes'] as List<dynamic>;

    repositories.forEach((item) => print(item));
  }
}
