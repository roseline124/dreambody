import 'package:graphql/client.dart';
import 'package:union/union.dart';
import 'package:dreambody/config.dart';
import 'package:gql/ast.dart' show DocumentNode;

GraphQLClient client() {
  final HttpLink _httpLink = HttpLink(
    uri: '$SERVER_BASE_URL/graphql',
  );

  return GraphQLClient(
    cache: InMemoryCache(),
    link: _httpLink,
  );
}

Future<Union2<QueryResult, void>> query(
    {DocumentNode documentNode, Map<String, dynamic> variables}) async {
  final GraphQLClient _client = client();

  final QueryOptions options =
      QueryOptions(documentNode: documentNode, variables: variables);

  final QueryResult result = await _client.query(options);

  if (result.hasException) {
    print(result.exception.toString());
    return null.asSecond();
  }

  return result.asFirst();
}

Future<Union2<QueryResult, void>> performMutation(
    {DocumentNode documentNode, Map<String, dynamic> variables}) async {
  final GraphQLClient _client = client();

  final MutationOptions options =
      MutationOptions(documentNode: documentNode, variables: variables);

  final QueryResult result = await _client.mutate(options);

  if (result.hasException) {
    print(result.exception.toString());
    return null.asSecond();
  }

  return result.asFirst();
}
