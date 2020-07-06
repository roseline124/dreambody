// https://pub.dev/packages/graphql_flutter#-readme-tab-
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:dreambody/.env.dart';

GraphQLClient client(String authToken) {
  final serverBaseUrl = environment['SERVER_BASE_URL'];
  final HttpLink _httpLink = HttpLink(
      uri: '$serverBaseUrl/graphql',
      headers: {'Authorization': 'Bearer $authToken'});

  return GraphQLClient(
    cache: InMemoryCache(),
    link: _httpLink,
  );
}
