// https://pub.dev/packages/graphql_flutter#-readme-tab-
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:dreambody/.env.dart';

class GraphqlService {
  static final _serverBaseUrl = environment['SERVER_BASE_URL'];

  static final HttpLink _httpLink = HttpLink(
    uri: '$_serverBaseUrl/graphql',
  );

  final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
      GraphQLClient(link: _httpLink, cache: InMemoryCache()));
}

final graphqlService = GraphqlService();
